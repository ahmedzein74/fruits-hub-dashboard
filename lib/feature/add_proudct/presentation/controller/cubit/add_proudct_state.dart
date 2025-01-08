part of 'add_proudct_cubit.dart';

@immutable
sealed class AddProudctState {}

final class AddProudctInitial extends AddProudctState {}

final class AddProudctLoading extends AddProudctState {}

final class AddProudctError extends AddProudctState {
  final String errorMessage;
  AddProudctError(this.errorMessage);
}

final class AddProudctSuccess extends AddProudctState {}
