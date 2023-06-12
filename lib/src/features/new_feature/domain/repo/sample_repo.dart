import '../../data/model/sample_model.dart';

abstract class SampleRepo {
  Future<SampleModel> sampleApiCall(); /// We can also use Either for the return type.
}
