class GImages {
  static const String CLS1 = 'assets/images/cls1.jpg';
  static const String CLS2 = 'assets/images/cls2.jpg';
  static const String CLS3 = 'assets/images/cls3.jpg';
  static const String CLS4 = 'assets/images/cls4.jpg';
  static const String CLS5 = 'assets/images/cls5.jpg';
  static const String CLS6 = 'assets/images/cls6.jpg';
  static const String CLS7 = 'assets/images/cls7.jpg';
  static const String CLS8 = 'assets/images/cls8.jpg';
  static const String CLS9 = 'assets/images/cls9.jpg';
  static const String CLS10 = 'assets/images/cls10.jpg';
  static const String CLS11 = 'assets/images/cls11.jpg';
  static const String CLS12 = 'assets/images/cls12.jpg';

  static const String TRN1 = 'assets/images/trn1.jpg';
  static const String TRN2 = 'assets/images/trn2.jpg';
  static const String MAP = 'assets/images/map2.png';
  static const String FOOD = 'assets/images/crab.jpeg';
  static const String MUSCLE = 'assets/images/muscle_s.png';

  String getClsImage(String key) {
    switch (key) {
      case 'CLS1':
        return CLS1;
      case 'CLS2':
        return CLS2;
      case 'CLS3':
        return CLS3;
      case 'CLS4':
        return CLS4;
      case 'CLS5':
        return CLS5;
      case 'CLS6':
        return CLS6;
      case 'CLS7':
        return CLS7;
      case 'CLS8':
        return CLS8;
      case 'CLS9':
        return CLS9;
      case 'CLS10':
        return CLS10;
      case 'CLS11':
        return CLS11;
      case 'CLS12':
        return CLS12;
      default:
        return CLS1;
    }
  }
}
