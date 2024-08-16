part of staff;

final option_images = [
  Assets.images.chicken,
  Assets.images.horse,
  Assets.images.dog,
];
const dropDownDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
  labelText: '',

  filled: true, // To enable the background color
  fillColor: Colors.white, // Set the background color to white
  border: OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(8.0)), // Set the border radius
    borderSide: BorderSide(color: kGrey200, width: 1), // Remove the border
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(8.0)), // Set the border radius
    borderSide: BorderSide(
        color: kGrey200, width: 1), // Remove the border for enabled state
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(8.0)), // Set the border radius
    borderSide: BorderSide(
        color: kGrey200, width: 1), // Remove the border for focused state
  ),
  errorBorder: OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(8.0)), // Set the border radius
    borderSide: BorderSide(
        color: kGrey200, width: 1), // Remove the border for error state
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius:
        BorderRadius.all(Radius.circular(8.0)), // Set the border radius
    borderSide: BorderSide(
        color: kGrey200, width: 1), // Remove the border for disabled state
  ),
);


const boxDecoration = BoxDecoration(color: kWhite, boxShadow: [
  BoxShadow(
    color: Color(0x26000000),
    offset: Offset(0, 21),
    blurRadius: 18.8,
    spreadRadius: -19,
  ),
]);
const cardShadow = [
  BoxShadow(
    color: Color(0x26000000), // 15% opacity in hexadecimal
    offset: Offset(0, 24), // X: 0, Y: 21
    blurRadius: 64,
    spreadRadius: -10,
  )
];
const noShadow = [
  BoxShadow(
    color: Colors.transparent, // 15% opacity in hexadecimal
    offset: Offset(0, 0), // X: 0, Y: 21
    blurRadius: 0,
    spreadRadius: 0,
  )
];
