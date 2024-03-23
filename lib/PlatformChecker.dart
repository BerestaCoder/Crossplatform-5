import 'dart:io' show Platform;

class PlatformChecker {
  bool isDesktop() {
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }
}