import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/keys.dart';

class SupabaseStorage implements StorageServices {
  static late Supabase _supabase;

  @override
  Future<String> uploadImageToStorage(String path, File file) async {
    // Ensure the bucket exists
    String fileName = p.basename(file.path);
    await _supabase.client.storage
        .from("fruits_images")
        .upload("$path/$fileName", file);

    final String imageUrl = _supabase.client.storage
        .from("fruits_images")
        .getPublicUrl("$path/$fileName.");

    return imageUrl;
  }

  static createBucket(String bucketName) async {
    // Check if the bucket already exists
    final existingBuckets = await _supabase.client.storage.listBuckets();

    if (existingBuckets.any((bucket) => bucket.id == bucketName)) {
      return;
    } else {
      await _supabase.client.storage.createBucket(
        bucketName,
        const BucketOptions(public: true),
      );
    }
  }

  static initSupabase() async {
    // Initialize Supabase
    _supabase = await Supabase.initialize(
      url: Keys.supabaseUrl,
      anonKey: Keys.supabaseKey,
    );
  }
}
