import 'package:flutter/material.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';
import 'package:pos_app/utils/colors.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController saleLimitController = TextEditingController();
    // saleLimitController = 300000.0 as TextEditingController;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorPrimary,
          title: Text(
            "Settings",
            style: TextStyle(
                fontSize: 22.0,
                color: AppColor.colorWhite,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  // color: AppColor.colorBlack,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      "User Details",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorBlack,
                      ),
                    ),
                    const Card(
                      child: ListTile(
                          title: Text("Employee ID"), subtitle: Text("EMP101")),
                    ),
                    const Card(
                      child: ListTile(
                          title: Text("Employee Name"),
                          subtitle: Text("Rohit Negi")),
                    ),
                    const Card(
                      child: ListTile(
                          title: Text("Employee Mobile No."),
                          subtitle: Text("+91 1234567890")),
                    ),
                    const Card(
                      child: ListTile(
                          title: Text("Employee Email"),
                          subtitle: Text("rohitnegi@gmail.com")),
                    ),
                    SizedBox(
                      height: 180.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            "Maximum Sale limit for online transactions (Monthly)",
                            style: TextStyle(
                              fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorBlack,
                            ),
                          ),
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 65.0,
                                  width: 240.0,
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    controller: saleLimitController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "000000",
                                      contentPadding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColor.colorPrimary),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: AppColor.colorPrimary),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: CustomElevatedBtn(
                                      btnName: "Apply",
                                      onPress: () {},
                                      btnWidth: 100),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
