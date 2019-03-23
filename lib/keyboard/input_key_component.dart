import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/components/resizable.dart';
import 'package:flame/anchor.dart';

import 'package:kb_faito/theme/default_theme.dart';

class InputKeyComponent extends PositionComponent
    with Resizable, ComposedComponent {
  int _keyCode;

  InputKeyComponent(Rect rect, double margin, int keyCode) {
    _keyCode = keyCode;

    this.anchor = Anchor.topLeft;
    this.x = rect.topLeft.dx + (margin * 0.5);
    this.y = rect.topLeft.dy + (margin * 0.5);
    this.width = rect.width - margin;
    this.height = rect.height - margin;

    add(TextComponent(String.fromCharCode(keyCode),
        config: DefaultTheme.regularTextConfig)
      ..anchor = Anchor.center
      ..x = this.width * 0.5
      ..y = this.height * 0.5);
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);
    c.drawRect(Rect.fromLTWH(0, 0, this.width, this.height),
        DefaultTheme.darkBackgroundColor2.paint);

    super.render(c);
  }
}
