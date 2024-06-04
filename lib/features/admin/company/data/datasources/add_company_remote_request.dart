import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/services/network/api/network_api.dart';
import '../../../../../core/services/network/network_utils.dart';
import '../../../add_task/data/model/add_task_response.dart';

part 'add_company_remote_request.g.dart';

abstract class AddCompanyRemoteRequest {
  Future<AddTaskResponse> addCompany({
    required String arabicName,
    required String managerId,
    required String englishName,
    required String address,
    required File? companyLogo,
  });

  Future<AddTaskResponse> editCompany({
    required String arabicName,
    required String englishName,
    required String address,
    required File? companyLogo,
  });
}

@riverpod
AddCompanyRemoteRequest addCompanyRemoteRequest(
    AddCompanyRemoteRequestRef ref) {
  return AddCompanyRemoteRequestImpl();
}

class AddCompanyRemoteRequestImpl implements AddCompanyRemoteRequest {
  @override
  Future<AddTaskResponse> addCompany({
    required String arabicName,
    required String englishName,
    required String address,
    required String managerId,
    required File? companyLogo,
  }) async {
    FormData formData = FormData.fromMap({
      "NameAr": arabicName,
      "NameEn": englishName,
      'Address': address,
      "ManagerId": managerId,
      "Logo": companyLogo == null
          ? null
          : await MultipartFile.fromFile(companyLogo.path),
    });
    await NetworkRequest.instance.requestDataFuture<AddTaskResponse>(
      url: Api.addCompany,
      method: Method.post,
      params: formData,
    );
    return AddTaskResponse();
  }

  @override
  Future<AddTaskResponse> editCompany({
    required String arabicName,
    required String englishName,
    required String address,
    required File? companyLogo,
  }) async {
    FormData formData = FormData.fromMap({
      "nameAr": arabicName,
      "nameEn": englishName,
      'address': address,
      "logo": companyLogo == null
          ? null
          : await MultipartFile.fromFile(companyLogo.path),
    });
    await NetworkRequest.instance.requestDataFuture<AddTaskResponse>(
        url: Api.addCompany, method: Method.post, params: formData);
    return AddTaskResponse();
  }
}
