import 'package:equatable/equatable.dart';

abstract class DataState {}

abstract class PageState extends Equatable implements DataState {}

class InitialState extends PageState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends PageState {
  LoadingState(this.loadingMessage);

  final String? loadingMessage;
  @override
  List<Object?> get props => [];
}

class LoadedState<T> extends PageState {
  LoadedState({this.data, this.message});
  final T? data;
  final String? message;

  @override
  List<Object?> get props => [data];
}

class ErrorState extends PageState {
  ErrorState(this.errorMessage);

  final String errorMessage;

  @override
  List<String> get props => [errorMessage];
}

