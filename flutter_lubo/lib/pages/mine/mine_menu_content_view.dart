import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/const_num.dart';
import 'package:flutter_lubo/pages/mine/mine_menu_item.dart';

class MineMenuContentView extends StatelessWidget {
  final Map<String, String> map;
  MineMenuContentView({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildContent(context),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    return map.keys.map((e) {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 4.0,
        height: 80,
        child: MineMenuItem(
          title: e, 
          image: imagePath + map[e]!,
        ),
      );
    }).toList();
  }
}
