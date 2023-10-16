import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_app/screens/home/home_screen.dart';

class HomeRobot {
  final WidgetTester tester;

  HomeRobot(this.tester);

  // find title text widget
  Future<void> findTitleTextWidget() async {
    await tester.pumpAndSettle();
    expect(find.text(HomeStrings.title), findsOneWidget);
    sleep(const Duration(seconds: 3));
  }

  // scroll up & Down
  Future<void> scrollUpAndDown({bool scrollUp = false}) async {
    final listFinder = find.byKey(Key(HomeStrings.productsListKey));
    final speed = 10000.0;
    final textForScroll = scrollUp ? HomeStrings.title : HomeStrings.title;
    final offset = scrollUp ? Offset(0.0, 500) : Offset(0.0, -500);
    // to scroll
    await tester.fling(listFinder, offset, speed);
    await tester.pumpAndSettle();

    expect(find.text(textForScroll), findsOneWidget);

    // get list of products

    sleep(const Duration(seconds: 3));
  }

  // find product item widget
  Future<void> findProductItemWidget({int btnval = 04}) async {
    final btnFinder = find.byKey(Key('${HomeStrings.btnKey}$btnval'));
    await tester.ensureVisible(btnFinder);
    await tester.tap(btnFinder);
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 3));
  }

  // go back
  Future<void> goBack() async {
    // backButtonKey
    await tester.tap(find.byKey(Key(HomeStrings.backButtonKey)));
    await tester.pumpAndSettle();
    sleep(const Duration(seconds: 3));
  }

  // tap on add to cart button
  Future<void> tapOnAddToCartButton() async {
    await tester.tap(find.byKey(Key('addToCartButton')));
    await tester.pumpAndSettle();
  }

  Future<void> tapOnCartButton() async {
    await tester.tap(find.byKey(Key('cartButton')));
    await tester.pumpAndSettle();
  }
}
