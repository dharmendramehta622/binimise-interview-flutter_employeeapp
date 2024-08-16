part of staff;

class GradientShadowContainer extends StatelessWidget {
  void Function()? onTap;
  final String text;
  GradientShadowContainer({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomPaint(
                size: Size(screenWidth, 56),
                painter: GradientShadowPainter(),
              ),
            ),
            Container(
              width: screenWidth,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(70),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(0, 21),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: BoldText(text, 18, kWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF0753EB),
          Color(0xFFDE0000),
          Color(0xFFF88A00),
        ],
        stops: [0.0, 0.7, 1.0],
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));

    // Blur effect parameters
    const blurSigma = 10.0;
    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, blurSigma);

    // Draw a rect with the blurred gradient
    Rect rect = Rect.fromLTRB(0, size.height * 0.6, size.width, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
    required this.elementColor,
  });

  final Color elementColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: SvgPicture.asset(
        Assets.icons.dot,
        color: elementColor,
      ),
    );
  }
}

class ShowAllText extends StatefulWidget {
  final String text;
  final int maxLength;
  final Color color;

  const ShowAllText(this.text, this.maxLength, this.color, {super.key});

  @override
  _ShowAllTextState createState() => _ShowAllTextState();
}

class _ShowAllTextState extends State<ShowAllText> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        _isExpanded ? widget.text : "${widget.text.substring(0, 80)}..";

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      MediumText(
        displayText,
        14,
        kGrey600,
      ),
      _isExpanded
          ? GestureDetector(
              onTap: _toggleExpand,
              child: ExtraBoldText("show less", 14, kOrange600))
          : GestureDetector(
              onTap: _toggleExpand,
              child: ExtraBoldText("show all", 14, kOrange600))
    ]);
  }
}

class SelectionContainer extends StatelessWidget {
  final Widget? widget;

  const SelectionContainer({
    super.key,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          height: 77,
          alignment: Alignment.centerLeft,
          width: screenWidth,
          decoration: BoxDecoration(
              boxShadow: cardShadow,
              border: Border.all(color: kGrey200, width: 1),
              borderRadius: BorderRadius.circular(13)),
          child: widget),
    );
  }
}

class CircularProgressChartOne extends StatelessWidget {
  final int totalValue;
  final int currentValue;
  final Color backgroundColor;
  final Color valueColor;

  const CircularProgressChartOne({
    super.key,
    required this.totalValue,
    required this.currentValue,
    this.backgroundColor = kProgressBg, // kGrey50
    this.valueColor = kGreen, // kOrange600
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentValue / totalValue;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 135,
          width: 135,
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            value: progress,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            strokeWidth: 14.0, // Adjusts the thickness of the circle
          ),
        ),
        Column(children: [
          BoldText('${currentValue.toInt()}', 36, kTextPrimary),
          RegularText("/${totalValue.toInt()}", 12, kGrey600)
        ]),
      ],
    );
  }
}


