import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_file_widget_test/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  ///  flutter test --update-goldens
  ///    flutter test --update-goldens
  ///      flutter test --update-goldens
  group('Basic Golden', () {
    testGoldens('initial view should look correct', (tester) async {
      await tester.pumpWidgetBuilder(const MyApp());
      await screenMatchesGolden(tester, 'initial_view');

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
      await screenMatchesGolden(tester, 'clicked_1_time_view');
    });
  });

  ///
  group('match Golden file', () {
    testWidgets('match Golden file', (widgetTester) async {
      await widgetTester.pumpWidgetBuilder(const MyApp());
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('goldens/initial_view.png'),
      );

      ///
      // Tap the '+' icon and trigger a frame.
      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pump();
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('goldens/clicked_1_time_view.png'),
      );
    });
  });
  /// second push
}
