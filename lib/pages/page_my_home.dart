import 'package:flutter/material.dart';
import 'package:pos_app/pages/page_due_order2.dart';
import 'package:pos_app/pages/page_drawer.dart';
import 'package:pos_app/pages/page_hold_bills.dart';
import 'package:pos_app/pages/page_new_order.dart';
import 'package:pos_app/pages/page_search_bar.dart';
import 'package:pos_app/utils/colors.dart';

import '../custom_ui/custom_scan_dialog.dart';

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
  List<Widget> bodyItems = const [PageNewOrder(), PageHoldBills(), PageDueOrder()];

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

            // for scrollable appbar

            //     SliverAppBar.medium(
            //       expandedHeight: 250.0,
            //       backgroundColor: AppColor.colorPrimary,
            //       leading: IconButton(
            //         icon: Icon(Icons.menu),
            //         onPressed: () {},
            //       ),
            //       title: Padding(
            //         padding: const EdgeInsets.all(10),
            //         child: Container(
            //           height: 50.0,
            //           decoration: BoxDecoration(
            //               color: AppColor.colorWhite,
            //               // border: Border.all(),
            //               borderRadius: BorderRadius.circular(10.0)),
            //           child: Row(children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 20.0),
            //               child: Text(
            //                 "Search",
            //                 style: TextStyle(
            //                     color: AppColor.colorDarkGray, fontSize: 16.0),
            //               ),
            //             ),
            //             Spacer(),
            //             Padding(
            //               padding: const EdgeInsets.only(right: 5.0),
            //               child: IconButton(
            //                 onPressed: () {},
            //                 icon: Icon(
            //                   Icons.qr_code_scanner,
            //                   color: AppColor.colorPrimary,
            //                 ),
            //               ),
            //             )
            //           ]
            //         )
            //       )
            //     )
            // // )]
            // ),

            AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.colorPrimary,
          title: const Text("Saaqee-POS"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PageSearchBar();
                }));
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: CustomDialog(),
                      )),
              icon: const Icon(Icons.qr_code_scanner),
            )
          ],
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
                                    color: Color.fromARGB(255, 113, 161, 244)),
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
