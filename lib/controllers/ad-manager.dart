import 'package:firebase_admob/firebase_admob.dart';

import '../util/strings.dart';

class AdManager {
  InterstitialAd _interstitialAd;

  AdManager._internal();
  static final AdManager _adManager = AdManager._internal();
  factory AdManager() {
    return _adManager;
  }

  void loadInterAd() {
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: interId,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
        if (event == MobileAdEvent.closed) {
          _interstitialAd?.dispose();
        }
      },
    );
  }
}
