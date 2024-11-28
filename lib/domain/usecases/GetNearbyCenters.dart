import 'package:project_pam/domain/repositories/medical_center_repository.dart';
import 'package:project_pam/domain/entities/medical_center.dart';

class GetNearbyCenters {
  final MedicalCenterRepository repository;

  GetNearbyCenters(this.repository);

  Future<List<MedicalCenter>> call() async {
    return await repository.getNearbyCenters();
  }
}
