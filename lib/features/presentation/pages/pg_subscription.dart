import 'dart:async';
import 'package:comptia/core/app_settings/constants/app_assets.dart';
import 'package:comptia/features/presentation/pages/navigations/nav_cntrl.dart';
import 'package:comptia/features/presentation/pages/navigations/pg_const.dart';
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_settings/constants/set_strings.dart';
import '../../../core/app_settings/constants/app_const.dart';
import '../../../core/app_settings/constants/app_dim.dart';
import '../../../core/app_settings/theme/app_colors.dart';

class PageSubscription extends StatefulWidget {
  const PageSubscription({super.key});

  @override
  _PageSubscriptionState createState() => _PageSubscriptionState();
}

class _PageSubscriptionState extends State<PageSubscription> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  bool _available = false;
  List<ProductDetails> _products = [];
  bool _loading = true;
  bool _hasPurchased = false;
  bool _isVerifying = false;

  @override
  void initState() {
    super.initState();
    final purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((purchases) {
      _listenToPurchaseUpdated(purchases);
    }, onDone: () {
      _subscription?.cancel();
    }, onError: (error) {
      print("Purchase stream error: $error");
    });
    _checkPurchaseStatus();
    _initialize();
  }

  Future<void> _checkPurchaseStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _hasPurchased = prefs.getBool('hasPurchased') ?? false;
    setState(() {});
  }

  Future<void> _initialize() async {
    _available = await _inAppPurchase.isAvailable();
    print("In-App Purchase available: $_available");
    if (!_available) {
      setState(() {
        _loading = false;
      });
      return;
    }

    const Set<String> _kIds = {'comptia_quiz_month', 'comptia_quiz_year'};
    final ProductDetailsResponse response =
        await _inAppPurchase.queryProductDetails(_kIds);

    if (response.error != null) {
      // Handle the error.
      print("Error fetching product details: ${response.error}");
      setState(() {
        _loading = false;
      });
      return;
    }

    if (response.productDetails.isEmpty) {
      print("No products found");
      setState(() {
        _loading = false;
      });
      return;
    }

    setState(() {
      _products = response.productDetails;
      _loading = false;
    });
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchases) {
    setState(() {
      _loading = true;
    });
    for (var purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased) {
        print("Purchase successful: ${purchase.productID}");

        _verifyPurchase(purchase);
      } else if (purchase.status == PurchaseStatus.pending) {
        print("Purchase pending: ${purchase.productID}");
      } else if (purchase.status == PurchaseStatus.error) {
        print("Purchase error: ${purchase.error}");
        // Handle error.
      }

      if (purchase.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchase);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  Future<void> _verifyPurchase(PurchaseDetails purchase) async {
    if (purchase.status == PurchaseStatus.purchased) {
      setState(() {
        _isVerifying = true;
      });

      await Future.delayed(Duration(seconds: 2));

      await _inAppPurchase.completePurchase(purchase);

      String purchaseID = purchase.purchaseID ?? "Unknown";
      String transactionDate = DateTime.fromMillisecondsSinceEpoch(
              int.parse(purchase.transactionDate ?? '0'))
          .toIso8601String();
      String productID = purchase.productID;
      String purchaseToken = purchase.verificationData.serverVerificationData;

      _deliverProduct(productID, purchaseID, transactionDate, purchaseToken);

      setState(() {
        _isVerifying = false;
      });
    }
  }

  void _deliverProduct(String productID, String purchaseID,
      String transactionDate, String purchaseToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPurchased', true);
    await prefs.setString('productID', productID);
    await prefs.setString('purchaseID', purchaseID);
    await prefs.setString('transactionDate', transactionDate);
    await prefs.setString('purchaseToken', purchaseToken);
    print(productID);
    print(
      purchaseID,
    );
    print(purchaseToken);
    print(transactionDate);
    setState(() {
      _hasPurchased = true;
    });
    NavigationController.pushToInitial(context, PageConst.dashBoard);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidgetGlobalMargin(
          child: (_loading || _isVerifying)
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.amber,
                ))
              // : _hasPurchased
              //     ? Center(
              //         child: AlertDialog(
              //           title: Text("Purchase Successful"),
              //           content: Text(
              //               "You have already purchased this subscription."),
              //           actions: [
              //             TextButton(
              //               onPressed: () {
              //                 Navigator.of(context).pop();
              //               },
              //               child: Text("OK"),
              //             ),
              //           ],
              //         ),
              //       )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      padVertical(30),
                      SizedBox(
                        height: 50.h,
                        child: Stack(
                          children: [
                            const Center(
                              child: Label(
                                txt: SetString.Subscription,
                                type: TextTypes.f_18_500,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  NavigationController.pushToInitial(
                                      context, PageConst.dashBoard);
                                },
                                icon: const Icon(Icons.cancel),
                              ),
                            ),
                          ],
                        ),
                      ),
                      padVertical(30),
                      const Label(
                        txt: SetString.Select_a_Subscription_Option,
                        type: TextTypes.f_18_500,
                      ),
                      for (var product in _products)
                        _buildSubscriptionOption(product),
                      padVertical(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.lock),
                          Text(
                            SetString.Secured_with_iTune_Cancel_anytime,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: AppConst.fontFamily,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      padVertical(20),
                      TextButton(
                        onPressed: () {
                          _inAppPurchase.restorePurchases();
                        },
                        child: const Text(
                          SetString.Restore_Purchase,
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontFamily: "Circular-Std",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      padVertical(20),
                      TextButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              SetString.Terms_of_use,
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontFamily: "Circular-Std",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              SetString.and,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Circular-Std",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              SetString.Privacy_Policy,
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontFamily: "Circular-Std",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionOption(ProductDetails productDetails) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              border: Border.all(width: 2, color: AppColors.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    txt: productDetails.title,
                    type: TextTypes.f_24_700,
                    forceColor: AppColors.primary,
                  ),
                  padVertical(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Label(
                        txt: productDetails.price,
                        type: TextTypes.f_18_700,
                        forceColor: AppColors.primary,
                      ),
                      SizedBox(
                        height: 35,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            final PurchaseParam purchaseParam =
                                PurchaseParam(productDetails: productDetails);
                            _inAppPurchase.buyNonConsumable(
                                purchaseParam: purchaseParam);
                          },
                          child: const Text("Buy"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 80),
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.gradient,
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              border: Border.all(width: 1.5, color: AppColors.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: Image.asset(AppAssets.crown),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Label(
                    txt: productDetails.id == 'comptia_quiz_month'
                        ? SetString.Basic_Plan
                        : SetString.Premium_Plan,
                    type: TextTypes.f_18_500,
                    forceColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
