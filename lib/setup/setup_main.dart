import 'package:flutter/material.dart';
import 'package:internsforyou/setup/homescreen/nav.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'Kj9eT8bzLnfOk4tTjRPFrnrRoOdUONFb5Es4c8vY';
  final keyClientKey = 'TInUGQ88j0d7hUrpuDoxj8kOdOwceBtSwEglmmgr';
  // final keyApplicationId = 'KKyeejBJ6gk9GOUECesKTIpQVgcOkeIo3JjLGXFh';
  // final keyClientKey = 'rZUnyegDpnoQRJ43T5k717BgowBUAM6mdRAhX0Tm';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  runApp(sign_it_in());
}

class sign_it_in extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Bottom Navigation Bar Tutorial',
      home: Nav(),
    );
  }
}
