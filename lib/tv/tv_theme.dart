/// TV 遥控器适配主题 - 更大的字号、按钮、间距
import 'package:flutter/material.dart';

class TvTheme {
  /// 应用 TV 主题修饰
  static ThemeData adapt(ThemeData theme) {
    return theme.copyWith(
      // 更大的按钮
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(120, 48),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      // 更大的导航
      navigationBarTheme: theme.navigationBarTheme.copyWith(
        height: 80,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
        }),
      ),
      // 更大的滑块
      sliderTheme: theme.sliderTheme.copyWith(
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
        trackHeight: 6,
      ),
      // 更大的开关
      switchTheme: theme.switchTheme.copyWith(
        thumbSize: WidgetStateProperty.all(const Size(24, 24)),
        trackOutlineSize: WidgetStateProperty.all(const Size(52, 32)),
      ),
    );
  }
}
