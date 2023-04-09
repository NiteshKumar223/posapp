import 'package:flutter/material.dart';
import 'package:pos_app/custom_ui/custom_elev_btn.dart';
import 'package:pos_app/utils/due_data_item.dart';
import 'package:pos_app/utils/colors.dart';
import '../custom_ui/custom_shimmer.dart';
import '../models/model_due_order.dart';
import 'dart:convert';
import 'package:http/http.dart';

class PageDueOrder extends StatefulWidget {
  const PageDueOrder({super.key});

  @override
  PageDueOrderState createState() => PageDueOrderState();
}

class PageDueOrderState extends State<PageDueOrder> {
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
    return buildPostsView();
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
