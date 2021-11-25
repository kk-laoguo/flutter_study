import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/const/const_num.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:get/get.dart';
class MineHeaderView extends StatelessWidget {
  const MineHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath + "bg_mine_page.png",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          // height: 60,
          child: Container(
            color: Colors.redAccent,
            child: Row(
              children: [
                //  ClipRRect(
                //    borderRadius: BorderRadius.circular(30),
                //   child: Container(
                //     color: Colors.yellow,
                //     width: 60,
                //     child: Image.network("https://picsum.photos/id/237/200/200"),
                //   ),
                // )
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/id/237/200/200"),
                ),
                const Expanded(
                  // ignore: unnecessary_const
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "YYDS",
                      style: TextStyle(
                          fontSize: 18,
                          color: LBColor.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      LocaleKeys.check.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        color: LBColor.white
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: LBColor.white,
                      size: 13,
                    )
                  ],
                ),
                
              ],
            ),
          ),
        ),
        // Positioned(
        //   right: 20,
        //   bottom: 40,
        //   child: Row(
        //     children: [
        //       Text(
        //         S.current.check,
        //         style: const TextStyle(fontSize: 14, color: LBColor.white),
        //       ),
        //       const Icon(
        //         Icons.arrow_forward_ios,
        //         color: LBColor.white,
        //         size: 13,
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
