import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flame/text_config.dart';

class DefaultTheme {
  //static const PaletteEntry blue = PaletteEntry(Color(0xFF0000FF));

  static const PaletteEntry lightBackgroundColor = BasicPalette.white;
  static const PaletteEntry darkBackgroundColor = BasicPalette.black;
  static const PaletteEntry darkBackgroundColor2 =
      PaletteEntry(Color(0xFF5D5D5D));

  static const PaletteEntry lightTextColor = BasicPalette.white;
  static const PaletteEntry darkTextColor = BasicPalette.black;

  static const TextConfig smallTextConfig = TextConfig(fontSize: 12.0);
  static const TextConfig regularTextConfig =
      TextConfig(fontSize: 16.0, color: Color(0xFF00AA55));
  static const TextConfig largeTextConfig = TextConfig(fontSize: 20.0);
}
