import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/pages/page_drawer_products.dart';
import 'package:pos_app/pages/page_login.dart';
import 'package:pos_app/pages/page_my_home.dart';
import 'package:pos_app/pages/page_profile.dart';
import 'package:pos_app/pages/page_sales_record.dart';
import 'package:pos_app/pages/page_stocks.dart';
import 'package:pos_app/pages/page_transaction.dart';
import 'package:pos_app/utils/colors.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import '../custom_ui/custom_drawer_item.dart';
import 'page_drawer_onhold.dart';

class PageDrawer extends StatefulWidget {
  const PageDrawer({super.key});

  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageDrawerProduct();
            }));
          },
        ),
        CustomDrawerItem(
          icon: Icons.pause_circle_outline,
          itemName: "On-Hold Bills",
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageDrawerOnHold();
            }));
          },
        ),
        CustomDrawerItem(
          icon: Icons.file_copy,
          itemName: "Sales Record",
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageSalesRecord();
            }));
          },
        ),
        CustomDrawerItem(
          icon: Boxicons.bx_grid,
          itemName: "Stocks",
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageStocks();
            }));
          },
        ),
        CustomDrawerItem(
          icon: Icons.attach_money_outlined,
          itemName: "Transactios",
          ontapp: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PageTransaction();
            }));
          },
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
