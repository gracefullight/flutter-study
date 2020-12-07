# flutter-study

``` bash
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
  > Unlike Java, Dart doesn’t have the keywords public, protected, and private. If an identifier starts with an underscore (_), it’s private to its library. For details, see Libraries and visibility.
- `no-new` [flutter/flutter#25924](https://github.com/flutter/flutter/issues/25924)
  > The new keyword became optional in Dart 2.
- 문법이 낯설음, Java + JS 느낌인데 TS 처럼 Strict 하지는 않은 느낌 (변경될 수 있음)
  ``` dart
  setState(() { }); // 화살표?
  _value = 'Change: $value'; // single quote 템플릿?
  ```

## questions

- native 와의 접점에서 RN 대비 사용성이 있는가?

## ref.

- https://github.com/Solido/awesome-flutter
- https://medium.com/flutter
