import 'package:core/utils/shared_extensions.dart' show HexColor;
import 'package:flutter/material.dart';

Color lightBackgroundColorPurple = HexColor.fromHex('#5a31a9');
Color lightBackgroundColorWhite = HexColor.fromHex('#00000');
Color containerBackgroundColor = HexColor.fromHex('#0070df');
Color primaryColor = HexColor.fromHex('#112B3F');
// Color primaryColor = HexColor.fromHex('#561048');
// Color primarycolor = HexColor.fromHex('#041a2d');
Color secondaryColor = HexColor.fromHex('#041729');
Color darkThemeSecondaryColor = HexColor.fromHex('#75E6DA');
Color primaryContainerColor = HexColor.fromHex('#232323');
Color primaryContainerColorOpacity = HexColor.fromHex('#80232323');

Color backgroundColor = HexColor.fromHex('#111111');
Color mobileBackground = HexColor.fromHex('#E3DCFC');
Color mobileBackgroundOpacity = HexColor.fromHex('#80E3DCFC');
Color wireframeBackground = HexColor.fromHex('#DEFFF9');
Color websiteBackground = HexColor.fromHex('#F2F4AD');

final colorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

Color primary = colorScheme.primary;
Color primaryFixedDim = colorScheme.primaryFixedDim;
Color onPrimary = colorScheme.onPrimary;
Color secondary = colorScheme.secondary;
Color onSecondary = colorScheme.onSecondary;
Color surface = colorScheme.surface;
Color error = colorScheme.error;
