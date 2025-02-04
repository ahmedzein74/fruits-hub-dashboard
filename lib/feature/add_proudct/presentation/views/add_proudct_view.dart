import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/proudct_repo/proudct_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_services.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/controller/cubit/add_proudct_cubit.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/add_proudct_view_body.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/add_proudct_view_body_bloc_builder.dart';

import 'widgets/build_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'AddProudctView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProudctCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProudctRepo>(),
        ),
        child: const SafeArea(child: AddProudctViewBodyBlocBuilder()),
      ),
    );
  }
}
