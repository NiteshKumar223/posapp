import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      // stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    )
  );

  int get index => 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.colorWhite,
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
                  "ALBUMID: ${widget.albumId}",
                ),
                const SizedBox(height: 5),
                Text(
                  "ID: ${widget.id}",
                ),
                const SizedBox(height: 5),
                Text(
                  "TITLE: ${widget.title}",
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text(
                  "BODY: ${widget.url}",
                  maxLines: 1,
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildImage(int index) => ClipRRect(
    child: CachedNetworkImage(
      cacheManager: customCacheManager,
      key: UniqueKey(),
      imageUrl: widget.thumbnailUrl,
      height: 80,
      width: 80,
      fit: BoxFit.cover,
      // maxWidthDiskCache: 100,
      placeholder: (context, url) => Center(
        child: Container(color: AppColor.colorLightGray,)),
      errorWidget: (context, url, error) => Container(
        color: AppColor.colorLightGray,
        child: const Icon(Icons.error, color: Colors.red,),
      ),
    )
  );
  // method defined below for clear cache
  void clearCache(){
    imageCache.clear();
    imageCache.clearLiveImages();
    setState(() { });
  }
}
