part of 'sample_bloc.dart';

abstract class SampleEvent extends Equatable {
  const SampleEvent();
}

class SampleBlocEvent extends SampleEvent{
  const SampleBlocEvent();

  @override
  List<Object?> get props => [];
}
