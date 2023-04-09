import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 150.0,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              color: AppColor.colorPrimaryDark,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: AppColor.colorWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20,),
                  ListTile(
                    leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColor.colorPrimaryLight,
                        child: Icon(
                          Icons.person,
                          color: AppColor.colorWhite,
                          size: 50,
                        )),
                    title: Text(
                      "Hello",
                      style:
                          TextStyle(fontSize: 15, color: AppColor.colorLightGray),
                    ),
                    subtitle: Text(
                      "John Peter",
                      style: TextStyle(fontSize: 18, color: AppColor.colorWhite),
                    ),
                    trailing: IconButton(
                      icon: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColor.colorPrimaryLight,
                          child: Icon(
                            Icons.edit,
                            color: AppColor.colorIcons,
                          )),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height-175,
              width: MediaQuery.of(context).size.width,
              // color: AppColor.colorBlack,
              child: SingleChildScrollView(
                child: Column(children: const[
                  Card(
                    child: ListTile(title: Text("My Home")),
                  ),
                  Card(
                    child: ListTile(title: Text("Support")),
                  ),
                  Card(
                    child: ListTile(title: Text("Privecy & Policy")),
                  ),
                  Card(
                    child: ListTile(title: Text("Logout")),
                  ),
                ]),
              ),
            )
          ],
        ));
  }
}
