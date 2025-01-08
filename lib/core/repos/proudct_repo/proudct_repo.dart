import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_entity.dart';

abstract class ProudctRepo {
  Future<Either<Failure, void>> addProduct(AddProudctEntity addProudctEntity);
}
