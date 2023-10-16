import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as path;
import 'package:shop_app/main.dart' as app;

import 'robots/home_robot.dart';


void main() async {
  final IntegrationTestWidgetsFlutterBinding binding =
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();


  HomeRobot homeRobot;
  group(
    'e2e test',
        () {
      binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
      testWidgets(
        'whole app test',
            (tester) async {
          app.main();

          homeRobot = HomeRobot(tester);

          sleep(const Duration(seconds: 5));

          // await writeData("start from Home screen");

          await homeRobot.findTitleTextWidget();

          // await writeData("find title text widget");

          await homeRobot.scrollUpAndDown();

          // await writeData("scroll up and down");

          await homeRobot.findProductItemWidget();

          // await writeData("find product item widget");

          await homeRobot.goBack();

          // await writeData("go back");

          await homeRobot.scrollUpAndDown(scrollUp: true);

          // await writeData("scroll up and down");
          // await writeData("DONE !");
        },
      );
    },
  );
}
