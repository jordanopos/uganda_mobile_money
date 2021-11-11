Add Mobile Money payments to your flutter apps using the FlutterWave api gateway.

## Features

[x] Recieve Payments through Mobile Money in Uganda
[x] Supports MTN Momo Transactions
[x] Supports Airtel Money Transactions
[x] Verify Charges your have made before adding value

## Getting started

 Get your api keys, head over to https://dashboard.flutterwave.com/settings/apis

 You might also want to read about flutterwaves documentation. For this head to https://developer.flutterwave.com/reference

## Usage
 
Create an instance of the UgandaMobileMoney class.
```dart
const secretKey = "FLWSECK-XXXXX-X"; // flutterwave secret key
UgandaMobileMoney _mobileMoney = UgandaMobileMoney(secretKey); 
```

Initiate Payments
```dart
void chargeClient() async {
    MomoPayResponse response = await _mobileMoney.chargeClient(
        MomoPayRequest(
            txRef: "MC-01928403", // should be unique for each transaction
            amount: "1500", // amount in UGX you want to charge
            email: "tst@gmail.com", // email of the person you want to charge
            phoneNumber: "256123456723", // clients phone number
            fullname: "Ojangole Joran", // full name of client
            redirectUrl: "https://yoursite.com", // redirect url after payment
            voucher: "128373", // useful for vodafone. you can ignore this
            network: UgandaNetwork.mtn // network, can be either mtn or airtel
            ),
        );

    print(response.message);
  }
```
To Verify transactions
```dart
   void verifyTransaction() {
    _mobileMoney.verifyTransaction(taxRef).then((value) {
      if (value == TransactionStatus.failed) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed")));
      } else if (value == TransactionStatus.pending) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Pending")));
      } else if (value == TransactionStatus.success) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Success")));
      } else if (value == TransactionStatus.unknown) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Unknown")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Unknown")));
      }
    });
  }
```

## Additional information

Please contact me if your have any feature requests or file issues via the respository.

You can also buy me a rolex : https://dashboard.flutterwave.com/donate/7nacgysd7ilf