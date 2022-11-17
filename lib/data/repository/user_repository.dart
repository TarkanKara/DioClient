// ignore_for_file: depend_on_referenced_packages

import 'package:dio_client/data/models/new_user_model.dart';
import 'package:dio_client/data/models/user_model.dart';
import 'package:dio_client/data/network/api/user/user_api.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

//Get Users Requested :---------------------------------------------------------
  Future<List<UserModel>> getUsersRequested() async {
    try {
      final Response response = await userApi.getUserApi();
      final users = (response.data["data"] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } catch (e) {
      rethrow;
    }
  }

//Add Post New Users :----------------------------------------------------------
  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final Response response = await userApi.addUserApi(name, job);
      return NewUser.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

//Update(Put) Users:------------------------------------------------------------
  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final Response response = await userApi.updateUserApi(id, name, job);
      return NewUser.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

//Delete Users:-----------------------------------------------------------------
  Future<void> deletedNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } catch (e) {
      rethrow;
    }
  }
}
