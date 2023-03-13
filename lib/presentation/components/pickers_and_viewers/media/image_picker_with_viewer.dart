import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../popup_and_loaders/permission_compulsory_request_alert.dart';

class ImagePickerWithViewerWidget extends StatefulWidget {
  const ImagePickerWithViewerWidget({super.key});

  @override
  State<ImagePickerWithViewerWidget> createState() =>
      _ImagePickerWithViewerWidgetState();
}

class _ImagePickerWithViewerWidgetState
    extends State<ImagePickerWithViewerWidget> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          if (_image != null) Image.file(_image!),
          if (_image == null)
            const Padding(
              padding: EdgeInsets.only(top: 20.0,bottom: 10),
              child: Icon(
                Icons.image,
                color: Colors.grey,
                size: 56,
              ),
            ),
          TextButton(
            onPressed: () async {
              _image = await pickImage();
              setState(() {});
            },
            child: const Text('Cho image'),
          ),
        ],
      ),
    );
  }
}

Future<File?> checkPermission(
    {bool isCircleShape = false, bool isSquareCrop = false}) async {
  File? imageFile;
  // await Permission.camera.request();
  await Permission.storage.request();
  await Permission.storage.request();
  bool hasStoragePermission = await Permission.storage.status.isGranted;
  // bool hasCameraPermission = await Permission.camera.status.isGranted;

  debugPrint('hasStoragePermission $hasStoragePermission ');
  // hasCameraPermission $hasCameraPermission');

  if (await Permission.storage.request().isGranted
      // &&
      // await Permission.camera.request().isGranted
      ) {
  } else {
    permissionCompulsoryRequestAlert(
        requestMessage:
            'Driving Grade Book needs access to your media and camera');
  }

  return imageFile;
}

Future<File?> pickImage(
    {bool isCircleShape = false, bool isSquareCrop = false}) async {
  File? imageFile;

  final XFile? pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    imageFile = File(pickedFile.path);

    return await cropImage(
        imageFile: imageFile,
        isCircleShape: isCircleShape,
        isSquareCrop: isSquareCrop);
  }

  return null;
}

Future<File?> cropImage(
    {required File imageFile,
    bool isCircleShape = false,
    bool isSquareCrop = false}) async {
  CroppedFile? croppedFile;
  try {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: isCircleShape ? CropStyle.circle : CropStyle.rectangle,
      aspectRatioPresets: isSquareCrop
          ? [
              CropAspectRatioPreset.square,
            ]
          : [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    return File(croppedFile!.path);
  } catch (e) {
    return null;
  }
}
