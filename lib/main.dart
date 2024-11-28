// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pam/data/datasources/MedicalCenterRemoteDataSource.dart';
import 'package:project_pam/data/repositories/MedicalCenterRepositoryImpl.dart';
import 'package:project_pam/domain/usecases/GetNearbyCenters.dart';
import 'package:project_pam/presentation/pages/HomePage.dart';
import 'package:http/http.dart' as http;

void main() {
  Get.lazyPut(() => MedicalCenterRemoteDataSource(http.Client()));
  Get.lazyPut(() => MedicalCenterRepositoryImpl(Get.find()));
  Get.lazyPut(() => GetNearbyCenters(Get.find()));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Medical Centers',
      home: HomePage(),
    );
  }
}
