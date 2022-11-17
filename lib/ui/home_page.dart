// ignore_for_file: unused_import

import 'package:dio_client/ui/new_user_page.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(),
    );
  }
}

