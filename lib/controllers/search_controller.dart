// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:multi_venors/constants/constants.dart';
import 'package:multi_venors/models/api_eror.dart';
import 'package:multi_venors/models/foods_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  List<FoodsModel>? searchResults;

  void searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/foods/search/$key");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
