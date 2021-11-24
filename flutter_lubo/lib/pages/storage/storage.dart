import 'package:flutter/material.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/pages/storage/storage_content.dart';

class StoragePage extends StatelessWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).storage),
      ),
      body: const StorageContent(),
    );
  }
}
