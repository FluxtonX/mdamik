import '../../../core/mvvm/base_view_model.dart';
import '../../profile/data/user_profile_model.dart';
import '../../profile/data/user_profile_service.dart';

class HomeViewModel extends BaseViewModel {
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
      // Handle error silently or log it
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
