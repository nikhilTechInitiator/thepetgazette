import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:thepetgazette/constants/app_styles.dart';
import 'package:thepetgazette/main.dart';

enum FileType { unknown, text, image, video, audio, application }

class FilePickerWithViewerWidget extends StatefulWidget {
  const FilePickerWithViewerWidget({super.key, this.label});

  final String? label;

  @override
  State<FilePickerWithViewerWidget> createState() =>
      _FilePickerWithViewerWidgetState();
}

class _FilePickerWithViewerWidgetState
    extends State<FilePickerWithViewerWidget> {
  List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey)),
          width: double.infinity,
          child: Column(
            children: [
              if (_files.isNotEmpty)
                ListView.separated(
                  itemCount: _files.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(4),
                  physics:const  NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    File file=_files[index];
                    return Row(
                      children: [
                        SvgPicture.asset(
                            'assets/file_${_getMimeType(file)}.svg',width: AppStyles().logicalWidth*.18,),
                       const  SizedBox(width: 4,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getFileName(file),style: Theme.of(context).textTheme.titleSmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              FutureBuilder(
                                future: _getFileSize(file),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data!);
                                  }
                                  return const Text('0 mb');
                                },
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            _files.remove(file);
                            setState(() {});
                          },
                          constraints:const  BoxConstraints(),
                          padding:const  EdgeInsets.only(right: 10,left: 8),
                        ),
                      ],
                    );
                    // return ListTile(
                    //   leading: ColoredBox(
                    //     color: Colors.red,
                    //
                    //     child: SvgPicture.asset(
                    //         'assets/file_${_getMimeType(file)}.svg'),
                    //   ),
                    //   horizontalTitleGap: 0,
                    //   title: Text(
                    //     _getFileName(file),
                    //   ),
                    //   contentPadding: EdgeInsets.zero,
                    //   subtitle: FutureBuilder(
                    //     future: _getFileSize(file),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<String> snapshot) {
                    //       if (snapshot.hasData) {
                    //         return Text(snapshot.data!);
                    //       }
                    //       return const Text('0 mb');
                    //     },
                    //   ),
                    //   trailing: IconButton(
                    //     icon: const Icon(Icons.close),
                    //     onPressed: () {
                    //       _files.remove(file);
                    //       setState(() {});
                    //     },
                    //   ),
                    //
                    // );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 4,);
                },

                ),
              if (_files.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.cloud_upload_outlined,
                        color: Colors.grey,
                        size: 56,
                      ),
                      Text('Upload your files here'),
                    ],
                  ),
                ),
              TextButton(
                onPressed: () async {
                  _handleStoragePermission();
                },
                child: const Text('Choose file'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _handleStoragePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus == PermissionStatus.granted) {
      _pickFiles();
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      showDialog(
        context: MyApp.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Storage permission required'),
          content: const Text(
              'Please grant storage permission from the app settings.'),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          actions: [
            TextButton(
              onPressed: () {
                // Handle cancel action
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.shade200,
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppStyles.sizedBoxHorizontalSmall,
            TextButton(
              onPressed: () {
                // Handle delete action
                openAppSettings();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text(
                'Open settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (await Permission.storage.status == PermissionStatus.restricted) {
      // The permission is restricted by an external factor outside the app's control.
      // You can show a message to the user informing them of the restriction and
      // providing instructions on how to lift the restriction.
      showDialog(
        context: MyApp.navigatorKey.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Storage permission restricted'),
          content: const Text(
              'The storage permission is restricted by an external factor outside the app\'s control.'),
          actions: [
            TextButton(
              onPressed: () {
                // Handle cancel action
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.grey.shade200,
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AppStyles.sizedBoxHorizontalSmall,
            TextButton(
              onPressed: () {
                // Handle delete action
                openAppSettings();
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text(
                'Open settings',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  String _getFileName(File file) {
    return path.basename(file.path);
  }

  Future<String> _getFileSize(File file) async {
    int fileSizeInBytes = await file.length();
    double fileSizeInKB = fileSizeInBytes / 1000;
    if (fileSizeInKB < 1000) {
      return '${fileSizeInKB.toStringAsFixed(0)} kb';
    } else {
      double fileSizeInMB = fileSizeInKB / 1000;
      if (fileSizeInMB < 1000) {
        return '${fileSizeInMB.toStringAsFixed(2)} mb';
      } else {
        double fileSizeInGB = fileSizeInMB / 1000;
        return '${fileSizeInGB.toStringAsFixed(2)} gb';
      }
    }
  }

  _pickFiles() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null) {
        _files = result.paths.map((path) => File(path!)).toList();
        setState(() {});
      }
    } catch (e) {
      debugPrint('file_picker an error === $e');
    }
  }

  String _getMimeType(File file) {
    String? mimeType = lookupMimeType(file.path);

    if (mimeType != null) {
      String type = mimeType.split('/').first;
      return type;
    } else {
      return 'unknown';
    }
  }

  FileType _getFileType(File file) {
    String? mimeType = lookupMimeType(file.path);

    if (mimeType != null) {
      String type = mimeType.split('/').first;
      if (type == 'image') {
        return FileType.image;
      } else if (type == 'audio') {
        return FileType.audio;
      } else if (type == 'video') {
        return FileType.video;
      } else if (type == 'application') {
        return FileType.application;
      } else if (type == 'text') {
        return FileType.text;
      } else {
        return FileType.unknown;
      }
    } else {
      return FileType.unknown;
    }
  }
}
