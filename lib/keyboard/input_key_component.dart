import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/resizable.dart';
import 'package:flame/components/text_component.dart';
import 'package:kb_faito/theme/default_theme.dart';

class InputKeyComponent extends PositionComponent
    with Resizable, ComposedComponent {
  int _keyCode;
  double _margin;

  InputKeyComponent(Rect rect, double margin, int keyCode) {
    _keyCode = keyCode;
    _margin = margin;

    this.anchor = Anchor.topLeft;
    this.setByRect(rect);

    add(TextComponent(String.fromCharCode(keyCode),
        config: DefaultTheme.regularTextConfig)
      ..anchor = Anchor.center
      ..x = this.width * 0.5
      ..y = this.height * 0.5);
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);
    c.drawRect(
        Rect.fromLTWH(this._margin, this._margin, this.width - this._margin,
            this.height - this._margin),
        DefaultTheme.darkBackgroundColor2.paint);

    super.render(c);
  }
}
