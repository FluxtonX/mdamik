import 'package:flutter/material.dart';

class ProfileInformationView extends StatefulWidget {
  const ProfileInformationView({super.key});

  static const routeName = '/profile/information';

  @override
  State<ProfileInformationView> createState() => _ProfileInformationViewState();
}

class _ProfileInformationViewState extends State<ProfileInformationView> {
  String _selectedRole = 'Client / Owner';
  bool _isDropdownOpen = false;

  final List<String> _roles = [
    'Client / Owner',
    'Contractor',
    'Worker / Freelancer',
    'Engineer / Consultant',
    'Supplier',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: const Text('Profile Information', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF28B22),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('JD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28)),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF28B22),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Tap to change photo', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Full Name
            _buildInputField('Full Name', 'John Doe', showEditIcon: true),
            const SizedBox(height: 20),

            // Email
            _buildInputField('Email', 'john.doe@example.com'),
            const SizedBox(height: 20),

            // Phone Number
            _buildInputField('Phone Number', '+1 234 567 8900'),
            const SizedBox(height: 20),

            // Location
            _buildInputField('Location', 'New York, USA'),
            const SizedBox(height: 20),

            // Role
            const Text('Role', style: TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => setState(() => _isDropdownOpen = !_isDropdownOpen),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                ),
                child: Row(
                  children: [
                    Expanded(child: Text(_selectedRole, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Icon(
                      _isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),
            if (_isDropdownOpen) ...[
              Container(
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                ),
                child: Column(
                  children: _roles.map((role) {
                    final isSelected = _selectedRole == role;
                    return InkWell(
                      onTap: () => setState(() {
                        _selectedRole = role;
                        _isDropdownOpen = false;
                      }),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFF28B22) : Colors.transparent,
                          borderRadius: isSelected ? BorderRadius.circular(8) : null,
                        ),
                        child: Text(
                          role,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 40),

            // Save Changes Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28B22),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Save Changes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String value, {bool showEditIcon = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            children: [
              Expanded(child: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
              if (showEditIcon) Icon(Icons.edit_outlined, color: Colors.black.withOpacity(0.2), size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
