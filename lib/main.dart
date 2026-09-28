import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gratikey/presentation/bottomnavigation/bottomnavigation/appbinding.dart';
import 'package:gratikey/presentation/others/splash.dart';

import 'data/controllers/journalcontroller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(
    JournalController(),
    permanent: true,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
