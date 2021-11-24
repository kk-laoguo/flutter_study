import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/model/home_banner_model.dart';
import 'package:flutter_lubo/widgets/swiper.dart';

class HomeBannerView extends StatelessWidget {
  final List<Widget> banners;
  const HomeBannerView({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) {
      return Container();
    }
    return Container(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 3,
            child: Swiper(
              speed: 400,
              children: banners,
              indicator: CircleSwiperIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeBrandView extends StatelessWidget {
  final List<HomeBanner> list;
  const HomeBrandView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Container();
    }
    var children = <Widget>[];

    for (var item in list) {
      Widget widget = Column(children: [
        CachedNetworkImage(
          imageUrl: "https://picsum.photos/40",
          width: 27,
          height: 27,
          placeholder: (ctx, str) {
            return Container(
              width: 27,
              height: 27,
              color: LBColor.randomColor,
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          item.name ?? "",
        )
      ]);
      children.add(widget);
    }
    children.add(Row(
      children: const [
        Text(
          "全部品牌",
          style: TextStyle(fontSize: 14, color: LBColor.subtitle),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
        ),
      ],
    ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
