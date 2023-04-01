import 'package:flutter/material.dart';
import 'package:pos_app/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  const CustomShimmer.rectangular({
    super.key, 
    required this.height, 
    this.width = double.infinity
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.colorLightGray,
      highlightColor: const Color.fromARGB(255, 222, 216, 216),
      child: Container(
        width: width,
        height: height,
        color: AppColor.colorLightGray,
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
}