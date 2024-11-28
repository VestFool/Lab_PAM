import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_pam/domain/entities/medical_center.dart';

class MedicalCenterRemoteDataSource {
  final http.Client client;

  MedicalCenterRemoteDataSource(this.client);

  Future<List<MedicalCenter>> fetchNearbyCenters() async {
    final response = await client.get(Uri.parse('https://api.example.com/centers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MedicalCenter.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
