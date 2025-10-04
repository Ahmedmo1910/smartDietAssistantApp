part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserEntity userEntity;
  SigninSuccess({required this.userEntity});
}

class SigninFailure extends SigninState {
  final String message;
  SigninFailure({required this.message});
}

class SigninEmailNotVerified extends SigninState {
  final String message;
  SigninEmailNotVerified({required this.message});
}
