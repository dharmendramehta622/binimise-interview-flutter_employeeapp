part of staff;

String buttonText(int index) {
      if (index == 3) {
        return "Finish";
      } else if (index == 4) {
        return "Print";
      } else {
        return "Continue";
      }
    }

void showSuccessMessage(
  BuildContext context,
  String message, {
  Color textColor = kWhite,
  Color backgroundColor = kGreen,
  GlobalKey<ScaffoldMessengerState>? key,
}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    final snackbar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: screenHeight * .4),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
    if (key != null) {
      key.currentState?.showSnackBar(snackbar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  });
}

void showErrorMessage(
  BuildContext context,
  String message, {
  Color textColor = kWhite,
  Color backgroundColor = kRed200,
  GlobalKey<ScaffoldMessengerState>? key,
}) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    final snackbar = SnackBar(
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(vertical: screenHeight * .4),
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
    if (key != null) {
      key.currentState?.showSnackBar(snackbar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  });
}