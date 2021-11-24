import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/pages/mine/mine_header_view.dart';
import 'package:flutter_lubo/pages/mine/mine_menu_content_view.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  static final Map<String, String> orderMap = {
    S.current.totalOrder: "order_ic_all.png",
    S.current.waitdeliver: "order_ic_wait.png",
    S.current.delivered: "order_ic_fahuo.png",
    S.current.signed: "order_ic_sign.png"
  };
  static final Map<String, String> serversMap = {
    S.current.myAssets: "mine_ic_zichang.png",
    S.current.contact: "mine_ic_kefu.png",
    S.current.settings: "mine_ic_private.png",
    S.current.aboutUs: "mine_ic_us.png",
    S.current.logout: "mine_ic_logout.png",
    S.current.exit: "mine_ic_exit.png"
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
                _buildTitle(S.current.myOrder),
                MineMenuContentView(
                  map: orderMap,
                ),
                _buildTitle(S.current.myService),
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
