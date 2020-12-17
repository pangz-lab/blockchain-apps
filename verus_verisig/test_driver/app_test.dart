// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Verus VeriSig App", () {
    final menuMessageLink = find.byValueKey("menuMessageText");
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('incomplete input', () async {
      await driver.tap(menuMessageLink);
      await driver.enterText("klasdfalsjdflkajskldfjlkasjdklfjklasklklfjklasjkldfklasfklasjkldfjlkasjkldfjla");
      // a
      // expect(await driver.getText(counterTextFinder), "0");
    });
  });
}