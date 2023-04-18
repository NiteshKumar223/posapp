import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/pages/page_login.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:pos_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initAppIntegrity();
  runApp(const MyApp());
}

void initAppIntegrity() {
  FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
// firebaseAppCheck.installAppCheckProviderFactory(
//         PlayIntegrityAppCheckProviderFactory.getInstance());
firebaseAppCheck.activate(androidProvider: AndroidProvider.playIntegrity, appleProvider: AppleProvider.deviceCheck);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pos',
      theme: ThemeData(
        primaryColor: AppColor.colorPrimary,
      ),
      home: const PageLogin(),
    );
  }
}

