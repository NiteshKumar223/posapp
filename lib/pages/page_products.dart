// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter_boxicons/flutter_boxicons.dart';

// import '../custom_ui/custom_elev_btn.dart';
// import '../utils/colors.dart';
// import 'page_search_bar.dart';

// class PageProducts extends StatefulWidget {
//   const PageProducts({super.key});

//   @override
//   State<PageProducts> createState() => _PageProductsState();
// }

// class _PageProductsState extends State<PageProducts> {
//   var prod_id = "15230101";
//   var prod_name = "Cooler";
//   var prod_price = 4599;

//   String? scanResult;
//   final pIdController = TextEditingController();
//   final pNameController = TextEditingController();
//   final pPriceController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: AppColor.colorPrimary,
//         title: const Text("Products"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                 return const PageSearchBar();
//               }));
//             },
//             icon: const Icon(Icons.search),
//           ),
//           IconButton(
//             onPressed: () {
//               showDialog(
//                   barrierDismissible: false,
//                   context: context,
//                   builder: (BuildContext context) => AlertDialog(
//                         contentPadding: EdgeInsets.zero,
//                         content: customDialog(),
//                       ));
//             },
//             icon: const Icon(Icons.qr_code_scanner),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(
//                   width: 350,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
//                     child: OutlinedButton(
//                       onPressed: () {
//                         showDialog(
//                             barrierDismissible: false,
//                             context: context,
//                             builder: (BuildContext context) => AlertDialog(
//                                   contentPadding: EdgeInsets.zero,
//                                   content: customDialog(),
//                                 ));
//                       },
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25.0),
//                             side:
//                                 const BorderSide(color: AppColor.colorPrimary))),
//                         fixedSize: MaterialStateProperty.all(const Size(170, 40)),
//                         side: MaterialStateProperty.all(
//                             const BorderSide(color: AppColor.colorPrimary)),
//                     ),
//                       child: const Text(
//                         'Add New Product',
//                         style:
//                             TextStyle(fontSize: 18, color: AppColor.colorPrimary),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height - 140,
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: 20,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               child: ListTile(
//                                   leading: const Icon(
//                                     Boxicons.bxl_product_hunt,
//                                     size: 50.0,
//                                     color: AppColor.colorPrimary,
//                                   ),
//                                   title: Text("Product Name: $prod_name"),
//                                   subtitle: Text("Barcode Id: $prod_id"),
//                                   trailing: Text("Price: $prod_price")),
//                             );
//                           }),
//                     ),
//                   ],
//                 )
//               ]),
//         ),
//       ),
//     );
//   }

//   customDialog() {
//     return Container(
//       height: 300.0,
//       width: 200.0,
//       decoration: BoxDecoration(
//         color: AppColor.colorWhite,
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 50.0,
//             width: 285,
//             decoration: const BoxDecoration(
//               color: AppColor.colorPrimary,
//             ),
//             child: Center(
//               child: Text(
//                 "Add New Product",
//                 style: TextStyle(
//                     fontSize: 22.0,
//                     color: AppColor.colorWhite,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10.0),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CustomTxtField(
//                     addcontroller: pIdController,
//                     labelText: 'Product Id',
//                     autoFocus: true,
//                     iconbtn: IconButton(
//                       icon: const Icon(
//                         Icons.qr_code_scanner,
//                         color: AppColor.colorPrimary,
//                       ),
//                       onPressed: () => ScanBarCode(),
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   CustomTxtField(
//                     addcontroller: pNameController,
//                     labelText: "Product Name",
//                     autoFocus: false,
//                   ),
//                   const SizedBox(height: 10.0),
//                   CustomTxtField(
//                     addcontroller: pPriceController,
//                     labelText: "Product Price",
//                     autoFocus: false,
//                   ),
//                 ]),
//           ),
//           const Spacer(),
//           const SizedBox(height: 10.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               CustomElevatedBtn(
//                 btnName: "Add",
//                 onPress: () {},
//                 btnWidth: 80,
//                 elevation: 0.0,
//               ),
//             ],
//           ),
//           const SizedBox(height: 5.0),
//         ],
//       ),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Future ScanBarCode() async {
//     String scanResult;

//     try {
//       scanResult = await FlutterBarcodeScanner.scanBarcode(
//         "#ff6666",
//         "Cancel",
//         true,
//         ScanMode.BARCODE,
//       );
//     } on PlatformException {
//       scanResult = "Failed to get platform version";
//     }
//     if (!mounted) return;
//     pIdController.text = scanResult;
//   }
// }

// class CustomTxtField extends StatelessWidget {
//   final String labelText;
//   final IconButton? iconbtn;
//   final TextEditingController? addcontroller;
//   final bool autoFocus;

//   CustomTxtField(
//       {super.key, required this.labelText, this.iconbtn, this.addcontroller,required this.autoFocus});
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 45,
//       child: TextField(
//         controller: addcontroller,
//         cursorColor: AppColor.colorPrimary,
//         autofocus: autoFocus,
//         decoration: InputDecoration(
//           labelText: labelText,
//           labelStyle: const TextStyle(color: AppColor.colorPrimary),
//           suffix: iconbtn,
//           enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: AppColor.colorPrimary),
//               borderRadius: BorderRadius.circular(25)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: AppColor.colorPrimary),
//               borderRadius: BorderRadius.circular(25)),
//         ),
//       ),
//     );
//   }
// }
