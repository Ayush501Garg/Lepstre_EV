import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lepster/screens/starting_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class AdMobTestScreen extends StatefulWidget {
  const AdMobTestScreen({super.key});

  @override
  State<AdMobTestScreen> createState() => _AdMobTestScreenState();
}

class _AdMobTestScreenState extends State<AdMobTestScreen> {
  late BannerAd _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  AppOpenAd? _appOpenAd;

  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize();
    _loadBannerAd();
    _loadInterstitialAd();
    _loadRewardedAd();
    _loadAppOpenAd(); // For demonstration only
  }

  // ------------------ Banner Ad ------------------
  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test Banner Ad
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() => _isBannerAdLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          debugPrint('BannerAd failed: $error');
        },
      ),
    )..load();
  }

  // ------------------ Interstitial Ad ------------------
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test Interstitial
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) =>
            debugPrint('InterstitialAd failed: $error'),
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _loadInterstitialAd(); // Reload for next use
    }
  }

  // ------------------ Rewarded Ad ------------------
  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // Test Rewarded
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) => debugPrint('RewardedAd failed: $error'),
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          debugPrint("User earned reward: ${reward.amount}");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Reward earned!")));
        },
      );
      _rewardedAd = null;
      _loadRewardedAd(); // Reload
    }
  }

  // ------------------ App Open Ad (Optional) ------------------
  void _loadAppOpenAd() {
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294', // Test App Open
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
          _appOpenAd!.show();
        },
        onAdFailedToLoad: (error) => debugPrint('AppOpenAd failed: $error'),
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _appOpenAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AdMob Test Ads")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Click buttons below to test ads"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showInterstitialAd,
              child: const Text("Show Interstitial Ad"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showRewardedAd,
              child: const Text("Show Rewarded Ad"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isBannerAdLoaded
          ? SizedBox(
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : const SizedBox(),
    );
  }
}
