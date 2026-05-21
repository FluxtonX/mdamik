import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'api_config.dart';

class ApiResponse {
  final bool success;
  final String message;
  final dynamic data;
  final dynamic errors;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.errors,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'],
      errors: json['errors'],
    );
  }

  factory ApiResponse.error(String message, {dynamic errors}) {
    return ApiResponse(
      success: false,
      message: message,
      errors: errors,
    );
  }
}

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<Map<String, String>> _getHeaders() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Grab the current logged in user's ID
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // The current backend mock auth middleware expects the firebaseUid as the token.
      final uid = currentUser.uid;
      headers['Authorization'] = 'Bearer $uid';
    }

    return headers;
  }

  ApiResponse _handleResponse(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);
      if (decoded is Map<String, dynamic>) {
        return ApiResponse.fromJson(decoded);
      }
      return ApiResponse.error('Invalid response format');
    } catch (e) {
      return ApiResponse.error('Failed to parse response: ${response.statusCode}');
    }
  }

  Future<ApiResponse> get(String path) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$path');
      final headers = await _getHeaders();
      final response = await _client.get(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> post(String path, {dynamic body}) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$path');
      final headers = await _getHeaders();
      final response = await _client.post(
        url,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> put(String path, {dynamic body}) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$path');
      final headers = await _getHeaders();
      final response = await _client.put(
        url,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> patch(String path, {dynamic body}) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$path');
      final headers = await _getHeaders();
      final response = await _client.patch(
        url,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  Future<ApiResponse> delete(String path) async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}$path');
      final headers = await _getHeaders();
      final response = await _client.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
