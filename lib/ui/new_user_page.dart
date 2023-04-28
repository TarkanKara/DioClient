import 'package:dio_client/data/models/new_user_model.dart';
import 'package:dio_client/di/service_locator.dart';
import 'package:dio_client/ui/controller.dart';
import 'package:dio_client/ui/widgets/add_user_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({super.key});

  @override
  State<NewUserPage> createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  final homeControllerr = getIt.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Newly added User")),
      body: ListView.builder(
        itemCount: homeControllerr.newUsers.length,
        itemBuilder: (context, index) {
          final NewUser user = homeControllerr.newUsers[index];
          return ListTile(
              onLongPress: () async {
                await homeControllerr.deleteUser(index).then((value) {
                  setState(() {});
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("User Deleted Successfully"),
                    duration: Duration(seconds: 1),
                  ));
                });
              },
              onTap: () {
                homeControllerr.nameController.text = user.name!;
                homeControllerr.jobController.text = user.job!;
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return UserForm(
                      homeController: homeControllerr,
                      isUpdate: true,
                      onSubmit: () async {
                        await homeControllerr
                            .updateUser(
                          index,
                          homeControllerr.nameController.text,
                          homeControllerr.jobController.text,
                        )
                            .then((value) {
                          Navigator.pop(context);
                          setState(() {});
                        });

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("User Updated Successfully"),
                          duration: Duration(seconds: 1),
                        ));
                      },
                    );
                  },
                );
              },
              title: Text(user.name!),
              subtitle: Text(user.job!),
              trailing: user.updatedAt != null
                  ? Text(DateFormat().format(DateTime.parse(user.updatedAt!)))
                  : Text(DateFormat().format(DateTime.parse(user.createdAt!))));
        },
      ),
    );
  }
}
