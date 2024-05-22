import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';

extension GetStringUtils on String? {
  bool get hasValidName => RegExp(r'^[a-zA-Z\s]{3,30}$').hasMatch(this ?? '');

  bool get isNumber => RegExp(r'^[0-9]+$').hasMatch(this ?? '');

  bool get hasValidUserName =>
      RegExp(r'^(?![0-9])\w{5,}$').hasMatch(this ?? '');

  bool get hasValidPassword => RegExp(r'^\p{L}+$').hasMatch(this ?? '');

  /// Checks if string is URL.
  bool get isURL => RegExp(
          r"^(((([Hh])([Tt])|([Ff]))([Tt])(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,7}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$")
      .hasMatch(this ?? '');

  /// Checks if string is email.
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(this ?? '');

  bool get isSVG => this!.contains(".svg");

  /// Checks if string is phone number.
  bool get isPhoneNumber {
    if (this == null || this!.length > 16 || this!.length < 7) return false;
    return RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
        .hasMatch(this ?? '');
  }

  TimeOfDay get getTimeOfDay {
    List<String> parts = this!.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    return TimeOfDay(hour: hours, minute: minutes);
  }

  Future<File> get getImageFileByUrl async {
    var file = await DefaultCacheManager().getSingleFile(this!);
    File result = await File(file.path);
    return result;
  }
}

extension GetTimeUtils on TimeOfDay? {
  String? get getStringTime {
    if (this != null) {
      return '${this!.hour.toString().padLeft(2, '0')}:${this!.minute.toString().padLeft(2, '0')}';
    }
    return null;
  }
}

extension GetListFileUtils on List<XFile> {
  List<File> get getListFile {
    return this.map((e) => File(e.path)).toList();
  }
}

extension GetFileUtils on XFile {
  File get getFile {
    return File(this.path);
  }
}

extension GetMonthDayCount on DateTime {
  int get getDaysCount {
    return DateTimeRange(
      start: DateTime(this.year, this.month, 1),
      end: DateTime(
        this.month != 12 ? this.year : this.year + 1,
        this.month != 12 ? this.month + 1 : 1,
        1,
      ),
    ).duration.inDays;
  }
}
