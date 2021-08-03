

import '../../include.dart';

class GradientProgressIndicator extends StatefulWidget {
  late AnimationController animationController;
  GradientProgressIndicator(this.animationController);
  @override
  _GradientProgressIndicatorState createState() =>
      _GradientProgressIndicatorState();
}

class _GradientProgressIndicatorState extends State<GradientProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _valueAnimation;

  @override
  void initState() {
    super.initState();

    if (widget.animationController != null) {
      _animationController = widget.animationController;
    } else {
      _animationController =
          AnimationController(vsync: this, duration: Duration(seconds: 3));
    }

    _valueAnimation = new Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.decelerate)).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(this.context).size.width;

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: 30.w,
            width: _width,
            color: Colors.grey[350],
          ),
          ClipRect(
            clipper: ProgressClipper(_valueAnimation.value * _width),
            child: Container(
              height: 30.w,
              width: _width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colours.start,
                    Colours.end,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressClipper extends CustomClipper<Rect> {
  late double width;
  ProgressClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(ProgressClipper oldClipper) {
    return width != oldClipper.width;
  }
}