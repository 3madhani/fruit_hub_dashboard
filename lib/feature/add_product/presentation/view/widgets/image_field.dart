import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import 'remove_image_button.dart';

class ImageField extends StatefulWidget {
  final ValueChanged<File?> onFileChanged;
  const ImageField({super.key, required this.onFileChanged});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImageFunc();
          } on Exception catch (e) {
            // TODO
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryLightColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
                  fileImage != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(fileImage!, fit: BoxFit.fill),
                      )
                      : const Icon(
                        size: 180,
                        Icons.image_rounded,
                        color: Colors.grey,
                      ),
            ),
            Visibility(
              visible: fileImage != null,
              child: Positioned(
                top: 0,
                right: 0,
                child: RemoveImageButton(
                  onPressed: () {
                    fileImage = null;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFunc() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      fileImage = File(image.path);
      widget.onFileChanged(fileImage);
    }
  }
}
