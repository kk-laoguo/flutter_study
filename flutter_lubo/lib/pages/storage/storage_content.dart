import 'package:flutter/material.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/pages/storage/storage_header_item.dart';

class StorageContent extends StatelessWidget {
  static final _bottomTitles = [
    S.current.inStorageApply,
    S.current.outStorageApply,
    S.current.applyTransport,
    S.current.monitor
  ];

  static const _bottomImages = [
    "storage_ic_in.png",
    "storage_ic_out.png",
    "storage_ic_logistics.png",
    "storage_ic_monitor.png"
  ];
  const StorageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 10,),
              _buildBottomView(),
            ],
          )),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bg_storage_page.png",
          height: 240,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderTitle(S.of(context).storageData),
            StorageHeaderItem(const [0, 0, 0], 
            [ S.current.inStorage,
              S.current.outStorage,
              S.current.inventory]),
            _buildHeaderTitle(S.of(context).logistisData),
            StorageHeaderItem(
                const [0, 0], [S.current.doing, S.current.finish]),
          ],
        )
      ],
    );
  }

  Widget _buildHeaderTitle(String title) {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
            color: LBColor.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBottomView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _bottomTitles.length,
      itemBuilder: (ctx, index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          color: const Color(0xFFF9F9F9),
          child: ListTile(
            leading: Image.asset("assets/images/${_bottomImages[index]}"),
            title: Text(
              _bottomTitles[index],
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: LBColor.title,
              ),
            ),
          ),
        );
      },
    );
  }
}
