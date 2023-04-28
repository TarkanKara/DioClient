import 'package:flutter/material.dart';

import '../../di/service_locator.dart';
import '../controller.dart';
import '../new_user_page.dart';
import 'add_user_form.dart';

class AddUserBtn extends StatelessWidget {
  AddUserBtn({
    Key? key,
  }) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return UserForm(
              homeController: homeController,
              onSubmit: () async {
                await homeController.addNewUser();
                Navigator.pop(context);
                homeController.nameController.clear();
                homeController.jobController.clear();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewUserPage(),
                  ),
                );
              },
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
