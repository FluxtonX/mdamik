import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/mvvm/view_model_builder.dart';
import 'profile_view_model.dart';

class ProfileInformationView extends StatefulWidget {
  const ProfileInformationView({super.key});

  static const routeName = '/profile/information';

  @override
  State<ProfileInformationView> createState() => _ProfileInformationViewState();
}

class _ProfileInformationViewState extends State<ProfileInformationView> {
  String _selectedRoleKey = 'roleClientOwner';
  bool _isDropdownOpen = false;
  bool _hasLoadedProfile = false;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();

  final List<String> _roleKeys = [
    'roleClientOwner',
    'roleContractor',
    'roleWorkerFreelancer',
    'roleEngineerConsultant',
    'roleSupplier',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>(
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (vm) => vm.fetchProfile(),
      builder: (context, vm, _) {
        final l10n = AppLocalizations.of(context);
        final profile = vm.profile;

        if (vm.isLoading && profile == null) {
          return const Scaffold(
            backgroundColor: Color(0xFFFBFBFB),
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFFF28B22)),
            ),
          );
        }

        // Initialize controllers once on load
        if (profile != null && !_hasLoadedProfile) {
          _fullNameController.text = profile.fullName;
          _emailController.text = profile.email;
          _phoneController.text = profile.phoneNumber;
          _locationController.text = profile.location;

          final roleMap = {
            'Client / Owner': 'roleClientOwner',
            'Contractor': 'roleContractor',
            'Worker / Freelancer': 'roleWorkerFreelancer',
            'Engineer / Consultant': 'roleEngineerConsultant',
            'Supplier': 'roleSupplier',
          };
          _selectedRoleKey = roleMap[profile.profileRole] ?? 'roleClientOwner';
          _hasLoadedProfile = true;
        }

        final roleLabels = <String, String>{
          'roleClientOwner': l10n?.roleClientOwner ?? 'Client / Owner',
          'roleContractor': l10n?.roleContractor ?? 'Contractor',
          'roleWorkerFreelancer': l10n?.roleWorkerFreelancer ?? 'Worker / Freelancer',
          'roleEngineerConsultant':
              l10n?.roleEngineerConsultant ?? 'Engineer / Consultant',
          'roleSupplier': l10n?.roleSupplier ?? 'Supplier',
        };
        final selectedRoleLabel =
            roleLabels[_selectedRoleKey] ?? (l10n?.roleClientOwner ?? 'Client / Owner');

        return Scaffold(
          backgroundColor: const Color(0xFFFBFBFB),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back,
                      color: Color(0xFFF28B22), size: 18),
                ),
              ),
            ),
            title: Text(l10n?.profileInformationTitle ?? 'Profile Information',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF28B22),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(profile?.ui.initials ?? 'JD',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36)),
                            ),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF28B22),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child:
                                  const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(l10n?.tapToChangePhoto ?? 'Tap to change photo',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                _buildInputField(
                  l10n?.labelFullName ?? 'Full Name',
                  _fullNameController,
                ),
                const SizedBox(height: 24),

                // Email (disabled/readonly usually as it's the Firebase login identity)
                _buildInputField(
                  l10n?.labelEmail ?? 'Email',
                  _emailController,
                  enabled: false,
                ),
                const SizedBox(height: 24),

                // Phone Number
                _buildInputField(
                  l10n?.labelPhoneNumber ?? 'Phone Number',
                  _phoneController,
                ),
                const SizedBox(height: 24),

                // Location
                _buildInputField(
                  l10n?.labelLocation ?? 'Location',
                  _locationController,
                ),
                const SizedBox(height: 24),

                // Role
                Text(l10n?.labelRole ?? 'Role',
                    style: const TextStyle(
                        color: Color(0xFFF28B22),
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                const SizedBox(height: 8),
                Column(
                  children: [
                    InkWell(
                      onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFF1F1F4)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(selectedRoleLabel,
                                    style: const TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w500))),
                            Icon(
                              _isDropdownOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black45,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_isDropdownOpen)
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFF1F1F4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: _roleKeys.asMap().entries.map((entry) {
                            final index = entry.key;
                            final roleKey = entry.value;
                            final isSelected = _selectedRoleKey == roleKey;
                            return InkWell(
                              onTap: () => setState(() {
                                _selectedRoleKey = roleKey;
                                _isDropdownOpen = false;
                              }),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFFE3F2FD)
                                      : Colors.transparent,
                                  borderRadius: index == 0
                                      ? const BorderRadius.vertical(
                                          top: Radius.circular(16))
                                      : index == _roleKeys.length - 1
                                          ? const BorderRadius.vertical(
                                              bottom: Radius.circular(16))
                                          : null,
                                ),
                                child: Text(
                                  roleLabels[roleKey] ?? roleKey,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight:
                                        isSelected ? FontWeight.bold : FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 48),

                // Save Changes Button
                ElevatedButton(
                  onPressed: vm.isLoading
                      ? null
                      : () async {
                          final roleMap = {
                            'roleClientOwner': 'Client / Owner',
                            'roleContractor': 'Contractor',
                            'roleWorkerFreelancer': 'Worker / Freelancer',
                            'roleEngineerConsultant': 'Engineer / Consultant',
                            'roleSupplier': 'Supplier',
                          };
                          final profileRole = roleMap[_selectedRoleKey] ?? 'Client / Owner';

                          final error = await vm.saveProfile(
                            fullName: _fullNameController.text.trim(),
                            phoneNumber: _phoneController.text.trim(),
                            location: _locationController.text.trim(),
                            profileRole: profileRole,
                          );

                          if (!context.mounted) return;
                          if (error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Profile updated successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).pop();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: vm.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                        )
                      : Text(l10n?.saveChanges ?? 'Save Changes',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller, {
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Color(0xFFF28B22),
                fontWeight: FontWeight.bold,
                fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: enabled ? Colors.white : const Color(0xFFF3F3F6),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  enabled: enabled,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: enabled ? Colors.black : Colors.black38,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
