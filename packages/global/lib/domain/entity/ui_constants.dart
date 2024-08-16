part of global;

// final formatter = DateFormat('yyyy-MM-dd');

double get screenWidth => ScreenUtil().screenWidth;
double get screenHeight => ScreenUtil().screenHeight;
double screen_width(double per) => screenWidth * per;
double screen_height(double per) => screenHeight * per;

const TextStyle display = TextStyle(
    fontSize: 48, fontWeight: FontWeight.w100, fontFamily: 'Noto Sans');

//headers
const TextStyle header1 = TextStyle(
    fontSize: 34, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');
const TextStyle header2 = TextStyle(
    fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');
const TextStyle header3 = TextStyle(
    fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');
const TextStyle header4 = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');
const TextStyle header5 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');
const TextStyle header6 = TextStyle(
    fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Noto Sans');

//Titles
const TextStyle title1 = TextStyle(
    fontSize: 28, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans');
const TextStyle title2 = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans');

const TextStyle title3 = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans');

const TextStyle title4_2 = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans');
const TextStyle headline = TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, fontFamily: 'Noto Sans');
const TextStyle body = TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, fontFamily: 'Noto Sans');
const TextStyle body2 = TextStyle(
    fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Noto Sans');
const TextStyle caption = TextStyle(
    fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Noto Sans');

//rent app colors
const kPrimary = Color(0xFFF63967);
const kOrange700 = Color(0xFFFF5003);
const kOrange600 = Color(0xFFFD7702);
const kOrange800 = Color(0xFFEA7E41);
const kSwitch = Color(0xFFBAC1CC);
const kBg = Color(0xFFF4F4F4);
const kProgressBg = Color(0xFFF4F4F4);
const kGreen = Color(0xFF44D1BB);
const kGrey800 = Color(0xFF242424);
const kGrey700 = Color(0xFF2F2F2F);
const kGrey750 = Color(0xFF344054);
const kGrey150 = Color(0xFFF2F4F7);
const kGrey200 = Color(0xFFDCE4E8);
const kGrey300 = Color(0xFF6C7278);
const kGrey600 = Color(0xFF6C7278);
const kdisabledColor = Color(0xFFB0B3B6);
const kGrey900 = Color(0xFF1C1C1C);
const kBlue = Color(0xFF007AFF);
const kPurple = Color(0xFF6A5FE7);
const kOrange = Color(0xFFFE4950);
const kBlue700 = Color(0xFF003F70);
const kBlueBg = Color(0xFF4D6FE7);
const kOrangeBg = Color(0xFFE7974D);

const kGrey500 = Color(0xFF424242);
const kGrey450 = Color(0xFF656E7B);
const kGrey400 = Color(0xFFBBBBBB);
const kGrey100 = Color(0xFF6C7278);
const kGrey50 = Color(0xFFDCE4E8);
const kSecondary = Color(0xFFCDEEFE);
const kBackground = Color(0xFFF3F3F3);
const kBorder = Color(0xFFE8E6EA);
const kTextPrimary = Color(0xFF1A1C1E);
const kBlack = Color(0xFF000000);
const kBlack600 = Color(0xFF1A1C1E);
const kTextPrimarySecondary = Color(0xFF323755);
const kTextInactive = Color(0xFFADAFBB);
const kRed200 = Color(0xFFFEB1B8);
const kRed100 = Color(0xFFFECACF);

const kTextGreen = Color(0xFF0C9A55);
const kTimeColor = Color(0xFF8A91A8);

// var kTextPrimary70 = Color.fromARGB(255, 73, 73, 73).withOpacity(0.7);
// const kTextPrimary100 = Color(0xFF000000);
// const kTextPrimary100 = Color(0xFF000000);
const kWhite = Color(0xFFFFFFFF);
const kTextSecondary = Color(0xFF776B8A);
const kGreyColor = Color(0xFFD9D9D9);
const kGrey2Color = Color(0xFFD8D8D8);

const Color kLandingText = Color(0xFF4E3D67);

const pinkFill = Color(0xFFFFEAE9);

//End of Zil Figma Colors

String get reviewText =>
    'Delhi, India\'s capital territory, is a massive metropolitan area in the country\'s north. In Old Delhi, a neighbourhood dating to the 1600s, stands the imposing Mughal-era Red Fort, a symbol of India, and the sprawling Jama Masjid mosque, whose courtyard accomodates 25,000 people. Nearby is Chandni Chowk, a vibrant bazar filled with food cards, sweets shops and spice stalls.';

SizedBox sizedBoxHeight(double height) => SizedBox(height: height);

SizedBox sizedBoxWidth(double width) => SizedBox(width: width);

// AppBar appBar(BuildContext context, String title) => AppBar(
//       backgroundColor: kWhite,
//       elevation: .7,
//       leading: GestureDetector(
//         onTap: () => Navigator.of(context).pop(),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Icon(
//             CupertinoIcons.arrow_left,
//             color: kBlack,
//           ),
//         ),
//       ),
//       title: BoldText(title, 22, kBlack),
//     );

Widget BoldText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    );
Widget ExtraBoldText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w800,
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    );
Widget interBoldText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.inter(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    );
Widget MediumText(String txt, double fontSize, Color color,
        {TextAlign? align}) =>
    Text(
      maxLines: 50,
      txt,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.manrope(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w500,
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis)),
    );
Widget SemiBoldText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w600,
          textStyle: const TextStyle(overflow: TextOverflow.clip)),
    );
