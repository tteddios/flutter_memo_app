import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobBanner extends StatefulWidget {
  const AdmobBanner({super.key});

  @override
  State<AdmobBanner> createState() => _AdmobBannerState();
}

class _AdmobBannerState extends State<AdmobBanner> {
  AdManagerBannerAd? _bannerAd;
  bool _isLoaded = false;

  final adUnitId = 'ca-app-pub-3949415609612572/8577322655';

  void loadAd() {
    _bannerAd = AdManagerBannerAd(
      adUnitId: adUnitId,
      request: const AdManagerAdRequest(),
      sizes: [AdSize.banner],
      listener: AdManagerBannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null && _isLoaded) {
      return SizedBox(
        width: _bannerAd!.sizes.first.width.toDouble(),
        height: _bannerAd!.sizes.first.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return Container(height: 1);
  }
}
