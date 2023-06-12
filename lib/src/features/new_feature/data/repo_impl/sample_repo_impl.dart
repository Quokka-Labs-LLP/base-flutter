import 'package:base_architecture/src/features/new_feature/data/model/sample_model.dart';
import 'package:base_architecture/src/features/new_feature/domain/repo/sample_repo.dart';
import 'package:base_architecture/src/shared/constants/api_constants.dart';
import 'package:dio/dio.dart';
import '../../../../services/service_locator.dart';

class SampleRepoImpl extends SampleRepo {
  final Dio _dio = serviceLocator<Dio>();

  @override
  Future<SampleModel> sampleApiCall() async {
    final apiResponse = await _dio.get(ApiConst.sampleApi);
    final parseData = SampleModel.fromJson(apiResponse.data);
    return parseData;
  }
}