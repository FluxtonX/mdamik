import '../../../core/mvvm/base_view_model.dart';
import '../data/user_profile_model.dart';
import '../data/user_profile_service.dart';

class ProfileViewModel extends BaseViewModel {
  final UserProfileService _profileService = UserProfileService();
  UserProfile? _profile;
  bool _isLoading = false;

  UserProfile? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> fetchProfile() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _profileService.getProfile();
      if (data != null) {
        _profile = data;
      }
    } catch (e) {
      // Log or handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> saveProfile({
    required String fullName,
    required String phoneNumber,
    required String location,
    required String profileRole,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final updated = await _profileService.updateProfile(
        fullName: fullName,
        phoneNumber: phoneNumber,
        location: location,
        profileRole: profileRole,
      );
      if (updated != null) {
        _profile = updated;
        _isLoading = false;
        notifyListeners();
        return null; // Success
      } else {
        _isLoading = false;
        notifyListeners();
        return 'Failed to save changes on backend';
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }
}
