import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_snack_bar.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/controller/cubit/add_proudct_cubit.dart';

import 'add_proudct_view_body.dart';

class AddProudctViewBodyBlocBuilder extends StatelessWidget {
  const AddProudctViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProudctCubit, AddProudctState>(
      listener: (context, state) {
        if (state is AddProudctSuccess) {
          buildSnackBar(context, 'proudct added successfully');
        }
        if (state is AddProudctError) {
          buildSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return state is AddProudctLoading
            ? const Center(child: CircularProgressIndicator())
            : const AddProudctViewBody();
      },
    );
  }
}
