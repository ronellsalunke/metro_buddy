import 'package:flutter/foundation.dart';
import 'package:metro_buddy/models/metro_data_model.dart';
import 'package:metro_buddy/repository/repository.dart';

class MetroProvider extends ChangeNotifier {
  final AppRepository _repository;

  MetroProvider(this._repository);

  List<MetroDataModel> _metroDataList = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MetroDataModel> get metroDataList => _metroDataList;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchMetroData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _metroDataList = await _repository.getMetroData();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
