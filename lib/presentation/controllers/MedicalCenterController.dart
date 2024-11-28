import 'package:get/get.dart';
import 'package:project_pam/domain/entities/medical_center.dart';
import 'package:project_pam/domain/usecases/get_nearby_centers.dart';

class MedicalCenterController extends GetxController {
  final GetNearbyCenters getNearbyCentersUseCase;

  var isLoading = true.obs;
  var centers = <MedicalCenter>[].obs;

  MedicalCenterController(this.getNearbyCentersUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchNearbyCenters();
  }

  void fetchNearbyCenters() async {
    try {
      isLoading(true);
      final result = await getNearbyCentersUseCase();
      centers.assignAll(result);
    } finally {
      isLoading(false);
    }
  }
}
