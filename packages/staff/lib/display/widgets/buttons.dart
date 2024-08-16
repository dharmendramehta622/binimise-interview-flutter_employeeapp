part of staff;

class DisabledDropDown extends StatelessWidget {
  final String headingText;
  final String hintText;
  const DisabledDropDown({
    super.key,
    required this.headingText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldText(headingText, 14, kdisabledColor),
        sizedBoxHeight(4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 17),
          height: 56,
          alignment: Alignment.center,
          width: screenWidth,
          decoration: BoxDecoration(
              border: Border.all(color: kGrey200, width: 1),
              borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediumText(hintText, 16, kdisabledColor),
              SvgPicture.asset(
                Assets.icons.arrow_down,
                color: kdisabledColor,
              )
            ],
          ),
        )
      ],
    );
  }
}

class DisabledButton extends StatelessWidget {
  void Function()? onTap;
  final String text;
  DisabledButton({
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
        child: Container(
          width: screenWidth,
          height: 56,
          decoration: BoxDecoration(
            color: kGrey100,
            borderRadius: BorderRadius.circular(70),
          ),
          child: Center(
            child: BoldText(text, 18, kWhite),
          ),
        ),
      ),
    );
  }
}
