import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

import '../custom_ui/custom_elev_btn.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/loginbackgrd.jpg"),
            fit: BoxFit.cover,
            // scale: 1.0
          )),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to POS...",
                style: TextStyle(fontSize: 25.0, color: AppColor.colorPrimary),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.colorPrimary),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 110.0,
                  width: 110.0,
                  child: const Icon(
                    Icons.login,
                    size: 100,
                    color: AppColor.colorPrimary,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: SizedBox(
                  height: 200,
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
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final TextEditingController? controller;
  final bool obscure;
  const CustomTextField(
      {super.key, required this.icon, required this.obscure, this.controller});

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
