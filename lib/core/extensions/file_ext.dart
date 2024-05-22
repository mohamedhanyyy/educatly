import '../constants/assets.dart';

extension FileExtension on String {
  String get getFileExtImage {
    switch (this) {
      case "png":
        return Assets.icons.png;
      case "doc":
        return Assets.icons.doc;
      case "pdf":
        return Assets.icons.pdf;
      default:
        return Assets.icons.doc;
    }
  }
}
