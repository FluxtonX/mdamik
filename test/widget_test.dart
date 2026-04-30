// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:mdamik/app/app.dart';

import 'package:mdamik/core/localization/locale_provider.dart';

void main() {
  testWidgets('Splash renders', (WidgetTester tester) async {
    await tester.pumpWidget(App(localeProvider: LocaleProvider()));

    expect(find.text('Welcome to'), findsOneWidget);
    expect(find.text('Build Your Future'), findsOneWidget);

    // Let the splash timer complete so no pending timers remain.
    await tester.pump(const Duration(milliseconds: 3100));
  });
}
