import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final String code;
  final String name;

  LanguageModel({required this.code, required this.name});

  @override
  List<Object?> get props => [code, name];
}

class LanguageData {
  LanguageData._();

  static List<LanguageModel> languageList = [
    LanguageModel(
      code: 'ar',
      name: 'العربية',
    ),
    LanguageModel(
      code: 'en',
      name: 'English',
    ),
  ];
}
