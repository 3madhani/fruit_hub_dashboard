import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage({required File image}) async {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}