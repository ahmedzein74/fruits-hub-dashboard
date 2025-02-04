import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/proudct_repo/proudct_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/data/models/add_proudct_input_model.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_input_entity.dart';

class ProudctRepoImpl implements ProudctRepo {
  final DatabaseServices databaseServices;

  ProudctRepoImpl({required this.databaseServices});
  @override
  Future<Either<Failure, void>> addProduct(
      AddProudctEntity addProudctEntity) async {
    try {
      await databaseServices.addData(
          path: BackendEndpoint.addProudcts,
          data: AddProudctInputModel.fromEntity(addProudctEntity).toMap());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
