import 'dart:convert';

import 'package:metro_buddy/data/base_api_services.dart';
import 'package:metro_buddy/data/endpoints.dart';
import 'package:metro_buddy/models/metro_data_model.dart';

class AppRepository {
  final BaseApiServices _apiServices;

  AppRepository({required BaseApiServices apiServices}) : _apiServices = apiServices;

  Future<List<MetroDataModel>> getMetroData() async {
    final response = await _apiServices.getGetApiResponse(Endpoints.metroData);

    dynamic data = response;
    if (data is String) {
      data = jsonDecode(data);
    }

    if (data is List) {
      return data.map((e) => MetroDataModel.fromJson(e as Map<String, Object?>)).toList();
    }
    return [];
  }
}
