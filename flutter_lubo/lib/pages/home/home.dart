import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/const/routes.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/pages/home/home_item.dart';
import 'package:flutter_lubo/pages/home/home_top_header.dart';
import 'package:flutter_lubo/utils/toast.dart';
import 'package:flutter_lubo/viewmodel/hoem_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeViewModel homeVM = Provider.of<HomeViewModel>(context, listen: false);
    homeVM.requestHomeHeaderInfo();
    homeVM.requestHomeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer<HomeViewModel>(
                builder: (ctx, vm, child) {
                  return _buildHeader(vm);
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

  Widget _buildHeader(HomeViewModel vm) {
    return Column(
      children: [
        HomeBannerView(
            banners: (vm.headerInfo?.banner ?? []).map((e) {
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
        HomeBrandView(list: vm.headerInfo?.brandList ?? []),
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
    return Consumer<HomeViewModel>(
      builder: (ctx, vm, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                child: HomeListItem(
                  model: vm.recommendList?[index],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(RouterName.goodsdetail);
                },
              );
            },
            childCount: vm.recommendList?.length ?? 0,
          ),
        );
      },
    );
  }
}
