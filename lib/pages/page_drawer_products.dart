import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';
import 'package:pos_app/models/due_data_item.dart';
import 'package:pos_app/utils/colors.dart';
import '../custom_ui/custom_shimmer.dart';
import '../models/model_due_order.dart';
import 'dart:convert';
import 'package:http/http.dart';

import 'page_search_bar.dart';

class PageDrawerProduct extends StatefulWidget {
  const PageDrawerProduct({super.key});

  @override
  PageDrawerProductState createState() => PageDrawerProductState();
}

class PageDrawerProductState extends State<PageDrawerProduct> {
  
  var prod_id = "15230101";
  var prod_name = "Cooler";
  var prod_price = 4599;

  String? scanResult;
  final pIdController = TextEditingController();
  final pNameController = TextEditingController();
  final pPriceController = TextEditingController();
  
  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 100;
  late List<MedelDueData> _posts;
  final int _nextPageTrigger = 3;
  bool isLoadingData = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoadingData = true;
      });
    });
    _pageNumber = 1;
    _posts = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await get(Uri.parse(
          "https://jsonplaceholder.typicode.com/photos?_page=$_pageNumber&_limit=$_numberOfPostsPerRequest"));
      List responseList = json.decode(response.body);
      List<MedelDueData> postList = responseList
          .map((data) => MedelDueData(data['albumId'], data['id'],
              data['title'], data['url'], data['thumbnailUrl']))
          .toList();

      setState(() {
        _isLastPage = postList.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;
        _posts.addAll(postList);
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }
  }

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error occurred when fetching the posts.',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedBtn(
              onPress: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchData();
                });
              },
              btnName: "Retry",
              btnWidth: 100.0,
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.colorPrimary,
        title: const Text("Products"),
      actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PageSearchBar();
              }));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: customDialog(),
                      ));
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: OutlinedButton(
                        onPressed: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    content: customDialog(),
                                  ));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side:
                                  const BorderSide(color: AppColor.colorPrimary))),
                          fixedSize: MaterialStateProperty.all(const Size(170, 40)),
                          side: MaterialStateProperty.all(
                              const BorderSide(color: AppColor.colorPrimary)),
                      ),
                        child: const Text(
                          'Add New Product',
                          style:
                              TextStyle(fontSize: 18, color: AppColor.colorPrimary),
                        ),
                      ),
                    ),
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.height-60,
                child: buildPostsView()),
            ],
          )),
      ),
    );
  }

  Widget buildPostsView() {
    if (_posts.isEmpty) {
      if (_loading) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: CircularProgressIndicator(
            color: AppColor.colorPrimary,
          ),
        ));
      } else if (_error) {
        return Center(child: errorDialog(size: 20));
      }
    }

    return ListView.builder(
        itemCount: _posts.length + (_isLastPage ? 0 : 1),
        itemBuilder: (context, index) {
          if (index == _posts.length - _nextPageTrigger) {
            fetchData();
          }
          if (index == _posts.length) {
            if (_error) {
              return Center(child: errorDialog(size: 15));
            } else {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  color: AppColor.colorPrimary,
                ),
              ));
            }
          }
          final MedelDueData post = _posts[index];
          return isLoadingData
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DueDataItem(
                    post.albumId,
                    post.id,
                    post.title,
                    post.url,
                    post.thumbnailUrl,
                  )
                )
              : buildholdshimmer();
        });
  }

  Widget buildholdshimmer() {
    return Container(
      height: 100,
      color: AppColor.colorWhite,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const SizedBox(
            height: 80,
            width: 80,
            child: CustomShimmer.rectangular(height: 80),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomShimmer.rectangular(
                  height: 15,
                  width: 150,
                ),
                SizedBox(height: 5),
                CustomShimmer.rectangular(
                  height: 15,
                  width: 100,
                ),
                SizedBox(height: 5),
                CustomShimmer.rectangular(height: 15),
                SizedBox(height: 5),
                CustomShimmer.rectangular(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
  customDialog() {
    return Container(
      height: 300.0,
      width: 200.0,
      decoration: BoxDecoration(
        color: AppColor.colorWhite,
      ),
      child: Column(
        children: [
          Container(
            height: 50.0,
            width: 285,
            decoration: const BoxDecoration(
              color: AppColor.colorPrimary,
            ),
            child: Center(
              child: Text(
                "Add New Product",
                style: TextStyle(
                    fontSize: 22.0,
                    color: AppColor.colorWhite,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTxtField(
                    addcontroller: pIdController,
                    labelText: 'Product Id',
                    autoFocus: true,
                    iconbtn: IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: AppColor.colorPrimary,
                      ),
                      onPressed: () => ScanBarCode(),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  CustomTxtField(
                    addcontroller: pNameController,
                    labelText: "Product Name",
                    autoFocus: false,
                  ),
                  const SizedBox(height: 10.0),
                  CustomTxtField(
                    addcontroller: pPriceController,
                    labelText: "Product Price",
                    autoFocus: false,
                  ),
                ]),
          ),
          const Spacer(),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomElevatedBtn(
                btnName: "Add",
                onPress: () {},
                btnWidth: 80,
                elevation: 0.0,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future ScanBarCode() async {
    String scanResult;

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = "Failed to get platform version";
    }
    if (!mounted) return;
    pIdController.text = scanResult;
  }
}

class CustomTxtField extends StatelessWidget {
  final String labelText;
  final IconButton? iconbtn;
  final TextEditingController? addcontroller;
  final bool autoFocus;

  const CustomTxtField(
      {super.key, required this.labelText, this.iconbtn, this.addcontroller,required this.autoFocus});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: addcontroller,
        cursorColor: AppColor.colorPrimary,
        autofocus: autoFocus,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: AppColor.colorPrimary),
          suffix: iconbtn,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.colorPrimary),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.colorPrimary),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }
}
