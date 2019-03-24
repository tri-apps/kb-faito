import 'dart:ui';

import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/resizable.dart';
import 'package:flutter/material.dart';
import 'package:kb_faito/keyboard/input_key_component.dart';
import 'package:kb_faito/theme/default_theme.dart';

class KeyboardComponent extends PositionComponent
    with Resizable, ComposedComponent {
  Rect rect;
  List<InputKeyComponent> _inputKeys;

  KeyboardComponent(double height) {
    this.height = height;
    this.anchor = Anchor.topLeft;
  }

  void _generateKeys() {
    String qwerty = "qwertyuiop-asdfghjkl-zxcvbnm";
    double margin = 2.0;
    double keyPosX;
    double keyPosY;

    // q w e r t y u i o p
    double keyWidth = this.width / 10;

    // q a z <spacebar>
    double keyHeight = this.height / 4;

    List<String> rows = qwerty.split("-");
    double keyboardCenterX = this.x + (this.width * 0.5);
    _inputKeys = List<InputKeyComponent>();

    for (int index = 0; index < rows.length; ++index) {
      String row = rows[index];
      keyPosY = index * keyHeight;
      keyPosX = keyboardCenterX - (keyWidth * row.length * 0.5) - keyWidth;

      row.runes.forEach((int rune) {
        keyPosX += keyWidth;
        Rect keyRect = Rect.fromLTWH(keyPosX, keyPosY, keyWidth, keyHeight);
        InputKeyComponent inputKey = InputKeyComponent(keyRect, margin, rune);
        add(inputKey);
        _inputKeys.add(inputKey);
      });
    }
  }

  void onTapUp(TapUpDetails evt) {
    if (!this.rect.contains(evt.globalPosition)) {
      return;
    }

    double localTapX = evt.globalPosition.dx - this.x;
    double localTapY = evt.globalPosition.dy - this.y;
    Offset localTapPosition = Offset(localTapX, localTapY);

    _inputKeys.forEach((InputKeyComponent inputKey) {
      if (inputKey.rect.contains(localTapPosition)) {
        inputKey.onTapUp();
      }
    });
  }

  // region Inherited Methods
  @override
  void resize(Size screenSize) {
    this.x = 0;
    this.y = screenSize.height - this.height;
    this.width = screenSize.width;

    this.rect = Rect.fromLTWH(this.x, this.y, this.width, this.height);

    _generateKeys();
  }

  @override
  void render(Canvas c) {
    prepareCanvas(c);
    c.drawRect(Rect.fromLTWH(0, 0, this.width, this.height),
        DefaultTheme.lightBackgroundColor.paint);

    super.render(c);
  }

  @override
  void update(double t) {}
  // endregion
}
