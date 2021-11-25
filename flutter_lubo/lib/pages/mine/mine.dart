import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:flutter_lubo/pages/mine/mine_header_view.dart';
import 'package:flutter_lubo/pages/mine/mine_menu_content_view.dart';
import 'package:get/get.dart';
class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  static final Map<String, String> orderMap = {
    LocaleKeys.totalOrder.tr: "order_ic_all.png",
    LocaleKeys.waitdeliver.tr: "order_ic_wait.png",
    LocaleKeys.delivered.tr: "order_ic_fahuo.png",
    LocaleKeys.signed.tr: "order_ic_sign.png"
  };
  static final Map<String, String> serversMap = {
    LocaleKeys.myAssets.tr: "mine_ic_zichang.png",
    LocaleKeys.contact.tr: "mine_ic_kefu.png",
    LocaleKeys.aboutUs.tr: "mine_ic_us.png",
    LocaleKeys.logout.tr: "mine_ic_logout.png",
    LocaleKeys.exit.tr: "mine_ic_exit.png"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const MineHeaderView(),
                _buildTitle(LocaleKeys.myOrder.tr),
                MineMenuContentView(
                  map: orderMap,
                ),
                _buildTitle(LocaleKeys.myService.tr),
                MineMenuContentView(
                  map: serversMap,
                ),
              ],
            )
          ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40,
      color: const Color(0xFFF9F9F9),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: LBColor.subtitle),
        ),
      ),
    );
  }
}
