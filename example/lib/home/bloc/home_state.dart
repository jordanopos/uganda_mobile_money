part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class PaymentLoading extends HomeState {}

class PaymentLoaded extends HomeState {
  final MomoPayResponse response;
  const PaymentLoaded(this.response);
}

class PaymentError extends HomeState {
  final String message;
  const PaymentError(this.message);
}
