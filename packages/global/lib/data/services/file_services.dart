part of global;

String getFileSize(String path) {
  final file = File(path);
  int sizeInBytes = file.lengthSync();
  double sizeInMb =
      PrimitiveConversions.roundDouble(sizeInBytes / (1024 * 1024), 2);
  if (sizeInMb > 1) {
    return "$sizeInMb MB";
  }
  return "${sizeInMb * 1024} KB";
}

int roundUpAbsolute(double number) {
  return number.isNegative ? number.floor() : number.ceil();
}

String getHourText(String hour) {
  switch (hour) {
    case '24 hrs':
      return 'HOURS_24';
    case '48 hrs':
      return 'HOURS_48';
    case '48+ hrs':
      return 'HOURS_GREATER_THAN_48';
    default:
      return 'HOURS_24';
  }
}

Future<File?> showImagePicker(BuildContext context) async {
  ImagePicker imagePicker = ImagePicker();
  File? file;
  await bottomSheet(
    context: context,
    isScrollControlled: false,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    widget: SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: screenWidth,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 19,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: kWhite),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // buildTextButton(
                //     text: 'Photo Gallery',
                //     onTap: () async {
                //       var _pickedFile = await imagePicker.pickImage(
                //           source: ImageSource.gallery, imageQuality: 50);
                //       if (_pickedFile == null) return null;
                //       final _file = await saveImagePermanently(
                //           _pickedFile, generateRandomString(5));
                //       CroppedFile? croppedFile = await ImageCropper().cropImage(
                //         sourcePath: _file.path,
                //         aspectRatioPresets: [
                //           CropAspectRatioPreset.square,
                //           CropAspectRatioPreset.ratio3x2,
                //           CropAspectRatioPreset.original,
                //           CropAspectRatioPreset.ratio4x3,
                //           CropAspectRatioPreset.ratio16x9
                //         ],
                //         uiSettings: [
                //           AndroidUiSettings(
                //               toolbarTitle: 'Adjust Image',
                //               toolbarColor: kPrimary,
                //               toolbarWidgetColor: kWhite,
                //               initAspectRatio: CropAspectRatioPreset.original,
                //               lockAspectRatio: false),
                //           IOSUiSettings(
                //             title: 'Adjust Image',
                //           ),
                //           WebUiSettings(
                //             context: context,
                //           ),
                //         ],
                //       );
                //       if (croppedFile != null) {
                //         file = File(croppedFile.path);
                //       }
                //       Navigator.pop(context);
                //     }),
                // Divider(),
                buildTextButton(
                    text: 'Camera',
                    onTap: () async {
                      var pickedFile = await imagePicker.pickImage(
                          source: ImageSource.camera, imageQuality: 50);
                      if (pickedFile == null) return;
                      final file0 = await saveImagePermanently(
                          pickedFile, generateRandomString(5));
                      CroppedFile? croppedFile = await ImageCropper().cropImage(
                        sourcePath: file0.path,
                        aspectRatioPresets: [
                          CropAspectRatioPreset.square,
                          CropAspectRatioPreset.ratio3x2,
                          CropAspectRatioPreset.original,
                          CropAspectRatioPreset.ratio4x3,
                          CropAspectRatioPreset.ratio16x9
                        ],
                        uiSettings: [
                          AndroidUiSettings(
                              toolbarTitle: 'Adjust Image',
                              toolbarColor: kPrimary,
                              toolbarWidgetColor: kWhite,
                              initAspectRatio: CropAspectRatioPreset.original,
                              lockAspectRatio: false),
                          IOSUiSettings(
                            title: 'Adjust Image',
                          ),
                          WebUiSettings(
                            context: context,
                          ),
                        ],
                      );
                      if (croppedFile != null) {
                        file = File(croppedFile.path);
                      }
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          const Gap(10),
          //cancel button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              // height: 61,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 19,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: kWhite),
              child: Center(
                child: Text(
                  'Cancel',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: kPrimary,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
  return file;
}

Future<XFile> urlToFile(String imageUrl) async {
  // generate random number.
  var rng = Random(); // get temporary directory of device.
  Directory tempDir =
      await getTemporaryDirectory(); // get temporary path from temporary directory.
  String tempPath = tempDir
      .path; // create a new file in temporary path with random file name.
  File file = File(
      '$tempPath${rng.nextInt(100)}.png'); // call http.get method and pass imageUrl into it to get response.
  final response = await Dio()
      .get(imageUrl); // write bodyBytes received in response to file.
  await file.writeAsBytes(response
      .data); // now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
  return XFile(file.path);
}

Future<File> saveImagePermanently(XFile file, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFileName = '$name- ${file.path.split('/').last}';
  final newPath = '${appStorage.path}/$newFileName';
  return File(file.path).copy(newPath);
}

Future<File?> showFilePicker(BuildContext context, String name) async {
  var result = await FilePicker.platform.pickFiles(
      allowCompression: true,
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png']);
  if (result == null) return null;
  final file = await savePermanently(result.files.first, name);
  return file;
}

String generateRandomString(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}

Future<File> savePermanently(PlatformFile file, String name) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile =
      File('${appStorage.path}/${'$name-${file.name.split('/').last}'}');
  return File(file.path!).copy(newFile.path);
}

// void openFile(PlatformFile file) {
//   OpenFile.open(file.path!);
// }

InkWell buildTextButton({void Function()? onTap, required String text}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: kPrimary,
      ),
    ),
  );
}

Future<dynamic> bottomSheet(
    {required BuildContext context,
    bool? enableDrag,
    bool? isScrollControlled,
    Color backgroundColor = Colors.transparent,
    required Widget widget}) {
  return showModalBottomSheet(
    enableDrag: enableDrag ?? true,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled ?? true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18))),
    context: context,
    builder: (context) => BottomSheet(
        backgroundColor: backgroundColor,
        onClosing: () {},
        builder: (BuildContext context) => widget),
  );
}

