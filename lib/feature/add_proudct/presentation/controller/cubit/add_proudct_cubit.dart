import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/proudct_repo/proudct_repo.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/domain/entities/add_proudct_entity.dart';
import 'package:meta/meta.dart';

part 'add_proudct_state.dart';

class AddProudctCubit extends Cubit<AddProudctState> {
  AddProudctCubit(this.imagesRepo, this.proudctRepo)
      : super(AddProudctInitial());

  final ImagesRepo imagesRepo;
  final ProudctRepo proudctRepo;

  Future<void> addProduct(AddProudctEntity addProudctEntity) async {
    emit(AddProudctLoading());
    final result = await imagesRepo.uploadImage(addProudctEntity.image);
    result.fold(
      (failure) {
        emit(AddProudctError(failure.message));
      },
      (url) async {
        addProudctEntity.imageUrl = url;
        var result = await proudctRepo.addProduct(addProudctEntity);
        result.fold(
          (failure) {
            emit(AddProudctError(failure.message));
          },
          (r) {
            emit(AddProudctSuccess());
          },
        );
      },
    );
  }
}
