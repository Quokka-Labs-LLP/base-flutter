import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/new_feature/data/repo_impl/sample_repo_impl.dart';
import '../features/new_feature/domain/repo/sample_repo.dart';
import 'api_services/dio_client.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator..registerLazySingleton<Dio>(() => DioClient().provideDio())
  ..registerLazySingleton<SampleRepo>(() => SampleRepoImpl());
}

void disposeServices() {
  /// dispose the service if any service has disposable objects.
}