mixin PrimitiveConversions {
  static String? getString(dynamic value) {
    if (value == null) {
      return null;
    }
    return value.toString();
  }

  static int? getInt(dynamic value) {
    if (value == null) {
      return null;
    }
    RegExp regex = RegExp(r"([.]*)(?!.*\d)");
    String data = value.toString().replaceAll(regex, '');
    return int.tryParse(data);
  }

  static int? getDiscountInt(dynamic value) {
    if (value == null) {
      return 0;
    }
    RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
    String data = value.toString().replaceAll(regex, '');
    return int.tryParse(data);
  }

  static double roundDouble(dynamic value, int places) {
    try {
      var mod = pow(10.0, places);
      return ((double.parse(value.toString()) * mod).round().toDouble() / mod);
    } catch (e) {
      return 0.0;
    }
  }

  String getNumberWithSymbol(dynamic number) {
    var numb = roundDouble(number, 2);
    if (numb < 0) {
      return '$numb'; // Returns negative numbers as they are with the negative sign
    } else if (numb > 0) {
      return '+$numb'; // Returns positive numbers with a positive sign
    } else {
      return '$numb'; // Returns 0 as it is
    }
  }

  static double? getDouble(dynamic value) {
    if (value == null) {
      return null;
    }
    return double.parse(value.toString());
  }

  static double? getRoundedDouble(dynamic value, int places) {
    if (value == null) {
      return null;
    }
    return roundDouble(double.parse(value.toString()), places);
  }

  static bool? getBool(dynamic value) {
    if (value == null) {
      return null;
    }
    return value as bool;
  }

  static DateTime? getDateTime(dynamic value) {
    if (value == null) {
      return null;
    }
    return value as DateTime;
  }

  static List? getList(dynamic value) {
    if (value == null) {
      return null;
    }
    return value as List;
  }

  static Map? getMap(dynamic value) {
    if (value == null) {
      return null;
    }
    return value as Map;
  }

  static Map<String, dynamic>? getMapOfStringDynamic(dynamic value) {
    if (value == null) {
      return null;
    }
    return Map<String, dynamic>.from(value as Map<String, dynamic>);
  }
}
