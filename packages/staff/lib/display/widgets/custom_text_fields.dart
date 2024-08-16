part of staff;

class NewTextField extends StatefulWidget {
  const NewTextField({
    super.key,
    this.controller,
    this.validator,
    this.onSaved,
    this.title,
    this.onChanged,
    required this.hintText,
    this.icon,
    this.isPhoneField = false,
    this.scrollPadding,
    this.suffix,
    this.enabled,
    this.radius = 6,
    this.isPasswordField = false,
  });

  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String hintText;
  final String? title;
  final IconData? icon;
  final Widget? suffix;
  final bool isPasswordField;
  final bool isPhoneField;
  final bool? enabled;
  final double? radius;
  final EdgeInsets? scrollPadding;

  @override
  State<NewTextField> createState() => _NewTextFieldState();
}

class _NewTextFieldState extends State<NewTextField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SemiBoldText(widget.title ?? "", 18, kBlack),
          sizedBoxHeight(6),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(color: kBlack, width: .5),
              borderRadius: BorderRadius.circular(widget.radius ?? 6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 4,
            ),
            child: TextFormField(
              enabled: widget.enabled ?? true,
              keyboardType: widget.isPhoneField
                  ? TextInputType.phone
                  : TextInputType.text,
              autofocus: false,
              inputFormatters: widget.isPhoneField
                  ? [
                      LengthLimitingTextInputFormatter(
                          10), // Limit input to 10 characters
                      FilteringTextInputFormatter
                          .digitsOnly, // Allow only digits
                    ]
                  : [],
              controller: widget.controller,
              scrollPadding:
                  widget.scrollPadding ?? const EdgeInsets.only(bottom: 200),
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: widget.suffix,
                hintStyle: const TextStyle(
                  fontSize: 18,
                  color: kBlack,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
