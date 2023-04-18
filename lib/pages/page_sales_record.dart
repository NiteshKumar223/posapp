import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

class PageSalesRecord extends StatefulWidget {
  const PageSalesRecord({super.key});

  @override
  State<PageSalesRecord> createState() => _PageSalesRecordState();
}

class _PageSalesRecordState extends State<PageSalesRecord> {
  var prod_id = "15230101";
  var prod_name = "Cooler";
  var prod_price = 4599;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        title: Text(
          "Sales Record",
          style: TextStyle(
              fontSize: 22.0,
              color: AppColor.colorWhite,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  leading: const Icon(
                    Icons.file_copy,
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
