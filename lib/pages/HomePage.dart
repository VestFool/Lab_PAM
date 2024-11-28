import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/DataController.dart';

class HomePage extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Data'),
      ),
      body: Obx(() {
        if (dataController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: dataController.banners.length,
          itemBuilder: (context, index) {
            var banner = dataController.banners[index];
            return ListTile(
              title: Text(banner.title),
              subtitle: Text(banner.description),
              leading: Image.network(banner.image),
            );
          },
        );
      }),
    );
  }
}
