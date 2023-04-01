import 'package:flutter/material.dart';
import 'package:pos_app/pages/page_login.dart';
// import 'package:pos_app/pages/page_myhome.dart';
import 'package:pos_app/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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

