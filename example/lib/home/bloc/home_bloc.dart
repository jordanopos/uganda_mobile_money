import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/home/repository/home_repository.dart';
import 'package:uganda_mobile_money/uganda_mobile_money.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is MakePayment) {
        try {
          emit(PaymentLoading());
          var response = await repository.pay(event.request);
          emit(PaymentLoaded(response));
        } catch (e) {
          print(e.toString());
          emit(PaymentError(e.toString()));
        }
      }
    });
  }
}
