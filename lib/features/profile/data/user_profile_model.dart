class UserUi {
  final String initials;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String role;
  final String memberSince;
  final int verificationCompleted;
  final int verificationTotal;
  final String verificationLabel;
  final double verificationProgress;

  UserUi({
    required this.initials,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.role,
    required this.memberSince,
    required this.verificationCompleted,
    required this.verificationTotal,
    required this.verificationLabel,
    required this.verificationProgress,
  });

  factory UserUi.fromJson(Map<String, dynamic> json) {
    return UserUi(
      initials: json['initials'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      role: json['role'] ?? '',
      memberSince: json['memberSince'] ?? '',
      verificationCompleted: json['verificationCompleted'] ?? 0,
      verificationTotal: json['verificationTotal'] ?? 6,
      verificationLabel: json['verificationLabel'] ?? '',
      verificationProgress: (json['verificationProgress'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String firebaseUid;
  final String profileRole;
  final String location;
  final UserUi ui;

  UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.firebaseUid,
    required this.profileRole,
    required this.location,
    required this.ui,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      firebaseUid: json['firebaseUid'] ?? '',
      profileRole: json['profileRole'] ?? '',
      location: json['location'] ?? '',
      ui: UserUi.fromJson(json['ui'] ?? {}),
    );
  }
}
