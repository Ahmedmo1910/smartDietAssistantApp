import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/core/presentation/cubits/profile_image/profile_image_state.dart';

class ProfileCubit extends Cubit<ProfileImageState> {
  ProfileCubit() : super(ProfileInitial());

  String _profileImage = '';
  String get profileImage => _profileImage;

  Future<void> loadProfile() async {
    try {
      emit(ProfileLoading());
      final prefs = getIt<SharedPreferences>();
      _profileImage = prefs.getString('profileImage') ?? '';
      emit(ProfileLoaded(profileImage: _profileImage));
    } catch (e) {
      emit(ProfileError(message: "Failed to load profile image: $e"));
    }
  }

  Future<void> changeProfileImage() async {
    try {
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        emit(ProfileLoading());
        final prefs = getIt<SharedPreferences>();
        _profileImage = image.path;
        await prefs.setString('profileImage', _profileImage);
        emit(ProfileImageChanged(profileImage: _profileImage));
      }
    } catch (e) {
      emit(ProfileError(message: "Failed to change profile image: $e"));
    }
  }
}
