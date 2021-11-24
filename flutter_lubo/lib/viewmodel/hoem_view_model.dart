import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lubo/model/home_banner_model.dart';
import 'package:flutter_lubo/model/home_list_model.dart';
import 'package:flutter_lubo/network/http.dart';
import 'package:flutter_lubo/network/response.dart';

class HomeViewModel extends ChangeNotifier {
  HomeHeaderInfo? _headerInfo;
  List<RecommendGoods>? _recommendList;
  HomeHeaderInfo? get headerInfo => _headerInfo;
  List<RecommendGoods>? get recommendList => _recommendList;

  void setHeaderInfo(HomeHeaderInfo? headerInfo) {
    _headerInfo = headerInfo;
    notifyListeners();
  }

  void setRecommendList(List<RecommendGoods>? list) {
    _recommendList = list;
    notifyListeners();
  }

  Future<Result<HomeHeaderInfo>> requestHomeHeaderInfo() async {
    try {
      RequestResponse response = await Http.get("index/main");
      HomeHeaderInfo info = HomeHeaderInfo.fromJson(response.data ?? {});
      setHeaderInfo(info);
      debugPrint("headerInfo ====  " + info.toString());
      return Result.completed(info);
    } on DioError catch (e) {
      debugPrint("debug ====" + e.toString());
      return Result.error(e.error);
    }
  }

  Future requestHomeList() async {
    try {
      RequestResponse response = await Http.get("index/recommend");
      List<dynamic> list = response.data;
      List<RecommendGoods> goods =
          list.map((e) => RecommendGoods.fromJson(e)).toList();
      setRecommendList(goods);
      debugPrint("recommend ====  " + goods.toString());

      return Result.completed(goods);
    } on DioError catch (e) {
      debugPrint("debug === " + e.toString());
      return Result.error(e.error);
    }
  }
}
