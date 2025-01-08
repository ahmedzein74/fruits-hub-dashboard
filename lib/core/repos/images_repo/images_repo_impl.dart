import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices storageServices;

  ImagesRepoImpl({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageServices.uploadImage(image, BackendEndpoint.images);
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('failed to upload image'));
    }
  }
}
