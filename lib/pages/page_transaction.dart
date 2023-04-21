import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';

class PageTransaction extends StatefulWidget {
  const PageTransaction({super.key});

  @override
  State<PageTransaction> createState() => _PageTransactionState();
}

class _PageTransactionState extends State<PageTransaction> {
  
  var prod_id = "00120121";
  var prod_name = "Fan";
  var prod_price = 1599;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        title: Text(
          "Transaction (Monthly)",
          style: TextStyle(
              fontSize: 22.0,
              color: AppColor.colorWhite,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
        
            Container(
              height: 40.0,
              margin: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.colorPrimaryDark),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Online",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.colorWhite),
                ),
              ),
            ),
            SizedBox(
              height: 322,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: const Icon(
                            Icons.attach_money_outlined,
                            size: 50.0,
                            color: AppColor.colorPrimary,
                          ),
                          title: Text("Product Name: $prod_name"),
                          subtitle: Text("Barcode Id: $prod_id"),
                          trailing: Text("Price: $prod_price")),
                    );
                  }),
            ),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.colorPrimaryDark),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Offline (Cash, QR, Card)",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.colorWhite),
                ),
              ),
            ),
            SizedBox(
              height: 323,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: const Icon(
                            Icons.attach_money_outlined,
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
        ),
      ),
    );
  }
}
 