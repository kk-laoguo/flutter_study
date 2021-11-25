import 'package:flutter/material.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/generated/locales.g.dart';
import 'package:flutter_lubo/pages/storage/storage_content.dart';
import 'package:get/get.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.storage.tr),
      ),
      body: const StorageContent(),
    );
  }
}
