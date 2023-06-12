import 'package:base_architecture/src/features/new_feature/data/model/sample_model.dart';
import 'package:base_architecture/src/shared/utilities/event_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../services/service_locator.dart';
import '../../domain/repo/sample_repo.dart';
part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final SampleRepo _apiRepo = serviceLocator<SampleRepo>();

  SampleBloc() : super(SampleState()) {
    on<SampleBlocEvent>((event, emit) async {
      emit(state.copyWith(apiCallStatus: StateLoading()));
      SampleModel sampleModel = await _apiRepo.sampleApiCall();
      /// HERE will check api status code & return data
      emit(state.copyWith(apiCallStatus: StateLoaded(successMessage: sampleModel.message ?? ''), sampleModel: sampleModel));
    });
  }
}
