import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/const/routes.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:flutter_lubo/pages/home/home_controller.dart';
import 'package:flutter_lubo/pages/home/home_item.dart';
import 'package:flutter_lubo/pages/home/home_top_header.dart';
import 'package:flutter_lubo/utils/toast.dart';
import 'package:flutter_lubo/viewmodel/hoem_view_model.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: GetBuilder<HomeController>(
                builder: (controller)  {
                  return _buildHeader(controller);
                },
              ),
            ),
            _buildTitle(),
            _buildListItem(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(HomeController controller) {
    return Column(
      children: [
        HomeBannerView(
            banners: (controller.headerInfo?.banner ?? []).map((e) {
          return GestureDetector(
            child: CachedNetworkImage(
              imageUrl:
                  "https://picsum.photos/450/150?random=${Random().nextInt(200)}",
              fit: BoxFit.cover,
              placeholder: (ctx, str) {
                return const Center(
                  child: SizedBox(
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            onTap: () {
              LBToast.showToast(message: "点击了banner");
            },
          );
        }).toList()),
        const SizedBox(height: 10,),
        HomeBrandView(list: controller.headerInfo?.brandList ?? []),
      ],
    );
  }

  Widget _buildTitle() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "推荐商品",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: LBColor.title),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                child: HomeListItem(
                  model: controller.recommendList?[index],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(RouterName.goodsdetail);
                },
              );
            },
            childCount: controller.recommendList?.length ?? 0,
          ),
        );
      },
    );
  }
}
