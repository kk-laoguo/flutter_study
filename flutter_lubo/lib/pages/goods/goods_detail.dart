import 'package:flutter/material.dart';
import 'package:flutter_lubo/pages/goods/goods_detail_content.dart';

class GoodsDetailPage extends StatelessWidget {
  const GoodsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("商品详情"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GoodsDetailContent(),
    );
  }
}
