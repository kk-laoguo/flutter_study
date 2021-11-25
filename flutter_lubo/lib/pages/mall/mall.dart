import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:flutter_lubo/pages/mall/mall_content.dart';
import 'package:get/get.dart';
class MallPage extends StatelessWidget {
  const MallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mall.tr),
      ),
      body: MallContent(),
    );
  }
}
