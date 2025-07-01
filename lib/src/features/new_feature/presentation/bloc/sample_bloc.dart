import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/service_locator.dart';
import '../../../../shared/utilities/event_status.dart';
import '../../data/model/sample_model.dart';
import '../../domain/repo/sample_repo.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final SampleRepo _apiRepo = serviceLocator<SampleRepo>();

  SampleBloc() : super(SampleState()) {
    on<SampleBlocEvent>((final event, final emit) async {
      emit(state.copyWith(apiCallStatus: StateLoading()));
      final SampleModel sampleModel = await _apiRepo.sampleApiCall();
      /// HERE will check api status code & return data
      emit(state.copyWith(apiCallStatus: StateLoaded(successMessage: sampleModel.message ?? ''), sampleModel: sampleModel));
    });
  }
}
