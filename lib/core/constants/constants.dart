import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/sizes_manager.dart';

class AppConstants {
  AppConstants._();

  static const String subDomain = 'https://taskaty.azurewebsites.net/Upload/';
  static const String userAvatar =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjIE9x_0IgzoW3whWyqVDXqK0K1hNxzNf_6meiHJJVTh4z7cz_LLY7aYXo6B-PfxqmYDc&usqp=CAU';
  static const String isoFormat = 'yyyy-MM-ddTHH:mm:ss.SSSZ';
  static const String normalFormat = 'dd-MMM-yyyy - HH:mm';

  ///
  static EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(
    vertical: AppSizes.size10.h,
    horizontal: AppSizes.size10.w,
  );

  ///
  static EdgeInsetsGeometry defaultVerticalPadding = EdgeInsets.symmetric(
    vertical: AppSizes.size10.h,
  );

  ///
  static EdgeInsetsGeometry defaultHorizontalPadding = EdgeInsets.symmetric(
    horizontal: AppSizes.size10.w,
  );

  ///
  static BorderRadius defaultBorderRadius = BorderRadius.circular(8.r);

  ///
  static BoxDecoration defaultBoxDecoration = BoxDecoration(
    borderRadius: AppConstants.defaultBorderRadius,
    boxShadow: [
      BoxShadow(
        blurRadius: 2,
        spreadRadius: 1,
        offset: const Offset(0, 0.1),
        color: Colors.grey.withOpacity(0.2),
      ),
    ],
  );

  ///
  static const List<Map<String, dynamic>> tasksList = [
    {
      "id": 1,
      "priorityId": 1,
      "title": "Complete Project Report",
      "departmentTag": "Project Management",
      "endDate": "2024-03-05T00:00:00Z",
      "progressCount": 70
    },
    {
      "id": 2,
      "priorityId": 2,
      "title": "Prepare Presentation",
      "departmentTag": "Mobile Development",
      "endDate": "2024-03-07T00:00:00Z",
      "progressCount": 90
    },
    {
      "id": 3,
      "priorityId": 3,
      "title": "Review Code Changes",
      "departmentTag": "Backend Development",
      "endDate": "2024-03-09T00:00:00Z",
      "progressCount": 30
    },
  ];

  ///
  static const List<Map<String, dynamic>> tasksList2 = [
    {
      "id": 11,
      "priorityId": 3,
      "title": "New Project Report",
      "departmentTag": "App Management",
      "endDate": "2024-02-20T00:00:00Z",
      "progressCount": 100
    },
    {
      "id": 21,
      "priorityId": 2,
      "title": "Prepare Presentation",
      "departmentTag": "App Development",
      "endDate": "2024-02-29T00:00:00Z",
      "progressCount": 100
    },
    {
      "id": 31,
      "priorityId": 3,
      "title": "Review Code Changes",
      "departmentTag": "Dotnet Development",
      "endDate": "2024-03-01T00:00:00Z",
      "progressCount": 100
    },
  ];

  ///
  static const List<Map<String, dynamic>> tasksList3 = [
    {
      "id": 12,
      "priorityId": 2,
      "title": "Complete Project Report3",
      "departmentTag": "Financial Management",
      "endDate": "2024-02-28T00:00:00Z",
      "progressCount": 60
    },
    {
      "id": 22,
      "priorityId": 2,
      "title": "Update Presentation",
      "departmentTag": "Accountant Development",
      "endDate": "2024-02-29T00:00:00Z",
      "progressCount": 50
    },
    {
      "id": 32,
      "priorityId": 2,
      "title": "Fix Code Changes",
      "departmentTag": "HR Development",
      "endDate": "2024-02-10T00:00:00Z",
      "progressCount": 40
    },
  ];

  ///
  static const List<Map<String, dynamic>> statisticsList = [
    {
      "statusId": 0,
      "count": 10,
    },
    {
      "statusId": 1,
      "count": 3,
    },
    {
      "statusId": 2,
      "count": 5,
    },
    {
      "statusId": 3,
      "count": 2,
    },
  ];

  static const Map<String, dynamic> task = {
    "id": 12,
    "title": "Complete Project Report3",
    "departmentTag": "Financial Management",
    "priorityId": 2,
    "progressCount": 60,
    "startDate": "2024-02-10T00:00:00Z",
    "endDate": "2024-02-28T00:00:00Z",
    "user": {
      "id": 1,
      "image":
          "https://media.newyorker.com/photos/59776d0672c5e854a512693d/master/w_2240,c_limit/Hsu-Monkey-Videos-as-a-Way-of-Life.jpg",
      "name": "مريم محمد",
    },
    "description":
        "لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة الخاطئة المتمثلة في إدانة السرور ومدح الألم ، وسأقدم لك وصفًا كاملاً للنظام",
    "attachments": [
      {
        "name": "sample.pdf",
        "extension": "pdf",
        "url":
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
      },
      {
        "name": "sample.png",
        "extension": "png",
        "url":
            "https://en.wikipedia.org/wiki/File:Image_created_with_a_mobile_phone.png",
      },
      {
        "name": "sample.doc",
        "extension": "doc",
        "url":
            "https://docs.google.com/document/d/10lc7Kqok3BDm1l2UsLSOiu0mspBuuTYTCUdolJfZ7k0/edit?usp=sharing",
      },
    ],
    "subtasks": [
      {
        "id": 1,
        "title": "المهمة الفرعية الأولى",
        "status": false,
      },
      {
        "id": 2,
        "title": "المهمة الفرعية الثانية",
        "status": true,
      },
      {
        "id": 3,
        "title": "المهمة الفرعية الثالثة",
        "status": false,
      }
    ],
    "comments": [
      {
        "id": 1,
        "createdAt": "2024-02-10T00:00:00Z",
        "comment":
            "لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة الخاطئة المتمثلة في إدانة السرور ومدح الألم ، وسأقدم لك وصفًا كاملاً للنظام",
        "user": {
          "id": 1,
          "image":
              "https://media.newyorker.com/photos/59776d0672c5e854a512693d/master/w_2240,c_limit/Hsu-Monkey-Videos-as-a-Way-of-Life.jpg",
          "name": "مريم محمد",
        },
      },
      {
        "id": 2,
        "createdAt": "2024-02-10T00:00:00Z",
        "comment":
            "لكن يجب أن أشرح لك كيف ولدت كل هذه الفكرة الخاطئة المتمثلة في إدانة السرور ومدح الألم ، وسأقدم لك وصفًا كاملاً للنظام",
        "user": {
          "id": 1,
          "image":
              "https://media.newyorker.com/photos/59776d0672c5e854a512693d/master/w_2240,c_limit/Hsu-Monkey-Videos-as-a-Way-of-Life.jpg",
          "name": "مريم محمد",
        },
      }
    ]
  };
}
