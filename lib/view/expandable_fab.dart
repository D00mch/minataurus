import 'package:flutter/material.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.isInitiallyOpened,
    required this.closeHint,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? isInitiallyOpened;
  final double distance;
  final List<Widget> children;
  final ValueNotifier<bool> closeHint;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
  bool _isOpened = false;
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    widget.closeHint.addListener(_toggle);
    _isOpened = widget.isInitiallyOpened ?? false;
    _controller = AnimationController(
      value: _isOpened ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this, // need to pass '' to controlles, thas used in 
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.closeHint.removeListener(_toggle);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [..._buildExpandingActionButtons(), _buildFab()],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isOpened = !_isOpened;
      if (_isOpened) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0; i < count; i++, angleInDegrees += step) {
      children.add(_ExpandingActionButton(
        directionInDegrees: angleInDegrees,
        maxDistance: widget.distance,
        progress: _expandAnimation,
        child: widget.children[i],
      ));
    }
    return children;
  }

  Widget _buildFab() {
    final theme = Theme.of(context);
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        _isOpened ? 0.7 : 1.0,
        _isOpened ? 0.7 : 1.0,
        1.0,
      ),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      child: AnimatedRotation(
          turns: _isOpened ? -0.1 : 0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: () => widget.closeHint.value = !widget.closeHint.value,
            backgroundColor: _isOpened ? Colors.white : theme.primaryColor,
            child: Icon(Icons.add, color: _isOpened ? theme.primaryColor : Colors.white),
          )),
    );
  }
}

const double pi = 3.1415926535897932;

class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    Key? key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (c, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (pi / 180),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(opacity: progress, child: child),
    );
  }
}
