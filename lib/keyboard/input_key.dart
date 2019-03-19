import 'dart:ui';
import 'package:kb_faito/keyboard/input_keyboard.dart';

class InputKey {
  // final GameScene gameScene;
  final InputKeyboard keyboard;
  Rect rect;
  Paint paint;
  String keyString;

  InputKey(this.keyboard, double x, double y) {
    rect = Rect.fromLTWH(x, y, keyboard.keySize.width, keyboard.keySize.height);
    paint = Paint();
    paint.color = Color(0xFF330000);
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
  }

  void update(double t) {}
}
