import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flame/anchor.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/resizable.dart';

import 'package:kb_faito/theme/default_theme.dart';
import 'package:kb_faito/keyboard/input_key_component.dart';

class KeyboardComponent extends PositionComponent
    with Resizable, ComposedComponent {
  KeyboardComponent(double height) {
    this.height = height;
    this.anchor = Anchor.topLeft;
  }

  void generateKeys() {
    String qwerty = "qwertyuiop-asdfghjkl-zxcvbnm";
    double keyPosX;
    double keyPosY;

    // q w e r t y u i o p
    double keyWidth = this.width / 10;

    // q a z <spacebar>
    double keyHeight = this.height / 4;

    List<String> rows = qwerty.split("-");
    double keyboardCenterX = this.x + (this.width * 0.5);

    for (int index = 0; index < rows.length; ++index) {
      String row = rows[index];
      keyPosY = index * keyHeight;
      keyPosX = keyboardCenterX - (keyWidth * row.length * 0.5) - keyWidth;

      row.runes.forEach((int rune) {
        keyPosX += keyWidth;
        Rect keyRect = Rect.fromLTWH(keyPosX, keyPosY, keyWidth, keyHeight);
        add(InputKeyComponent(keyRect, 1.0, rune));
      });
    }
  }

  @override
  void resize(Size screenSize) {
    this.x = 0;
    this.y = screenSize.height - this.height;
    this.width = screenSize.width;

    generateKeys();
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
}
