import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memo_app/home.dart';
import 'package:flutter_memo_app/memo_list_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCm_Z2JopRhR5NRqhixIBulwtIAhNShmBM',
      appId: '1:460400204249:android:488ab6c11c3d60c03b21c8',
      messagingSenderId: '460400204249',
      projectId: 'flutter-memo-app-de574',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(MemoListController());
      }),
      home: Home(),
    );
  }
}
