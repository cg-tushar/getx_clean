import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'domain/core/database/storage.dart';
import 'domain/core/network/connectivity/internet_connectivity.dart';
import 'infrastructure/navigation/dependency/dependency.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyCreator.init();
  LocalStorage.instance.initialize();
  ConnectivityCheck.instance.initConnectionCheck();
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
