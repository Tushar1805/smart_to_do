import 'package:core/utils/shared_extensions.dart' show HexColor;
import 'package:flutter/material.dart';

Color lightBackgroundColorPurple = HexColor.fromHex('#5a31a9');
Color lightBackgroundColorWhite = HexColor.fromHex('#00000');
Color containerBackgroundColor = HexColor.fromHex('#0070df');
Color darkBackGroundColor = HexColor.fromHex('#041A2D');
Color primarycolor = HexColor.fromHex('#041a2d');
Color secondaryColor = HexColor.fromHex('#041729');
Color darkThemeSecondaryColor = HexColor.fromHex('#75E6DA');

final colorScheme = ColorScheme.fromSeed(seedColor: primarycolor);

Color primary = colorScheme.primary;
Color onPrimary = colorScheme.onPrimary;
Color secondary = colorScheme.secondary;
Color onSecondary = colorScheme.onSecondary;
Color surface = colorScheme.surface;
Color error = colorScheme.error;
