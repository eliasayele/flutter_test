import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/models/favorites.dart';
import 'package:fluttertest/screens/favorites.dart';
import 'package:provider/provider.dart';

late Favorites favoritesList;
Widget createFavoritesScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) {
        favoritesList = Favorites();
        return favoritesList;
      },
      child: const MaterialApp(
        home: FavoritesPage(),
      ),
    );
void addItems() {
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  group('Favorites Page Widget Tests', () {
    testWidgets('Test if ListView is shows up', (tester) async {
      await tester.pumpWidget(createFavoritesScreen());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
