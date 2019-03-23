import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:kb_faito/theme/default_theme.dart';
import 'package:kb_faito/keyboard/keyboard_component.dart';

class GameScene extends BaseGame {
  Size screenSize;

  GameScene() {
    init();
  }

  void init() async {
    resize(await Flame.util.initialDimensions());
    add(KeyboardComponent(this.screenSize.height * 0.3));
  }

  @override
  void render(Canvas canvas) {
    // draw background
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    canvas.drawRect(bgRect, DefaultTheme.darkBackgroundColor.paint);

    super.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
}
