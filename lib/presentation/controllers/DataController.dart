import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import '../models/Banner.dart';
import '../models/Category.dart';
import '../models/MedicalCenter.dart';

class DataController extends GetxController {
  var banners = <Banner>[];
  var categories = <Category>[];
  var centers = <MedicalCenter>[];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    isLoading(true);
    try {
      String jsonString = await rootBundle.rootBundle.loadString('assets/data.json');
      Map<String, dynamic> jsonResponse = json.decode(jsonString);

      // Заполняем данные
      banners = (jsonResponse['banners'] as List).map((item) => Banner.fromJson(item)).toList();
      categories = (jsonResponse['categories'] as List).map((item) => Category.fromJson(item)).toList();
      centers = (jsonResponse['nearby_centers'] as List).map((item) => MedicalCenter.fromJson(item)).toList();
    } catch (e) {
      print("Error loading data: $e");
    } finally {
      isLoading(false);
    }
  }
}
