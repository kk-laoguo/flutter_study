import 'package:flutter/material.dart';
import 'package:flutter_lubo/pages/home/goods/goods_detail.dart';
import 'package:flutter_lubo/pages/home/home.dart';
import 'package:flutter_lubo/pages/main_screen.dart';

class Routers {
  static final Map<String, WidgetBuilder> routers = {
    RouterName.root: (ctx) => const MainPage(),
    RouterName.home: (ctx) => const HomePage(),
    RouterName.goodsdetail: (ctx) => const GoodsDetailPage(),
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}

class RouterName {
  static const root = "/";
  static const home = "/home";
  static const goodsdetail = "/goods/detail";
}
