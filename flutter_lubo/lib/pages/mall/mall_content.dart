import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/const/const_num.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:get/get.dart';
class MallContent extends StatelessWidget {
  const MallContent({Key? key}) : super(key: key);

  static const assets = [
    "assets/images/mall_ic_buyback.png",
    "assets/images/mall_ic_trade.png",
    "assets/images/mall_ic_finance.png",
    "assets/images/mall_ic_apply.png"
  ];
  static final titles = [
    LocaleKeys.buybackOrder.tr,
    LocaleKeys.tradeOrder.tr,
    LocaleKeys.finace.tr,
    LocaleKeys.buybackApply.tr
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16,),
          _buildBottomList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          imagePath + "bg_storage_page.png",
          height: 140,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildItem(0, LocaleKeys.totalOrder.tr),
              _buildItem(0, LocaleKeys.remainTrade.tr),
              _buildItem(0, LocaleKeys.expireTrade.tr),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildItem(int num, String title) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 13, color: LBColor.white, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "$num",
          style: const TextStyle(
              fontSize: 25, color: LBColor.white, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildBottomList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: assets.length,
      itemBuilder: (ctx, index) {
        return Container(
          color: const Color(0xFFF9F9F9),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: ListTile(
            leading: Image.asset(assets[index]),
            title: Text(
              titles[index],
              style: const TextStyle(
                  fontSize: 17,
                  color: LBColor.title,
                  fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }
}
