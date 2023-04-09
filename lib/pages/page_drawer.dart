import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/custom_ui/custom_scan_dialog.dart';
import 'package:pos_app/pages/page_login.dart';
import 'package:pos_app/pages/page_my_home.dart';
import 'package:pos_app/pages/page_profile.dart';
import 'package:pos_app/utils/colors.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import '../custom_ui/custom_drawer_item.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({super.key});

  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  void signoutme() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 90.0,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 25.0,
            color: AppColor.colorPrimaryDark,
          ),
          const SizedBox(
            height: 15.0,
          ),
          buildMenuItems(context),
        ]),
      ),
    );
  }

  buildMenuItems(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomDrawerItem(
          icon: Icons.home,
          itemName: "Home",
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageMyHome();
            }));
          },
        ),
        CustomDrawerItem(
          icon: Boxicons.bxs_box,
          itemName: "Product",
          ontapp: () {},
        ),
        CustomDrawerItem(
          icon: Icons.qr_code_scanner,
          itemName: "Scan Code",
          ontapp: () => showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: CustomDialog(),
            ),
          ),
        ),
        CustomDrawerItem(
          icon: Icons.pause_circle_outline,
          itemName: "On-Hold Bills",
          ontapp: () {},
        ),
        CustomDrawerItem(
          icon: Icons.file_copy,
          itemName: "Sales Record",
          ontapp: () {},
        ),
        CustomDrawerItem(
          icon: Icons.attach_money_outlined,
          itemName: "Transactios",
          ontapp: () {},
        ),
        CustomDrawerItem(
          icon: Icons.settings,
          itemName: "Settings",
          ontapp: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return const PageProfile();
              })
            );
          },
        ),
        CustomDrawerItem(
          icon: Icons.power_settings_new,
          itemName: "Logout",
          ontapp: () {
            setState(() {
              // signoutme();
            });
            signoutme();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return const PageLogin();
            })
            );
          },
        ),
      ],
    );
  }
}
