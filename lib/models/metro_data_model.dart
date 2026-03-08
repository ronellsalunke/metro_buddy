import 'package:freezed_annotation/freezed_annotation.dart';

part 'metro_data_model.freezed.dart';
part 'metro_data_model.g.dart';

@freezed
abstract class MetroDataModel with _$MetroDataModel {
  const factory MetroDataModel({@JsonKey(name: 'city') String? city, @JsonKey(name: 'metroLines') List<MetroLines>? metroLines}) =
      _MetroDataModel;

  factory MetroDataModel.fromJson(Map<String, Object?> json) => _$MetroDataModelFromJson(json);
}

@freezed
abstract class MetroLines with _$MetroLines {
  const factory MetroLines({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'whatsappNumber') String? whatsappNumber,
    @JsonKey(name: 'route') String? route,
    @JsonKey(name: 'line') String? line,
  }) = _MetroLines;

  factory MetroLines.fromJson(Map<String, Object?> json) => _$MetroLinesFromJson(json);
}
