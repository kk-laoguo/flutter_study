import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/model/home_list_model.dart';

class HomeListItem extends StatelessWidget {
  final RecommendGoods? model;

  const HomeListItem({Key? key, this.model}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
           const Divider(
            height: 3,
            thickness: 3,
            color: LBColor.line,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    model?.name ?? "",
                    style: const TextStyle(color: LBColor.title, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "${model?.price ?? 0}",
                    style: const TextStyle(fontSize: 16, color: LBColor.ce5c3c),
                    children: const [
                      TextSpan(text: "元", style: TextStyle(fontSize: 13, color: LBColor.ce5c3c)),
                    ]
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                model?.skuName ?? "",
                style: const TextStyle(fontSize: 12, color: LBColor.title),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Text(
              model?.categoryName ?? "",
              style: const TextStyle(fontSize: 12, color: LBColor.subtitle),
            ),
          ),
          Offstage(
            offstage: model?.service == null,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 8),
              child: SizedBox(
                
                child: Text(
                  model?.service ?? "",
                  style: const TextStyle(fontSize: 12, color: LBColor.subtitle),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Divider(
              thickness: 2,
              height: 2,
              color: LBColor.line,
            ),
          ),
          SizedBox(
            height: 38,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                model?.merchantName ?? "",
                style: const TextStyle(fontSize: 12, color: LBColor.title),
              ),
            ),
          )
        ],
      ),
    );
  }
}
