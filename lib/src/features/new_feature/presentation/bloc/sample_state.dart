part of 'sample_bloc.dart';

class SampleState {
  final StateStatus apiCallStatus;
  final SampleModel? sampleModel;

  SampleState({
    this.apiCallStatus = const StateNotLoaded(),
    this.sampleModel,
  });

  SampleState copyWith({
    final StateStatus? apiCallStatus,
    final SampleModel? sampleModel,
  }) => SampleState(
    apiCallStatus: apiCallStatus ?? this.apiCallStatus,
    sampleModel: sampleModel ?? this.sampleModel,
  );
}
