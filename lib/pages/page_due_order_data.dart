import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/custom_ui/custom_shimmer.dart';

import '../utils/colors.dart';

// ignore: must_be_immutable
class DueDataItem extends StatefulWidget {
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  DueDataItem(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl, {super.key}
  );

  @override
  State<DueDataItem> createState() => _DueDataItemState();
}

class _DueDataItemState extends State<DueDataItem> {
  int get index => 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 166, 198, 194),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: [
          SizedBox(
              height: 80, 
              width: 80, 
              child: buildImage(index)),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AlbumId: ${widget.albumId} ",
                ),
                const SizedBox(height: 5),
                Text(
                  "Id: ${widget.id}",
                ),
                const SizedBox(height: 5),
                Text(
                  "Title: ${widget.title}",
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  "Body: ${widget.url}",
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildholdshimmer() {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 166, 198, 194),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      // margin: const EdgeInsets.all(10.0),
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
      imageUrl: widget.thumbnailUrl,
      height: 80,
      width: 80,
      fit: BoxFit.cover,
      placeholder: (context, url) => 
      const Center(child: CircularProgressIndicator(color: AppColor.colorPrimary,),),
    )
  );
}
