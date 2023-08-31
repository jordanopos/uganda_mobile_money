import 'package:uganda_mobile_money/uganda_mobile_money.dart';

abstract class HomeRepository {
  Future<MomoPayResponse> pay(MomoPayRequest request);
}

class HomeImpl extends HomeRepository {
  @override
  Future<MomoPayResponse> pay(MomoPayRequest request) async {
    UgandaMobileMoney client = UgandaMobileMoney(
        secretKey: "FLWSECK_TEST......................");

    MomoPayResponse response = await client.chargeClient(request);

    return response;
  }
}
