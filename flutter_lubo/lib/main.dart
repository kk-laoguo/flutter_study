import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_lubo/const/app_theme.dart';
import 'package:flutter_lubo/const/routes.dart';
import 'package:flutter_lubo/generated/l10n.dart';
import 'package:flutter_lubo/network/http.dart';
import 'package:flutter_lubo/utils/local_cache.dart';
import 'package:flutter_lubo/viewmodel/hoem_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocalCache().init();
    Http.init(baseURL: "https://api.luobotech.com/api/", headers: {
      "version": "1.0.0",
      "app_id": "100",
      "app_platform": "iPhone7,1",
      "referer": "luobotech.com"
    });

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: AppThem.norTheme,
          darkTheme: AppThem.darkTheme,
          initialRoute: RouterName.root,
          routes: Routers.routers,
          onGenerateRoute: Routers.generateRoute,
          onUnknownRoute: Routers.unknownRoute,
          builder: EasyLoading.init(),
        ));
  }
}
