import 'package:dio_client/data/models/user_model.dart';
import 'package:dio_client/data/repository/user_repository.dart';
import 'package:dio_client/di/service_locator.dart';
import 'package:flutter/material.dart';

import '../data/models/new_user_model.dart';

class HomeController {
  // --------------- Repository -------------
  final userRepository = getIt.get<UserRepository>();

  // -------------- Textfield Controller ---------------
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  // -------------- Local Variables ---------------
  final List<NewUser> newUsers = [];

  // -------------- Methods ---------------

  // getUsers
  Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    return users;
  }

  //addNewUsers
  Future<NewUser> addNewUser() async {
    final newlyAddedUser = await userRepository.addNewUserRequested(
        nameController.text, jobController.text);
    newUsers.add(newlyAddedUser);
    return newlyAddedUser;
  }

  //updateUser
  Future<NewUser> updateUser(int id, String name, String job) async {
    final updateUser = await userRepository.updateUserRequested(id, name, job);
    newUsers[id] = updateUser;
    return updateUser;
  }

  //deleteNewUser
  Future<void> deleteUser(int id) async {
    await userRepository.deletedNewUserRequested(id);
    newUsers.removeAt(id);
  }
}
