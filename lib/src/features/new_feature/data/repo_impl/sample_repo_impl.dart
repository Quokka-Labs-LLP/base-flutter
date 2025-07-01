import 'package:dio/dio.dart';

import '../../../../services/service_locator.dart';
import '../../../../shared/constants/api_constants.dart';
import '../../domain/repo/sample_repo.dart';
import '../model/sample_model.dart';

class SampleRepoImpl extends SampleRepo {
  final Dio _dio = serviceLocator<Dio>();

  @override
  Future<SampleModel> sampleApiCall() async {
    final apiResponse = await _dio.get(ApiConst.sampleApi);
    final parseData = SampleModel.fromJson(apiResponse.data);
    return parseData;
  }
}
