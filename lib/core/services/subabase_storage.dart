import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SubabaseStorageServices implements StorageServices {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://iczixyquckgaxupnohgd.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imljeml4eXF1Y2tnYXh1cG5vaGdkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYzNTAwMjYsImV4cCI6MjA1MTkyNjAyNn0.UQ8d98x9ILzq-Rkrh3pMRtAVZ7PJ9RgGjB-bWLoS3Fc',
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var response = await _supabase.client.storage
        .from('furits_images')
        .upload('$path/$fileName.$extensionName', file);

    return response;
  }
}