Widget RegularText(String txt, double fontSize, Color color,
    {Color? underlineColor, double? lineHeight, TextAlign? align}) {
  TextStyle textStyle = GoogleFonts.manrope(
    // textBaseline: ,

    fontSize: fontSize,
    color: color,
    fontWeight: FontWeight.w400,
    textStyle: TextStyle(height: lineHeight ?? 1.2),
  );

  Widget textWithUnderline = Stack(
    children: [
      Text(
        txt,
        textAlign: align ?? TextAlign.center,
        style: textStyle,
        maxLines: 10,
      ),
      if (underlineColor != null)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 1,
            color: underlineColor ??
                color, // Use text color as underline color by default
          ),
        ),
    ],
  );

  return textWithUnderline;
}

Widget GradientText(
  String txt,
  double fontSize, {
  Gradient? gradient, // Optional gradient
  Color? underlineColor,
  double? lineHeight,
  TextAlign? align,
}) {
  TextStyle textStyle = GoogleFonts.manrope(
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
  );

  Widget textWithUnderline = Stack(
    children: [
      if (gradient != null)
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: Text(
            txt,
            textAlign: align ?? TextAlign.center,
            style:
                textStyle.copyWith(color: Colors.white), // Set color to white
          ),
        )
      else
        Text(
          txt,
          textAlign: align ?? TextAlign.center,
          style: textStyle,
        ),
      if (underlineColor != null)
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 1,
            // color: underlineColor,
            decoration: BoxDecoration(gradient: floatingButtonGradient),
          ),
        ),
    ],
  );

  return textWithUnderline;
}

Widget CenterAlignBoldText(String txt, double fontSize, Color? color) => Text(
      txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? kBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
Widget BoldBlackText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w900,
      ),
    );

Widget BoldLineThroughText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.lineThrough,
        fontWeight: FontWeight.bold,
      ),
    );
Widget regularLineThroughText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.manrope(
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.lineThrough,
        fontWeight: FontWeight.w500,
      ),
    );

Widget manropeSemiBoldText(
        String txt, double fontSize, Color? color, int? maxlines) =>
    Text(
      maxLines: maxlines ?? 1,
      txt,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

Widget SemiCenterAlignBoldText(String txt, double fontSize, Color? color) =>
    Text(
      txt,
      textAlign: TextAlign.center,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
Widget SemiBoldLineThroughText(String txt, double fontSize, Color? color) =>
    Text(
      txt,
      style: GoogleFonts.manrope(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? kBlack,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
var linearGradient = const LinearGradient(
  begin: Alignment(2.19, -0.87),
  end: Alignment(-2.19, 0.87),
  colors: [Color(0xFFEE2A7B), Color(0xFFFD484F)],
);
var floatingButtonGradient = const LinearGradient(
  begin: Alignment(0, 0.000),
  end: Alignment(0.75, -0.0051),
  colors: [Color(0xFFFD484F), Color(0xFFEE2A7B)],
);
var authGradient = const LinearGradient(
  begin: Alignment(0, .75),
  end: Alignment(0, -2),
  colors: [Color(0xFFFD484F), Color(0xFFEE2A7B)],
);
var swipeGradient = const LinearGradient(
  begin: Alignment(0, .75),
  end: Alignment(0, -2),
  colors: [
    Color.fromARGB(255, 218, 144, 247),
    Color.fromARGB(255, 146, 90, 248)
  ],
);

var textStyle = const TextStyle(
  color: Colors.white,
  fontSize: 42,
  fontFamily: 'PoetsenOne',
  fontWeight: FontWeight.w400,
  height: 0,
);

 
String formatDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return ''; // Return an empty string or a default value for null DateTime
  }
  
  DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
  return formatter.format(dateTime);
}
class CodeGenerator {
  static int _counter = 0;

  CodeGenerator();

  String generateUniqueCode() {
    _counter++;
    String formattedNumber = _counter.toString().padLeft(5, '0');
    return 'z${formattedNumber.substring(0, 2)}.${formattedNumber.substring(2, 4)}';
  }
}