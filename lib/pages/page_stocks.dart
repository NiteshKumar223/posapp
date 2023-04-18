import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:pos_app/utils/colors.dart';

class PageStocks extends StatefulWidget {
  const PageStocks({super.key});

  @override
  State<PageStocks> createState() => _PageStocksState();
}

class _PageStocksState extends State<PageStocks> {
  var prod_id = "00120121";
  var prod_name = "Fan";
  var prod_price = 1599;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        title: Text(
          "Available Stocks",
          style: TextStyle(
              fontSize: 22.0,
              color: AppColor.colorWhite,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height-80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      leading: const Icon(
                        Boxicons.bx_grid,
                        size: 50.0,
                        color: AppColor.colorPrimary,
                      ),
                      title: Text("Product Name: $prod_name"),
                      subtitle: Text("Barcode Id: $prod_id"),
                      trailing: Text("Price: $prod_price")),
                );
              }),
        ),
      ]),
    );
  }
}
