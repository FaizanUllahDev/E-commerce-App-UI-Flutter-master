import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shop_app/main.dart' as app;

import 'robots/home_robot.dart';

void main() {
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

          await homeRobot.findTitleTextWidget();

          await homeRobot.scrollUpAndDown();

          await homeRobot.findProductItemWidget();

          await homeRobot.goBack();

          await homeRobot.scrollUpAndDown(scrollUp: true);
        },
      );
    },
  );
}
