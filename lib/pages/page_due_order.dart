import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PageDueOrder extends StatefulWidget {
  const PageDueOrder({super.key});

  @override
  State<PageDueOrder> createState() => _PageDueOrderState();
}

class _PageDueOrderState extends State<PageDueOrder> {
  var prod_id = 86590000;
  var prod_name = "Air Condition";
  var prod_price = 24599;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading: const Icon(
                    Icons.feed,
                    size: 50.0,
                    color: AppColor.colorPrimary,
                  ),
                  title: Text("Product Name: $prod_name"),
                  subtitle: Text("Barcode Id: $prod_id"),
                  trailing: Text("Price: $prod_price")),
            );
          }),
    );
  }
}
