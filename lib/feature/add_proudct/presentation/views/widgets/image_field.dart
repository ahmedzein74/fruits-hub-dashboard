import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;
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
            await prickImage();
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  )),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!))
                  : const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 140,
                          color: Colors.grey,
                        ),
                        Text(
                          'Add Image',
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        ),
                      ],
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  fileImage = null;
                  widget.onFileChanged(fileImage);
                  setState(() {});
                },
                icon: const Icon(
                  size: 30,
                  Icons.delete_outline,
                  color: Color.fromARGB(255, 189, 189, 189),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> prickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);

    widget.onFileChanged(fileImage!);
  }
}
