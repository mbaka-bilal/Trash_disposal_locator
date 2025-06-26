/*
Created by: Mbaka bilal <mbakabilal.t@gmail.com>
Created on: 24,June,2025
Updated by: Mbaka bilal <mbakabilal.t@gmail.com>
Updated on: 26,June,2025
*/

extension ImageExtensions on String {
  String get pngIcon => "assets/icons/png/$this.png";
  String get svgIcon => "assets/icons/svg/$this.png";
  String get pngImage => "assets/images/png/$this.png";
  String get svgImage => "assets/images/png/$this.png";
  String get gif => "assets/gifs/$this.gif";
  String get lottie => "assets/lottie/$this.json";
}

extension ImageType on String {
  bool get isSvg => endsWith("svg");
  bool get isRemote => startsWith("http");
  bool get isAnAsset => contains("assets");
  bool get isLottie => endsWith("json");
}

extension StringExtensions on String {
  String firstLetterToUppercase() => this[0].toUpperCase() + substring(1);
}
