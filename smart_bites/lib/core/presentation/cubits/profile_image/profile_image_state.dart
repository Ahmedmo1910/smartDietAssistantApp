abstract class ProfileImageState {}

class ProfileInitial extends ProfileImageState {}

class ProfileLoading extends ProfileImageState {}

class ProfileLoaded extends ProfileImageState {
  final String profileImage;
  ProfileLoaded({required this.profileImage});
}

class ProfileImageChanged extends ProfileImageState {
  final String profileImage;
  ProfileImageChanged({required this.profileImage});
}

class ProfileError extends ProfileImageState {
  final String message;
  ProfileError({required this.message});
}
