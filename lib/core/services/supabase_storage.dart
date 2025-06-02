import 'dart:io';

import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constants/keys.dart';

class SupabaseStorage implements StorageServices {
  static late Supabase _supabase;

  @override
  Future<String> uploadImageToStorage(String path, File file) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var result = await _supabase.client.storage
        .from("fruits_images")
        .upload("$path/$fileName.$extensionName", file);

    final String imageUrl = _supabase.client.storage
        .from("fruits_images")
        .getPublicUrl(result);

    return imageUrl;
  }

  static createBucket(String bucketName) async {
    // Check if the bucket already exists
    final existingBuckets = await _supabase.client.storage.listBuckets();

    if (existingBuckets.any((bucket) => bucket.name == bucketName)) {
      return "Bucket '$bucketName' already exists.";
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
