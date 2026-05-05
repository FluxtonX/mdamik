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
        title: const Text('Profile Information',
            style: TextStyle(
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
                        child: const Center(
                          child: Text('JD',
                              style: TextStyle(
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
                  Text('Tap to change photo',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Full Name
            _buildInputField('Full Name', 'John Doe', showEditIcon: true),
            const SizedBox(height: 24),

            // Email
            _buildInputField('Email', 'john.doe@example.com'),
            const SizedBox(height: 24),

            // Phone Number
            _buildInputField('Phone Number', '+1 234 567 8900'),
            const SizedBox(height: 24),

            // Location
            _buildInputField('Location', 'New York, USA'),
            const SizedBox(height: 24),

            // Role
            const Text('Role',
                style: TextStyle(
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
                            child: Text(_selectedRole,
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
                      children: _roles.asMap().entries.map((entry) {
                        final index = entry.key;
                        final role = entry.value;
                        final isSelected = _selectedRole == role;
                        return InkWell(
                          onTap: () => setState(() {
                            _selectedRole = role;
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
                                  : index == _roles.length - 1
                                      ? const BorderRadius.vertical(
                                          bottom: Radius.circular(16))
                                      : null,
                            ),
                            child: Text(
                              role,
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28B22),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Save Changes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String value,
      {bool showEditIcon = false}) {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(value,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))),
              if (showEditIcon)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE6D3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Color(0xFFF28B22), size: 16),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
