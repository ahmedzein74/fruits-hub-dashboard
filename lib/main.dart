import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/functions/on_genrate_route.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_services.dart';
import 'package:fruits_hub_dashboard/core/services/subabase_storage.dart';
import 'core/services/custom_bloc_observer.dart';
import 'feature/dashboard/presentation/views/dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp();

  await SubabaseStorageServices.initSupabase();
  await SubabaseStorageServices.createBukets("furits_images");

  setupGetIt();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
          initialRoute: DashboardView.routeName,
        );
      },
    );
  }
}
