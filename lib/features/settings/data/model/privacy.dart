import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy.freezed.dart';
part 'privacy.g.dart';

@freezed
class Privacy with _$Privacy {
  const Privacy._();

  const factory Privacy({
    required String title,
    required String description,
  }) = _Privacy;

  factory Privacy.fromJson(Map<String, dynamic> json) =>
      _$PrivacyFromJson(json);
}
