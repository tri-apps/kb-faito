import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_faito/keyboard/input_key.dart';
import 'package:kb_faito/game_scene.dart';

class InputKeyboard {
  static const String QWERTY = "qwertyuiop-asdfghjkl-zxcvbnm";

  final GameScene gameScene;
  Rect rect;
  Size keySize;
  Paint paint;
  List<InputKey> inputKeys;

  InputKeyboard(this.gameScene) {
    init();
    initInputKeys();
  }

  void init() {
    Size screenSize = gameScene.screenSize;
    double width = screenSize.width;
    double height = screenSize.height * 0.3;
    double posY = screenSize.height - height;

    rect = Rect.fromLTWH(0, posY, width, height);
    paint = Paint();
    paint.color = Color(0xFF000011);
  }

  void initInputKeys() {
    // q w e r t y u i o p
    double keyWidth = rect.width / 10;
    // q a z <spacebar>
    double keyHeight = rect.height / 4;
    double keyPosX;
    double keyPosY;

    keySize = Size(keyWidth, keyHeight);

    inputKeys = List<InputKey>();
    List<String> rows = QWERTY.split("-");

    for (int index = 0; index < rows.length; ++index) {
      String row = rows[index];
      keyPosY = rect.top + (index * keySize.height);
      keyPosX = rect.center.dx - (keyWidth * row.length * 0.5) - keyWidth;

      row.runes.forEach((int rune) {
        keyPosX += keyWidth;
        InputKey key = InputKey(this, keyPosX, keyPosY);
        key.keyString = String.fromCharCode(rune);
        inputKeys.add(key);
      });
    }
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
    inputKeys.forEach((InputKey key) => key.render(canvas));
  }

  void update(double t) {
    inputKeys.forEach((InputKey key) => key.update(t));
  }
}
