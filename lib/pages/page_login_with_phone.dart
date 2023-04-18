import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/auths/verify_code_screen.dart';
import '../custom_ui/custom_elev_btn.dart';
import '../utils/colors.dart';

class PageLoginWithPhone extends StatefulWidget {
  const PageLoginWithPhone({super.key});

  @override
  State<PageLoginWithPhone> createState() => _PageLoginWithPhoneState();
}

class _PageLoginWithPhoneState extends State<PageLoginWithPhone> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        centerTitle: true,
        title: const Text("Login With Phone"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: AppColor.colorPrimaryLight,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "\t\t\t\t\t\t\tMobile\nAuthentication",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                    ),
                  const SizedBox(height: 30,),
                  const SizedBox(
                    height: 220.0,
                    width: 220.0,
                    child: Image(image: AssetImage("assets/images/mobnum.png")),
                  ),
                  const SizedBox(height: 30,),
                  const Text("One Time Password will sent on provided mobile number",textAlign: TextAlign.center,),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: TextFormField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.colorPrimary,
                          letterSpacing: 2.0
                        ),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 20),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(top: 8.5,left: 10),
                            child: Text("+91",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColor.colorPrimary),),
                          ),
                          hintText: "Enter Mobile Number",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColor.colorPrimary),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColor.colorPrimary),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomElevatedBtn(
                    btnName: 'Send OTP',
                    loading: loading,
                    onPress: () {
                      const Center(child: CircularProgressIndicator());
                      setState(() {
                        loading = true;
                      });
                      const Center(child: CircularProgressIndicator());
                      
            
                      auth.verifyPhoneNumber(
                          phoneNumber: "+91${phoneNumberController.text}",
                          verificationCompleted: (context) {
                            setState(() {
                              loading = false;
                            });
                          },
                          verificationFailed: ((e) {
                            setState(() {
                              loading = false;
                            });
                            SnackBar(content: Text(e.toString()));
             
                            setState(() {
                              loading = false;
                            });
                          }),
                          codeSent: (String verificationId, int? token) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen(
                                      verificationId: verificationId,
                                    )));
                          },
                          codeAutoRetrievalTimeout: (e) {
                            SnackBar(content: Text(e.toString()));
                            setState(() {
                              loading = false;
                            });
                          });
                    },
                    btnWidth: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
