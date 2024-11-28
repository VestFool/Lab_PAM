import 'package:project_pam/domain/entities/medical_center.dart';
import 'package:project_pam/domain/repositories/medical_center_repository.dart';
import 'package:project_pam/data/datasources/medical_center_remote_data_source.dart';

class MedicalCenterRepositoryImpl implements MedicalCenterRepository {
  final MedicalCenterRemoteDataSource remoteDataSource;

  MedicalCenterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MedicalCenter>> getNearbyCenters() async {
    return await remoteDataSource.fetchNearbyCenters();
  }
}
