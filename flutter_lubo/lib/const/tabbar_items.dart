import 'package:flutter/material.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:flutter_lubo/pages/home/home.dart';
import 'package:flutter_lubo/pages/mall/mall.dart';
import 'package:flutter_lubo/pages/mine/mine.dart';
import 'package:flutter_lubo/pages/storage/storage.dart';
import 'package:get/get.dart';
class TabBars {
  static const List<Widget> pages = [
    HomePage(),
    StoragePage(),
    MallPage(),
    MinePage(),
  ];
  static final items = ["home", "finance", "mall", "my"].map((e) {
    String title = "";
    switch (e) {
      case "home":
        title = LocaleKeys.home.tr;
        break;
      case "finance":
        title = LocaleKeys.storage.tr;
        break;
      case "mall":
        title = LocaleKeys.mall.tr;
        break;
      case "my":
        title = LocaleKeys.mine.tr;
        break;
      default:
    }
    return BottomNavigationBarItem(
      label: title, 
      icon: norImage(e),
      activeIcon: selectImage(e));
  }).toList();

  static Widget norImage(String name) {
    //gaplessPlayback 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁\
    return Image.asset("assets/images/tab_${name}_n.png", gaplessPlayback: true,);
  }

  static Widget selectImage(String name) {
    return Image.asset("assets/images/tab_${name}_s.png", gaplessPlayback: true,);
  }
}
