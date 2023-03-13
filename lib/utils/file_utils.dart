import 'dart:io';

import 'package:path/path.dart' as path;

class FileUtils {
  static String getFileName(File file) {
    return path.basename(file.path);
  }
}
