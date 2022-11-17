// ignore_for_file: depend_on_referenced_packages

import 'package:dio_client/data/network/api/user/user_api.dart';
import 'package:dio_client/data/network/dio_client.dart';
import 'package:dio_client/data/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(
    Dio(),
  );

  getIt.registerSingleton(
    DioClient(
      getIt<Dio>(),
    ),
  );

  getIt.registerSingleton(
    UserApi(
      dioClient: getIt<DioClient>(),
    ),
  );

  getIt.registerSingleton(
    UserRepository(
      getIt.get<UserApi>(),
    ),
  );
}
