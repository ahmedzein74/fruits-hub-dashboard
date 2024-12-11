import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/feature/add_proudct/presentation/views/widgets/add_proudct_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'AddProudctView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AddProudctViewBody()),
    );
  }
}
