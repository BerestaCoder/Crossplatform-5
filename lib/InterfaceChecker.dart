import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class InterfaceChecker {
  bool isDesktopInterface() {
    if (kIsWeb)
      return true;
    else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
      return true;
    else
      return false;
  }
}