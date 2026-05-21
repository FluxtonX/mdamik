import '../../../core/network/api_client.dart';
import 'user_profile_model.dart';

class UserProfileService {
  final ApiClient _apiClient;

  UserProfileService({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient();

  Future<UserProfile?> getProfile() async {
    final response = await _apiClient.get('/user/profile');
    if (response.success && response.data != null) {
      return UserProfile.fromJson(response.data);
    }
    return null;
  }

  Future<UserProfile?> updateProfile({
    String? fullName,
    String? phoneNumber,
    String? location,
    String? profileRole,
  }) async {
    final body = {
      if (fullName != null) 'fullName': fullName,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (location != null) 'location': location,
      if (profileRole != null) 'profileRole': profileRole,
    };

    final response = await _apiClient.put('/user/profile', body: body);
    if (response.success && response.data != null) {
      return UserProfile.fromJson(response.data);
    }
    return null;
  }
}
