part of staff;

mixin Assets {
  static AssetIcons get icons => AssetIcons();
  static AssetImages get images => AssetImages();
  static AssetJson get json => AssetJson();
  static AssetLotties get lotties => AssetLotties();
}

class AssetIcons {
  String location = 'packages/staff/assets/icons';

  String get logo_transparent => '$location/logo2t.svg';
  String get logo => '$location/logo.svg';
  String get back_arrow => '$location/chevron-back.svg';
  String get dot => '$location/dot.svg';
  String get circular_arrow => '$location/circular_arrow.svg';
  String get home => '$location/home.svg';
  String get like => '$location/like.svg';
  String get boost => '$location/boost.svg';
  String get notification => '$location/notification.svg';
  String get filter => '$location/filter.svg';
  String get patient => '$location/patient.svg';
  String get settings => '$location/settings.svg';
  String get document => '$location/document.svg';
  String get arrow_right => '$location/arrow-right.svg';
  String get arrow_down => '$location/arrow-down.svg';
  String get selection => '$location/selection.svg';
  String get more => '$location/more.svg';
  String get map => '$location/location.svg';
  String get phone => '$location/phone.svg';
  String get bithdate => '$location/dateofbirth.svg';
  String get weight => '$location/weight.svg';
  String get male => '$location/male.svg';
  String get arrow_up => '$location/arrow-up.svg';
}

class AssetImages {
  String location = 'packages/staff/assets/images';

  String get defaultImage => '$location/dailydealsimg.png';
  String get prashant => '$location/prashant.jpg';
  String get anime => '$location/anime.jpg';
  String get ani => '$location/ani.jpg';
  String get chicken => '$location/chicken.png';
  String get horse => '$location/horse.png';
  String get dog => '$location/dog.png';
}

class AssetJson {
  String location = 'assets/json';

  String get countries => '$location/countries.json';
  String get not_found => '$location/countries.json';
}

class AssetLotties {
  String location = 'assets/json/lottie';
  String get not_found => '$location/404.json';
  String get no_internet => '$location/no_internet.json';
  String get success => '$location/success.json';
  String get search => '$location/search.json';
  String get login => '$location/login.json';
  String get confirm => '$location/confirm.json';
  String get otp => '$location/otp.json';
  String get otp_verify => '$location/otp_loading.json';
  String get empty => '$location/empty.json';
}
