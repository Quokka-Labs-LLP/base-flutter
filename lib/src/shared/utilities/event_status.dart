import 'package:equatable/equatable.dart';

abstract class StateStatus extends Equatable {
  const StateStatus();
  @override
  List<Object> get props => [];
}

class StateNotLoaded extends StateStatus {
  const StateNotLoaded();
}

class StateLoading extends StateStatus {}

class StateLoaded extends StateStatus {
  final String successMessage;

  const StateLoaded({required this.successMessage});
  @override
  List<Object> get props => [successMessage];
}

class StateFailed extends StateStatus {
  final String errorMessage;

  const StateFailed({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
