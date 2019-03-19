import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:kb_faito/keyboard/input_keyboard.dart';

class GameScene extends Game {
  Size screenSize;

  InputKeyboard inputKeyboard;

  GameScene() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    inputKeyboard = InputKeyboard(this);
  }

  void render(Canvas canvas) {
    // draw background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff000033);
    canvas.drawRect(bgRect, bgPaint);

    // draw keyboard
    inputKeyboard.render(canvas);
  }

  void update(double t) {
    inputKeyboard.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
