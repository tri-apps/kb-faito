import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:kb_faito/keyboard/keyboard_component.dart';
import 'package:kb_faito/theme/default_theme.dart';

// TODO: utilize component render priority

class GameScene extends BaseGame {
  Size _screenSize;
  KeyboardComponent _keyboard;

  GameScene() {
    _init();
  }

  // region Private Methods
  void _init() async {
    resize(await Flame.util.initialDimensions());
    _setupComponents();
  }

  void _setupComponents() {
    _keyboard = KeyboardComponent(_screenSize.height * 0.3);
    add(_keyboard);
  }
  //endregion

  // region Public Methods
  void onTapUp(TapUpDetails evt) {
    _keyboard.onTapUp(evt);
  }
  // endregion

  // region Inherited Methods
  @override
  void render(Canvas canvas) {
    // draw background
    Rect bgRect = Rect.fromLTWH(0, 0, _screenSize.width, _screenSize.height);
    canvas.drawRect(bgRect, DefaultTheme.darkBackgroundColor.paint);

    super.render(canvas);
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void resize(Size size) {
    _screenSize = size;
    super.resize(size);
  }
  // endregion
}
