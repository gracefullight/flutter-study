# flutter-study

```bash
flutter doctor # 설치 제대로 되었는지 확인
flutter run # emultator 내 앱 실행
```

## pros

- 공식 문서가 잘 되어있음
- VSCode 로 개발 가능
- `setState`
- `material` 내장
- 내장 포매터

## cons

- `private` keyword 없음
  > Unlike Java, Dart doesn’t have the keywords public, protected, and private. If an identifier starts with an underscore (\_), it’s private to its library. For details, see Libraries and visibility.
- `no-new` [flutter/flutter#25924](https://github.com/flutter/flutter/issues/25924)
  > The new keyword became optional in Dart 2.
- `'===' operator is not supported` `==` 로만 사용, 구조체 비교시 `identical` 사용
  > In general, consider carefully whether overriding operator == is a good idea. It can be expensive, especially if the properties it compares are themselves comparable with a custom operator ==. If you do override equality, you should use @immutable on the class hierarchy in question.
- 생성자를 `const` 로 선언 시에 레퍼런스를 공유함
- `..` [Cascade notation](https://dart.dev/guides/language/language-tour#cascade-notation-)
  ```dart
  // 인스턴스의 setter 를 바로 호출
  final Paint paint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 10.0
    ..color = Colors.blue[500]
    ..style = PaintingStyle.stroke;
  ```
- 문법이 낯설음, Java + JS 느낌인데 TS 처럼 Strict 하지는 않은 느낌 (변경될 수 있음)
  ```dart
  setState(() { }); // 화살표?
  _value = 'Change: $value'; // single quote 템플릿?
  // 생성자
  class Dummy {
    final String data;
    Dummy({this.data});
  }
  ```

## questions

- native 와의 접점에서 RN 대비 사용성이 있는가?

## ref

- https://github.com/Solido/awesome-flutter
- https://medium.com/flutter
