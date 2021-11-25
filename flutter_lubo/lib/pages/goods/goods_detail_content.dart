import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/utils/toast.dart';
import 'package:flutter_lubo/widgets/swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class GoodsDetailContent extends StatelessWidget {
  GoodsDetailContent({Key? key}) : super(key: key);
  final images = [
    "https://picsum.photos/375/380?random=101",
    "https://picsum.photos/375/280?random=200",
    "https://picsum.photos/375/280?random=300",
    "https://picsum.photos/375/280?random=400"
  ]
      .map((e) => GestureDetector(
            child: CachedNetworkImage(
              imageUrl: e,
              fit: BoxFit.cover,
              placeholder: (ctx, str) {
                return const Center(
                  child: SizedBox(
                    width: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            onTap: () {
              LBToast.showToast(message: "点击了banner"); 
            },
          ))
      .toList();
  final titles = ["价格", "规格", "颜色", "车规", ];
  final subtitles = ["¥69.81万", "2020款  Boxster  2.0T", "黑色", "中规", ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
      SingleChildScrollView(
          child: Column(
           children: [
            _buildBanner(),
            _buildGoodsTitle(),
            _builGoodsAddress(),
            _buildGoodsDetailTitle(),
            _buildBottomList()
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(LBColor.main),
              minimumSize: MaterialStateProperty.all(const Size(280, 40)),
              shape: MaterialStateProperty.all(const StadiumBorder()),
              elevation: MaterialStateProperty.all(10),
            ),
            onPressed: () {
              launch("tel://15506138859");
            },
            child: const Text("电话咨询"),
          ),
        ),
      ]
    );
  }

  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Swiper(
        children: images,
        indicator: CircleSwiperIndicator(),
      ),
    );
  }

  Widget _buildGoodsTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "保时捷718  2020款  Boxster  2.0T",
            style: TextStyle(
                fontSize: 18,
                color: LBColor.title,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _builGoodsAddress() {
    return Column(
      children: [
        const Divider(
          height: 7.5,
          thickness: 7.5,
          color: LBColor.line,
        ),
        SizedBox(
          height: 48,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.business,
                      color: LBColor.main,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "杭州萝泊贸易有限公司",
                      style: TextStyle(fontSize: 14, color: LBColor.title),
                    )
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: LBColor.subtitle,
                  size: 12,
                )
              ],
            ),
          ),
        ),
        const Divider(
          height: 7.5,
          thickness: 7.5,
          color: LBColor.line,
        )
      ],
    );
  }

  Widget _buildGoodsDetailTitle() {
    return const Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "商品详情",
              style: TextStyle(
                  fontSize: 15,
                  color: LBColor.title,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  Widget _buildBottomList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: titles.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          leading: Text(titles[index]),
          title: Text(subtitles[index]),
        );
      },
    );
  }
}
