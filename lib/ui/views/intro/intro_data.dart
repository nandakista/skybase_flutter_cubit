import 'package:skybase/config/themes/app_colors.dart';

class IntroData {
  final String image;
  final String tittle;
  final String description;

  IntroData({
    required this.image,
    required this.tittle,
    required this.description,
  });
}

final List<IntroData> introItem = [
  IntroData(
      image: AppImages.imgPv1.path,
      tittle: "Skybase Getx",
      description: "Code base for mobile platform using Getx, Dio, etc."),
  IntroData(
      image: AppImages.imgPv2.path,
      tittle: "Skybase Getx",
      description: "Lets create beautiful apps with us."),
  IntroData(
      image: AppImages.imgPv2.path,
      tittle: "Skybase Getx",
      description: "Created By Varcant"),
];
