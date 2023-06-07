part of 'sample_bloc.dart';

class SampleState {
  final StateStatus sampleApiCallStatus;
  final SampleModel? sampleModel;

  SampleState({
    this.sampleApiCallStatus = const StateNotLoaded(),
    this.sampleModel,
  });

  SampleState copyWith({
    StateStatus? sampleApiCallStatus,
    SampleModel? sampleModel,
  }) =>
      SampleState(
        sampleApiCallStatus: sampleApiCallStatus ?? this.sampleApiCallStatus,
        sampleModel: sampleModel ?? this.sampleModel,
      );
}
