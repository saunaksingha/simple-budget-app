import 'package:flutter/material.dart';

enum BadgeColor {
  coral,
  red,
  pink,
  rose,
  orange,
  amber,
  blue,
  sky,
  cyan,
  teal,
  indigo,
  purple,
  violet,
  plum,
  green,
  sage,
  mint,
  brown,
  taupe,
  grey,
}

const Map<BadgeColor, Color> badgeBackgroundColors = {
  BadgeColor.coral: Color(0xFFE8753D),
  BadgeColor.red: Color(0xFFD95C5C),
  BadgeColor.pink: Color(0xFFD65383),
  BadgeColor.rose: Color(0xFFD64F68),
  BadgeColor.orange: Color(0xFFC96F45),
  BadgeColor.amber: Color(0xFFD98B45),

  BadgeColor.blue: Color(0xFF3D78D8),
  BadgeColor.sky: Color(0xFF438DBD),
  BadgeColor.cyan: Color(0xFF3195A8),
  BadgeColor.teal: Color(0xFF3C9A9A),

  BadgeColor.indigo: Color(0xFF5968C9),
  BadgeColor.purple: Color(0xFF7657C7),
  BadgeColor.violet: Color(0xFF8B5BC7),
  BadgeColor.plum: Color(0xFF9163B5),

  BadgeColor.green: Color(0xFF3E9B76),
  BadgeColor.sage: Color(0xFF7FA34A),
  BadgeColor.mint: Color(0xFF5E9F6E),

  BadgeColor.brown: Color(0xFFB9783F),
  BadgeColor.taupe: Color(0xFF8F765F),
  BadgeColor.grey: Color(0xFF77736F),
};

const Map<BadgeColor, Color> badgeIconColors = {
  BadgeColor.coral: Color(0xFFFFE0C2),
  BadgeColor.red: Color(0xFFFFDADA),
  BadgeColor.pink: Color(0xFFFFDCE8),
  BadgeColor.rose: Color(0xFFFFD9E0),
  BadgeColor.orange: Color(0xFFFFE1CE),
  BadgeColor.amber: Color(0xFFFFE7C7),

  BadgeColor.blue: Color(0xFFDCEBFF),
  BadgeColor.sky: Color(0xFFD9F0FF),
  BadgeColor.cyan: Color(0xFFD5F5FA),
  BadgeColor.teal: Color(0xFFD6F2F0),

  BadgeColor.indigo: Color(0xFFDDE3FF),
  BadgeColor.purple: Color(0xFFE8DEFF),
  BadgeColor.violet: Color(0xFFEBD9FF),
  BadgeColor.plum: Color(0xFFF0DDF2),

  BadgeColor.green: Color(0xFFD7F5E8),
  BadgeColor.sage: Color(0xFFE8F5C9),
  BadgeColor.mint: Color(0xFFDDF3E1),

  BadgeColor.brown: Color(0xFFFFE5C9),
  BadgeColor.taupe: Color(0xFFEDE2D5),
  BadgeColor.grey: Color(0xFFE7E4E0),
};
