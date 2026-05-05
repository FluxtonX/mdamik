import 'package:flutter/material.dart';

class LanguageRegionView extends StatefulWidget {
  const LanguageRegionView({super.key});

  static const routeName = '/profile/language-region';

  @override
  State<LanguageRegionView> createState() => _LanguageRegionViewState();
}

class _LanguageRegionViewState extends State<LanguageRegionView> {
  String _selectedLanguage = 'English';
  String _selectedCurrency = 'US Dollar (\$)';
  String _selectedMeasurement = 'Metric (m², km)';

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'sub': 'English'},
    {'name': 'Arabic', 'sub': 'العربية'},
  ];

  final List<Map<String, String>> _currencies = [
    {'name': 'US Dollar (\$)', 'sub': 'USD'},
    {'name': 'Pakistani Rupee (Rs)', 'sub': 'PKR'},
    {'name': 'UAE Dirham (د.إ)', 'sub': 'AED'},
    {'name': 'Saudi Riyal (ر.س)', 'sub': 'SAR'},
  ];

  final List<Map<String, String>> _measurements = [
    {'name': 'Metric (m², km)', 'sub': 'Meters, kilometers'},
    {'name': 'Imperial (sq ft, miles)', 'sub': 'Feet, miles'},
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
        title: const Text('Language & Region',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('LANGUAGE'),
            _buildSelectionList(_languages, _selectedLanguage, (val) {
              setState(() => _selectedLanguage = val);
            }),
            const SizedBox(height: 32),
            _buildSectionTitle('CURRENCY'),
            _buildSelectionList(_currencies, _selectedCurrency, (val) {
              setState(() => _selectedCurrency = val);
            }),
            const SizedBox(height: 32),
            _buildSectionTitle('MEASUREMENT SYSTEM'),
            _buildSelectionList(_measurements, _selectedMeasurement, (val) {
              setState(() => _selectedMeasurement = val);
            }),
            const SizedBox(height: 48),

            // Save Preferences Button
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
              child: const Text('Save Preferences',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title,
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
    );
  }

  Widget _buildSelectionList(List<Map<String, String>> items, String selectedValue,
      ValueChanged<String> onSelected) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = selectedValue == item['name'];
          return InkWell(
            onTap: () => onSelected(item['name']!),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(height: 4),
                            Text(item['sub']!,
                                style: TextStyle(
                                    color: isSelected
                                        ? const Color(0xFFF28B22).withOpacity(0.5)
                                        : Colors.black.withOpacity(0.3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check_circle,
                            color: Color(0xFFF28B22), size: 24),
                    ],
                  ),
                ),
                if (index < items.length - 1)
                  const Divider(height: 1, color: Color(0xFFF1F1F4)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
