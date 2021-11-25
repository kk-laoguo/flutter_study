import 'package:dio/dio.dart';
import 'package:flutter_lubo/model/home_banner_model.dart';
import 'package:flutter_lubo/model/home_list_model.dart';
import 'package:flutter_lubo/network/http.dart';
import 'package:flutter_lubo/network/response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeHeaderInfo? _headerInfo;
  List<RecommendGoods>? _recommendList;

  HomeHeaderInfo? get headerInfo => _headerInfo;
  List<RecommendGoods>? get recommendList => _recommendList;

  @override
  void onInit() {
    super.onInit();
    requestHomeHeaderInfo();
    requestHomeList();
  }

  void setHeaderInfo(HomeHeaderInfo? headerInfo) {
    _headerInfo = headerInfo;
    update();
  }

  void setRecommendList(List<RecommendGoods>? list) {
    _recommendList = list;
    update();
  }

  Future requestHomeList() async {
    try {
      RequestResponse response = await Http.get("index/recommend");
      List<dynamic> list = response.data;
      List<RecommendGoods> goods =
          list.map((e) => RecommendGoods.fromJson(e)).toList();
      setRecommendList(goods);
    } on DioError catch (e) {
      return Result.error(e.error);
    }
  }

  Future<Result<HomeHeaderInfo>> requestHomeHeaderInfo() async {
    try {
      RequestResponse response = await Http.get("index/main");
      HomeHeaderInfo info = HomeHeaderInfo.fromJson(response.data ?? {});
      setHeaderInfo(info);
      return Result.completed(info);
    } on DioError catch (e) {
      return Result.error(e.error);
    }
  }
}
