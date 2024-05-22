import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  const StatisticsModel._();

  const factory StatisticsModel({
    required int id,
    required int color,
    required String icon,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}
