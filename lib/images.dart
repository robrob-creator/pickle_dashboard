class Images {
  ///----------------- Brand -----------------------------------//
  static String logoIcon = 'assets/images/logo/pickle.png';

  ///----------------- Dummy Image -----------------------------------//

  static List<String> avatars = List.generate(
      12, (index) => 'assets/images/dummy/avatar-${index + 1}.jpg');

  static List<String> squareImages =
      List.generate(15, (index) => 'assets/images/dummy/${index + 1}.jpg');

  static List<String> landscapeImages =
      List.generate(4, (index) => 'assets/images/dummy/l${index + 1}.jpg');
  static List<String> portraitImages =
      List.generate(3, (index) => 'assets/images/dummy/p${index + 1}.jpg');
}
