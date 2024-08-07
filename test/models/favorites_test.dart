import 'package:fluttertest/models/favorites.dart';
import 'package:test/test.dart';

void main() {
  group("Test App Provider", () {
    var favorites = Favorites();
    test("a new item should be added", () {
      var itemNo = 35;
      favorites.add(itemNo);
      expect(favorites.items.contains(itemNo), true);
    });
    test('An item should be removed',(){
      var number = 45;
      favorites.add(number);
      expect(favorites.items.contains(number), true);
      var itemNo = 43;
      favorites.remove(itemNo);
      expect(favorites.items.contains(itemNo), false);
    });
  });
}