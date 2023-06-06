import '../../../../shared/utilities/callback_methods.dart';
import '../../data/model/sample_model.dart';

// create an abstract class and declare the functions of that class.
abstract class SampleRepo {
  Future<SampleModel> sampleApiCall();
}
