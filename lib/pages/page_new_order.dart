// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';
import 'package:pos_app/custom_ui/custom_outl_btn.dart';
import 'package:pos_app/utils/colors.dart';

class PageNewOrder extends StatefulWidget {
  const PageNewOrder({super.key});

  @override
  State<PageNewOrder> createState() => _PageNewOrderState();
}

class _PageNewOrderState extends State<PageNewOrder> {
  var prod_id=202300;
  var prod_name="cooler";
  var prod_price=4599;

  int itemcount = 20;
  
  var total_price=20*4599;


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomOutlBtn(
                  ontap: () {},
                  btnName: 'Add Product',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomOutlBtn(
                  ontap: () {},
                  btnName: 'Hold Bill',
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 270,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.list, size: 50),
                          title: Text("${index + 1}. $prod_id"),
                          subtitle: Text("$prod_name"),
                          trailing: Text("Price: $prod_price")
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 8),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: AppColor.colorPrimary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total Rs: ",
                            style: TextStyle(color: AppColor.colorPrimary),
                          ),
                          Text(
                            "$total_price",
                            style: TextStyle(color: AppColor.colorBlack),
                          )
                        ],
                      ),
                    ),
                    CustomElevatedBtn(
                        elevation: 0.0,
                        btnName: "Place Order",
                        onPress: () {
                          openDialog();
                        },
                        btnWidth: 150.0)
                  ]),
              const SizedBox(height: 5.0),
            ],
          )
        ],
      ),
    );
  }

  Future<dynamic> openDialog() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Select Any One Method"),
        content: SizedBox(
          height: 120,
          child: Column(children: [
            CustomElevatedBtn(
                btnName: "Online", onPress: () {}, btnWidth: 300.0),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedBtn(btnName: "Cash", onPress: () {}, btnWidth: 300.0),
          ]),
        ),
      ),
    );
  }
}
