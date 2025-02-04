import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SubabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static createBukets(String buketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExist = false;

    for (var bucket in buckets) {
      if (bucket.id == buketName) {
        isBucketExist = true;
        break;
      }
    }

    if (!isBucketExist) {
      await _supabase.client.storage.createBucket(buketName);
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://iczixyquckgaxupnohgd.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imljeml4eXF1Y2tnYXh1cG5vaGdkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNjM1MDAyNiwiZXhwIjoyMDUxOTI2MDI2fQ.krTpWqxnR-QT4UfUCkgpAjA8NF7eR-g3ZSFdDimDRSM',
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var response = await _supabase.client.storage
        .from('furits_images')
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from('furits_images')
        .getPublicUrl('$path/$fileName.$extensionName');

    return response;
  }
}
