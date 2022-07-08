import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ncl_assignment/presentation/cruise_ship_info/cruise_ship_info.dart';
import 'package:ncl_assignment/presentation/home_screen.dart';
import 'package:ncl_assignment/presentation/home_screen_keys.dart';

void main() {
  Widget homeScreen() {
    return const ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }

  testWidgets('HomeScreen test', (WidgetTester tester) async {
    await tester.pumpWidget(homeScreen());
    await tester.pumpAndSettle();

    expect(find.byKey(HomeScreenKeys.scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(CruiseShipInfo), findsOneWidget);
    expect(find.byKey(HomeScreenKeys.bodyColumn), findsOneWidget);
    expect(find.byKey(HomeScreenKeys.buttonsRow), findsOneWidget);
    expect(find.byType(TextButton), findsNWidgets(3));
  });
}
