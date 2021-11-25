import 'package:flutter/material.dart';
import 'package:flutter_lubo/pages/goods/goods_detail.dart';
import 'package:flutter_lubo/pages/home/home.dart';
import 'package:flutter_lubo/pages/home/home_binding.dart';
import 'package:flutter_lubo/pages/main_screen.dart';
import 'package:get/route_manager.dart';

class Routers {
  static final Map<String, WidgetBuilder> routers = {
    RouterName.root: (ctx) => const MainPage(),
    RouterName.home: (ctx) => const HomePage(),
    RouterName.goodsdetail: (ctx) => const GoodsDetailPage(),
  };

  static final List<GetPage> getPages = [
    GetPage(
        name: RouterName.root,
        page: () => const MainPage(),
        binding: HomeBinding()),
    GetPage(
        name: RouterName.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(name: RouterName.goodsdetail, page: () => const GoodsDetailPage()),
  ];

}

class RouterName {
  static const root = "/";
  static const home = "/home";
  static const goodsdetail = "/goods/detail";
}
