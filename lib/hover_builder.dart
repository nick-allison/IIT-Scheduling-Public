import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverBuilder extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverBuilder({super.key, required this.builder});

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: widget.builder(_isHovered),
    );
  }
}