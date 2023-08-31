import 'package:example/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uganda_mobile_money/uganda_mobile_money.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc? homeBloc;

  @override
  void initState() {
    homeBloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutterwave Uganda Mobile Money")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          ElevatedButton(
            onPressed: () => homeBloc!.add(
              MakePayment(
                MomoPayRequest(
                  // this should be made randomly
                    txRef: "rtrr",
                    amount: "5000",
                    email: "example@gmail.com",
                    phoneNumber: "256772390290",
                    fullname: "Ojangole Jordan",
                    redirectUrl: "https://example.com",
                    voucher: "",
                    network: UgandaNetwork.mtn),
              ),
            ),
            child: Center(
              child: Text("Make Payment"),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is PaymentLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is PaymentLoaded) {
                return Center(child: Text(state.response.message));
              } else if (state is PaymentError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return Center(
                child: Text(
                  state.toString(),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
