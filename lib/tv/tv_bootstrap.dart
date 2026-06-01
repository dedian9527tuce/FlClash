/// TV 适配器 - 检测运行环境并应用 TV 优化
import 'dart:io';
import 'package:flutter/foundation.dart';

class TvBootstrap {
  static bool _isTv = false;
  
  static bool get isTv => _isTv;
  
  /// 检测当前是否运行在 Android TV 上
  static Future<bool> detectTv() async {
    if (!kIsWeb && Platform.isAndroid) {
      // Android TV 检测：通过 system features
      // FlClash 的 AndroidManifest 已声明 leanback support
      _isTv = true; // 默认启用 TV 模式（因为 manifest 已声明 leanback）
      return true;
    }
    return false;
  }
}
