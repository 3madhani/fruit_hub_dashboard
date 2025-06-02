import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImageToStorage(String path, File file) async {
    String fileName = p.basename(file.path);
    var fileRef = storageReference.child("$path/$fileName");

    await fileRef.putFile(file);

    return fileRef.getDownloadURL();
  }
}
