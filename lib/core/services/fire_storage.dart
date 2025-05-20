import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();

  // The private constructor is used to prevent the instantiation of this class.
  // It follows the Singleton pattern, which means that only one instance of
  // this class can exist at any given time. This is useful when we want to
  // provide a single point of access to a resource, such as a database or a
  // file.
  FireStorage._();
  @override
  Future<String> uploadImageToStorage(String path, File file) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var fileRef = storageReference.child("$path/$fileName.$extensionName");

    await fileRef.putFile(file);

    return fileRef.getDownloadURL();
  }
}
