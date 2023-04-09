

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../custom_ui/custom_elev_btn.dart';
import '../pages/page_my_home.dart';
import '../utils/colors.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final focusNode = FocusNode();

  @override
  void dispose() {
    verifyCodeController.dispose();
    focusNode.dispose();
    super.dispose();
  }


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
                    "\t\t\t\t\t\t\tOTP\nVerification",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),
                    ),
                  const SizedBox(height: 30,),
                  const SizedBox(
                    height: 220.0,
                    width: 220.0,
                    child: Image(image: AssetImage("assets/images/entotp.png")),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Enter OTP Recieved through SMS",textAlign: TextAlign.center,),
                  const SizedBox(height: 30,),

                  // SizedBox(
                  //   height: 70.0,
                  //   width: 260.0,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //     _textFieldOtp(first: true, last: false),
                  //     _textFieldOtp(first: false, last: false),
                  //     _textFieldOtp(first: false, last: false),
                  //     _textFieldOtp(first: false, last: false),
                  //     _textFieldOtp(first: false, last: false),
                  //     _textFieldOtp(first: false, last: true),
                  //   ],),
                  // ),

                  SizedBox(
                    width: 250,
                    child: Pinput(
                      controller: verifyCodeController,
                      focusNode: focusNode,
                      autofocus: true,
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      defaultPinTheme: PinTheme(
                        height: 50,
                        width: 40,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: AppColor.colorPrimary,

                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: AppColor.colorWhite,
                          border: Border.all(color: AppColor.colorPrimary),
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                    ),
                  ),
                  
                  // SizedBox(
                  //   height: 50,
                  //   width: 130,
                  //   child: TextFormField(
                  //     controller: verifyCodeController,
                  //     keyboardType: TextInputType.phone,
                  //     cursorColor: AppColor.colorPrimary,
                      
                  //     decoration: InputDecoration(
                  //       prefixIcon: const Icon(Icons.password,color: AppColor.colorPrimary,),
                  //       hintText: "Enter OTP",
                  //       enabledBorder: OutlineInputBorder(
                  //           borderSide:
                  //               const BorderSide(color: AppColor.colorPrimary),
                  //           borderRadius: BorderRadius.circular(25)),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderSide:
                  //               const BorderSide(color: AppColor.colorPrimary),
                  //           borderRadius: BorderRadius.circular(25)),
                  //     ),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomElevatedBtn(
                    btnName: 'Verify',
                    loading: loading,
                    onPress: () async {
                      setState(() {
                        loading = true;
                      });
                      final credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: verifyCodeController.text.toString()
                      );
                      try{
                        await auth.signInWithCredential(credential);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const PageMyHome()));
                      }catch(e){
                        SnackBar(content: Text(e.toString()));
                        setState(() {
                          loading = false;
                        });
                      }
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
  // _textFieldOtp({required bool first, last}){
  //   return Container(
  //     height: 70.0,
  //     child: AspectRatio(
  //       aspectRatio: 0.6,
  //       child: TextField(
  //         controller: verifyCodeController,
  //         // autofocus: true,
  //         onChanged: (value) {
  //           if(value.length == 1 && last == false){
  //             FocusScope.of(context).nextFocus();
  //           }
  //           if(value.length == 0 && first == false){
  //             FocusScope.of(context).previousFocus();
  //           }
  //         },
  //         showCursor: false,
  //         readOnly: false,
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20,
  //         ),
  //         keyboardType: TextInputType.number,
  //         maxLength: 1,
  //         decoration: InputDecoration(
  //           counter: Offstage(),
  //           enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(width: 2,color: AppColor.colorBlack),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(width: 2,color: AppColor.colorPrimary),
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
