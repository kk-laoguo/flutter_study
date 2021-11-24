import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
class StorageHeaderItem extends StatelessWidget {
  final List<int> _nums;
  final List<String> _titles;

  const StorageHeaderItem(this._nums, this._titles, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < _nums.length; i++) {
      items.add(_buildItem(_nums[i], _titles[i]));
    }
    return Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: items.map((e) {
              return Container(
                color: Colors.grey,
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width) / 3.0,
                  child: e,
                ),
              );
            }).toList(),
          ),
        ));
  }

  Widget _buildItem(int num, String title) {
    return Column(
      children: [
        Text(
          "$num",
          style: const TextStyle(
              fontSize: 18, 
              color: LBColor.white, 
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(153, 255, 255, 255),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}