// ignore_for_file: depend_on_referenced_packages

import 'package:dio_client/data/network/api/constant/endpoints.dart';
import 'package:dio_client/data/network/dio_client.dart';

import 'package:dio/dio.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  //Add Post Users:----------------------------------------------------------------------
  Future<Response> addUserApi(String name, String job) async {
    try {
      final Response response = await dioClient.postMethod(
        Endpoints.users,
        data: {
          "name": name,
          "job": job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Get Users:----------------------------------------------------------------------
  Future<Response> getUserApi() async {
    try {
      final Response response = await dioClient.getMethod(Endpoints.users);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Update(Put) Users:----------------------------------------------------------------------
  // !! PUT(Update) yöntemi için, yalnızca o kimliği içeren kullanıcıyı güncellemek için kullanıcının id e ihtiyacımız var.
  Future<Response> updateUserApi(int id, String name, String job) async {
    try {
      final Response response = await dioClient.putUpdateMethod(
        "${Endpoints.users}/$id",
        data: {
          "name": name,
          "job": job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //Delete Users:----------------------------------------------------------------------
  // !! Delete yöntemi için, yalnızca o kimliği içeren kullanıcıyı güncellemek için kullanıcının id e ihtiyacımız var.

  Future<void> deleteUserApi(int id) async {
    try {
      await dioClient.deleteMethod(
        "${Endpoints.users}/$id",
      );
    } catch (e) {
      rethrow;
    }
  }
}
