import 'package:flutter/material.dart';
import 'dart:ui';

const primaryColor = const Color(0xFFab77a3);
const primaryLight = const Color(0xFFFF9F59);
const primaryDark = const Color(0xFFFF9F59);

const secondaryColor = const Color(0xFFab77a3);
const secondaryLight = const Color(0xFFab77a3);
const secondaryDark = const Color(0xFFab77a3);

const Color gradientStart = const Color(0xFFab77a3);
const Color gradientEnd = const Color(0xFFf7418c);
const Color gradientMiddle = const Color(0xFFf5f5dc);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFFFD60A3), Color(0xFFf5f5dc), Color (0xFFbb92b5), Color(0xFFe5d6e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
