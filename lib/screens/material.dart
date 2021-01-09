import 'dart:async';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens.dart';
import '../controllers/sharedprefs.dart';
import '../providers/theme_manager.dart';
import '../util/strings.dart';

class MyMaterialApp extends StatefulWidget {
  MyMaterialApp({Key key}) : super(key: key);
  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp>
    with WidgetsBindingObserver {
  double _bottomPadding = 0.0;
  BannerAd _bannerAd;
  Timer _timer;
  InterstitialAd _interstitialAd;
  AppLifecycleState _state = AppLifecycleState.resumed;
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _state = state;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _bannerAd = createBannerAd();
    _interstitialAd = InterstitialAd(
      adUnitId: interId,
      listener: (event) {
        if (event == MobileAdEvent.failedToLoad) {
          print(event);
        }
      },
    );
    _timer = Timer.periodic(
        Duration(
          minutes: 1,
        ), (timer) async {
      DateTime time = DateTime.now();
      String prefTime = await getTime();
      if (prefTime == null) {
        await setTime(time.toString());
      } else {
        Duration difference = time.difference(DateTime.parse(prefTime));
        if (_state == AppLifecycleState.resumed && difference.inMinutes > 10) {
          _interstitialAd
            ..load()
            ..show();
          await setTime(time.toString());
        }
      }
    });
  }

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerId,
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          if (_bottomPadding != 0.0)
            setState(() {
              _bottomPadding = 0.0;
            });
        }
        if (event == MobileAdEvent.loaded) {
          if (_bottomPadding != 50.0)
            setState(() {
              _bottomPadding = 50.0;
            });
        }
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _bannerAd?.dispose();
    _timer.cancel();
    _interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder: (context, themeManager, _) {
      return MaterialApp(
        theme: themeManager.themeData,
        title: 'दिव्याेपदेश',
        home: Home(),
        routes: {
          '/bookmarks': (ctx) => Bookmarks(),
          '/settings': (ctx) => Settings(),
          '/search': (ctx) => Search(),
          '/aboutApp': (ctx) => AboutApp(),
          '/aboutUs': (ctx) => AboutUs(),
          '/theme': (ctx) => ThemeChooser(),
        },
        builder: (context, widget) {
          if (_state == AppLifecycleState.resumed)
            _bannerAd
                .load()
                .then((value) => {
                      if (value) {_bannerAd.show()}
                    })
                .catchError((err) {
              print(err);
            });
          return Padding(
            padding: EdgeInsets.only(
              bottom: _bottomPadding,
            ),
            child: widget,
          );
        },
      );
    });
  }
}
