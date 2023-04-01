import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';
import 'package:http/http.dart' as http;

import '../custom_ui/custom_shimmer.dart';
import '../models/model.dart';

class PageHoldBills extends StatefulWidget {
  const PageHoldBills({super.key});

  @override
  State<PageHoldBills> createState() => _PageHoldBillsState();
}

class _PageHoldBillsState extends State<PageHoldBills> {
  bool isLoadingData = false;
  List<Welcomenk> nkdata = [];
  bool hasMoreData = true;

  

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoadingData = true;
      });
    });
  }

  Future<List<Welcomenk>> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        nkdata.add(Welcomenk.fromJson(index));
      }
      return nkdata;
    } else {
      return nkdata;
    }
  }



  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: nkdata.length,
                itemBuilder: (context, index) {
                  return isLoadingData
                      ? Container(
                          color: const Color.fromARGB(255, 166, 198, 194),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          margin: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: buildImage(index)),
                                  // Image.network(
                                  //     "${nkdata[index].thumbnailUrl}")),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AlbumId: ${nkdata[index].albumId} ",
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Id: ${nkdata[index].id}",
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Title: ${nkdata[index].title}",
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Body: ${nkdata[index].url}",
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : buildholdshimmer();
                });
          } else {
            return
                //buildholdshimmer();
                const Center(
              child: CircularProgressIndicator(
                color: AppColor.colorPrimary,
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildholdshimmer() {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 166, 198, 194),
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
  
  Widget buildImage(int index) => ClipRRect(
    // borderRadius: BorderRadius.circular(10),
    child: CachedNetworkImage(
      imageUrl: nkdata[index].thumbnailUrl,
      height: 80,
      width: 80,
      fit: BoxFit.cover,
      placeholder: (context, url) => 
      const Center(child: CircularProgressIndicator(color: AppColor.colorPrimary,),),
    )
  );
}
