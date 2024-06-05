import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/extensions/string.dart';

class PickerDialog {
  Future<void> pickGalleryImage({
    ValueChanged<File?>? onGet,
  }) async {
    final ImagePicker picker = ImagePicker();
    XFile? imagePaths = await picker.pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    onGet!(imagePaths?.getFile);
  }

  Future<void> pickGalleryImages({
    ValueChanged<List<File>>? onGet,
  }) async {
    final ImagePicker picker = ImagePicker();
    List<XFile>? listImagePaths = await picker.pickMultiImage(
      imageQuality: 100,
    );
    onGet!(listImagePaths.getListFile);
  }

  Future<void> pickFiles({
    ValueChanged<List<File>>? onGet,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
      allowCompression: true,
    );
    List<File>? files =
        result != null ? result.paths.map((path) => File(path!)).toList() : [];
    onGet!(files);
  }
}
