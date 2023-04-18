import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

import '../custom_ui/custom_elev_btn.dart';
import 'page_login_with_phone.dart';
import 'page_my_home.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 198, 220, 216)
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Welcome to Saaqee POS...",
                  style: TextStyle(fontSize: 25.0, color: AppColor.colorPrimary),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'assets/images/loginAcc.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: SizedBox(
                    height: 270,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            height: 50.0,
                            child: CustomTextField(
                              controller: null,
                              icon: Icon(
                                Icons.email,
                                color: AppColor.colorPrimary,
                              ),
                              obscure: false,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            height: 50.0,
                            child: CustomTextField(
                              controller: null,
                              icon: Icon(
                                Icons.password,
                                color: AppColor.colorPrimary,
                              ),
                              obscure: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomElevatedBtn(
                            btnName: 'Login',
                            onPress: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const PageMyHome()));
                            },
                            btnWidth: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          CustomElevatedBtn(
                            btnName: 'Login With Phone Number',
                            onPress: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const PageLoginWithPhone()));
                            },
                            btnWidth: MediaQuery.of(context).size.width,
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Icon? icon;
  final TextEditingController? controller;
  final bool obscure;
  const CustomTextField(
      {super.key, this.icon, required this.obscure, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      obscuringCharacter: '*',
      cursorColor: AppColor.colorPrimary,
      decoration: InputDecoration(
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.colorPrimary),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.colorPrimary),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
