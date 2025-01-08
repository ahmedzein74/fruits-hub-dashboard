import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/functions/on_genrate_route.dart';
import 'package:fruits_hub_dashboard/core/services/subabase_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'feature/dashboard/presentation/views/dashboard_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SubabaseStorageServices.initSupabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: DashboardView.routeName,
      ),
    );
  }
}
