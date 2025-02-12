import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {
    print("Start");
  });

  test("User login test", () {
    const isUserLogin = true;

    expect(isUserLogin, isTrue);
  });

  group("User login full test", () {
    //Test1
    test("User login test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //Test2
    test("User login test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });

    //Test3
    test("User login test", () {
      const isUserLogin = true;

      expect(isUserLogin, isTrue);
    });
  });
}
