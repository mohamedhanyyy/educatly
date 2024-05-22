import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
abstract class AttachmentModel with _$AttachmentModel {
  const factory AttachmentModel({
    required String url,
    required String name,
    required String extension,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}
