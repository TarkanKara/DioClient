// ignore_for_file: unused_import

import 'package:dio_client/data/models/user_model.dart';
import 'package:dio_client/di/service_locator.dart';
import 'package:dio_client/ui/new_user_page.dart';
import 'package:dio_client/ui/widgets/add_user_btn.dart';
import 'package:flutter/material.dart';

import 'controller.dart';
import 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      floatingActionButton: AddUserBtn(),
      body: FutureBuilder<List<UserModel>>(
        future: homeController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text("Error : $error"),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No data"),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final users = snapshot.data![index];
                return ListTile(
                  leading: users.avatar != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(users.avatar!,
                              width: 50, height: 50))
                      : null,
                  title: Text(users.email ?? ""),
                  subtitle: Text(users.firstName ?? ""),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
