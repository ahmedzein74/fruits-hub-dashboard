import 'dart:ui';

import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/proudct_repo/proudct_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_services.dart';
import 'package:fruits_hub_dashboard/core/services/fire_store_services.dart';
import 'package:fruits_hub_dashboard/core/services/subabase_storage.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/controller/cubit/add_proudct_cubit.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo_impl.dart';
import '../repos/proudct_repo/proudct_repo_impl.dart';
import 'storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(SubabaseStorageServices());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(
    storageServices: getIt.get<StorageServices>(),
  ));
  getIt.registerSingleton<ProudctRepo>(
      ProudctRepoImpl(databaseServices: getIt.get<DatabaseServices>()));
}
