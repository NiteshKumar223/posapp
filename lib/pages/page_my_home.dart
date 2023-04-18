import 'package:flutter/material.dart';
import 'package:pos_app/pages/page_drawer.dart';
import 'package:pos_app/pages/page_due_order.dart';
import 'package:pos_app/pages/page_new_bill.dart';
import 'package:pos_app/utils/colors.dart';

import 'page_onhold_bills.dart';



class PageMyHome extends StatefulWidget {
  const PageMyHome({super.key});

  @override
  State<PageMyHome> createState() => _PageMyHomeState();
}

class _PageMyHomeState extends State<PageMyHome>
    with SingleTickerProviderStateMixin {
  late TabController selfcontroller;

  // List of tabbar items
  final List<Widget> tabItems = [
    Column(
      children: [
        Icon(
          Icons.add,
          size: 30,
          color: AppColor.colorWhite,
        ),
        Text(
          "New Bill",
          style: TextStyle(color: AppColor.colorWhite),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.pause_circle_outline,
          size: 30,
          color: AppColor.colorWhite,
        ),
        Text(
          "On-Hold Bills",
          style: TextStyle(color: AppColor.colorWhite),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.list,
          size: 30,
          color: AppColor.colorWhite,
        ),
        Text(
          "Due Order",
          style: TextStyle(color: AppColor.colorWhite),
        )
      ],
    ),
  ];
  // list of body items
  List<Widget> bodyItems = const [PageNewBill(), PageOnHoldBills(), PageDueOrder()];

  int currentIndex = 0;

  @override
  void initState() {
    selfcontroller = TabController(length: 3, vsync: this);
    selfcontroller.addListener(() {
      setState(
        () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    selfcontroller.dispose();
    super.dispose();
  }

  String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
          AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.colorPrimary,
          title: const Text("Saaqee-POS"),
        ),


        drawer: const PageDrawer(),
        body: Container(
          margin: EdgeInsets.zero,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                color: AppColor.colorPrimary,
                child: ListView.builder(
                    itemCount: tabItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 300),
                              margin:
                                  const EdgeInsets.only(left: 1.0, right: 1.0),
                              height: 55.0,
                              width: MediaQuery.of(context).size.width / 3 - 2,
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? AppColor.colorPrimaryDark
                                      : AppColor.colorPrimaryDark,
                                  border: currentIndex == index
                                      ? Border.all(color: AppColor.colorPrimary)
                                      : Border.all(
                                          color: AppColor.colorPrimaryDark)),
                              child: tabItems[index],
                            ),
                          ),
                          Visibility(
                              visible: currentIndex == index,
                              child: Container(
                                height: 5,
                                width: 5,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red),
                              ))
                        ],
                      );
                    }),
              ),

              // main body
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                height: MediaQuery.of(context).size.height - 148,
                width: MediaQuery.of(context).size.width,
                child: bodyItems[currentIndex],
              )
            ],
          ),
        ));
  }
}
