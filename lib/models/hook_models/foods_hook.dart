import 'package:flutter/material.dart';
import 'package:multi_venors/models/foods_model.dart';

class FetchFoods {
  final List<FoodsModel> data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;


  FetchFoods({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
