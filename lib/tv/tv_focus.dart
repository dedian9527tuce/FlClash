/// TV 遥控器焦点管理包装器
/// 让任何 widget 支持 D-pad 导航
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TvFocusWidget extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final EdgeInsets padding;
  final Color? focusColor;

  const TvFocusWidget({
    super.key,
    required this.child,
    this.onPressed,
    this.padding = const EdgeInsets.all(4),
    this.focusColor,
  });

  @override
  State<TvFocusWidget> createState() => _TvFocusWidgetState();
}

class _TvFocusWidgetState extends State<TvFocusWidget> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final focusColor = widget.focusColor ?? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3);
    
    return Focus(
      onFocusChange: (hasFocus) => setState(() => _isFocused = hasFocus),
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent && 
            (event.logicalKey == LogicalKeyboardKey.select ||
             event.logicalKey == LogicalKeyboardKey.enter)) {
          widget.onPressed?.call();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _isFocused ? focusColor : Colors.transparent,
            width: _isFocused ? 3 : 0,
          ),
          boxShadow: _isFocused
              ? [BoxShadow(color: focusColor, blurRadius: 8, spreadRadius: 1)]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
