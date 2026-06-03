import 'package:flutter/material.dart';

class AdminRealEstateManageView extends StatefulWidget {
  const AdminRealEstateManageView({super.key});

  static const routeName = '/admin/manage/real_estate';

  @override
  State<AdminRealEstateManageView> createState() => _AdminRealEstateManageViewState();
}

class _AdminRealEstateManageViewState extends State<AdminRealEstateManageView> {
  int _selectedType = 0; // 0: Buy, 1: Sell, 2: Rent
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Apartment', 'Villa', 'Land', 'Commercial'];

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      body: Column(
        children: [
          // White Header
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              top: top + 16,
              left: 20,
              right: 20,
              bottom: 16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F4F0),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF1A1A1A),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Real Estate',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Type Selector (Buy, Sell, Rent)
                Row(
                  children: [
                    Expanded(child: _buildTypeButton(0, 'Buy')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTypeButton(1, 'Sell')),
                    const SizedBox(width: 8),
                    Expanded(child: _buildTypeButton(2, 'Rent')),
                  ],
                ),
                const SizedBox(height: 16),

                // Filters Row
                SizedBox(
                  height: 36,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final isSelected = _selectedFilter == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedFilter = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFE8711A) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected ? const Color(0xFFE8711A) : const Color(0xFFD9D9D9),
                            ),
                          ),
                          child: Text(
                            _filters[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF8A8A8A),
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Content area (empty for now based on screenshot)
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(int index, String title) {
    final isSelected = _selectedType == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8711A) : const Color(0xFFF5F4F0),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
