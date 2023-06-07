import 'package:base_architecture/src/features/new_feature/data/repo_impl/sample_repo_impl.dart';
import 'package:base_architecture/src/features/new_feature/domain/repo/sample_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'api_services/dio_client.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  /// Dio Client
  serviceLocator.registerLazySingleton<Dio>(() => DioClient().provideDio());
  serviceLocator.registerLazySingleton<SampleRepo>(() => SampleRepoImpl());
}

void disposeServices() {
  /// dispose the service if any service has disposable objects.
}
