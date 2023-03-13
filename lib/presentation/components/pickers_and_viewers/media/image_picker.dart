import 'dart:io';

import 'package:thepetgazette/presentation/components/popup_and_loaders/permission_compulsory_request_alert.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> pickImageFromGallery(
    {bool isCircleShape = false, bool isSquareCrop = false}) async {
  File? imageFile;

  await Permission.storage.request();
  await Permission.camera.request();
  if (await Permission.storage.request().isGranted &&
      await Permission.camera.request().isGranted) {
    final XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);

      return await cropImage(
          imageFile: imageFile,
          isCircleShape: isCircleShape,
          isSquareCrop: isSquareCrop);
    }
  } else {
    permissionCompulsoryRequestAlert(
        requestMessage:
            'Driving Grade Book needs access to your media and camera');
  }

  return imageFile;
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
