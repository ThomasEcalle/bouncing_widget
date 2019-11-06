library bouncing_widget;

import 'package:flutter/material.dart';

class BouncingWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const BouncingWidget({
    Key key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _BouncingWidgetState createState() => _BouncingWidgetState();
}

class _BouncingWidgetState extends State<BouncingWidget> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _scale;
  GlobalKey _childKey = GlobalKey();
  bool _isOutside = false;

  Widget get child => widget.child;

  VoidCallback get onPressed => widget.onPressed;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onLongPressEnd: (details) => _onLongPressEnd(details, context),
      onHorizontalDragEnd: _onDragEnd,
      onVerticalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: (details) => _onDragUpdate(details, context),
      onVerticalDragUpdate: (details) => _onDragUpdate(details, context),
      child: Transform.scale(
        key: _childKey,
        scale: _scale,
        child: child,
      ),
    );
  }

  _triggerOnPressed() {
    if (onPressed != null) {
      onPressed();
    }
  }

  _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  _onTapUp(TapUpDetails details) {
    _controller.reverse();
    _triggerOnPressed();
  }

  _onDragUpdate(DragUpdateDetails details, BuildContext context) {
    final Offset touchPosition = details.globalPosition;
    _isOutside = _isOutsideChildBox(touchPosition);
  }

  _onLongPressEnd(LongPressEndDetails details, BuildContext context) {
    final Offset touchPosition = details.globalPosition;

    if (!_isOutsideChildBox(touchPosition)) {
      _triggerOnPressed();
    }

    _controller.reverse();
  }

  _onDragEnd(DragEndDetails details) {
    if (!_isOutside) {
      _triggerOnPressed();
    }
    _controller.reverse();
  }

  bool _isOutsideChildBox(Offset touchPosition) {
    final RenderBox childRenderBox = _childKey.currentContext.findRenderObject();
    final Size childSize = childRenderBox.size;
    final Offset childPosition = childRenderBox.localToGlobal(Offset.zero);

    return (touchPosition.dx < childPosition.dx ||
        touchPosition.dx > childPosition.dx + childSize.width ||
        touchPosition.dy < childPosition.dy ||
        touchPosition.dy > childPosition.dy + childSize.height);
  }
}
