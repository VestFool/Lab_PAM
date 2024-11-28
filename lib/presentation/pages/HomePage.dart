import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pam/presentation/controllers/medical_center_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MedicalCenterController controller = Get.put(MedicalCenterController(Get.find()));

    return Scaffold(
      appBar: AppBar(title: Text('Nearby Medical Centers')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.centers.length,
            itemBuilder: (context, index) {
              final center = controller.centers[index];
              return ListTile(
                title: Text(center.title),
                subtitle: Text('${center.locationName} - ${center.reviewRate} stars'),
              );
            },
          );
        }
      }),
    );
  }
}
