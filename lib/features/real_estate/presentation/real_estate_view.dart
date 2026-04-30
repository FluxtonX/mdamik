import 'package:flutter/material.dart';
import 'widgets/property_card.dart';
import 'widgets/property_filter_sheet.dart';

class RealEstateView extends StatefulWidget {
  const RealEstateView({super.key});

  static const routeName = '/real-estate';

  @override
  State<RealEstateView> createState() => _RealEstateViewState();
}

class _RealEstateViewState extends State<RealEstateView> {
  int _selectedTabIndex = 0; // 0: Buy, 1: Sell, 2: Rent
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Apartment', 'Villa', 'Land', 'Office'];

  final List<Map<String, dynamic>> _properties = [
    {
      'image': 'assets/images/property_villa.png',
      'price': '\$285,000',
      'rating': 4.8,
      'title': 'Modern Villa',
      'location': 'Downtown',
    },
    {
      'image': 'assets/images/property_apartment.png',
      'price': '\$125,000',
      'rating': 4.6,
      'title': 'Luxury Apartment',
      'location': 'City Center',
    },
    {
      'image': 'assets/images/property_family_house.png',
      'price': '\$195,000',
      'rating': 4.9,
      'title': 'Family House',
      'location': 'Suburbs',
    },
    {
      'image': 'assets/images/project_home_build.png', // Reusing an existing image
      'price': '\$75,000',
      'rating': 4.3,
      'title': 'Studio Apt',
      'location': 'Midtown',
    },
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
        title: const Text('Real Estate', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => _showFilterSheet(context),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: const Icon(Icons.tune, color: Color(0xFFF28B22), size: 18),
            ),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Segmented Tabs
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabItem(0, 'Buy'),
                  _buildTabItem(1, 'Sell'),
                  _buildTabItem(2, 'Rent'),
                ],
              ),
            ),
          ),

          // Category Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (val) => setState(() => _selectedCategory = category),
                    backgroundColor: Colors.white,
                    selectedColor: const Color(0xFFF28B22),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                    ),
                    checkmarkColor: Colors.white,
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 20),

          // Property List
          Expanded(
            child: _properties.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _properties.length,
                    itemBuilder: (context, index) {
                      final p = _properties[index];
                      return PropertyCard(
                        image: p['image'],
                        price: p['price'],
                        rating: p['rating'],
                        title: p['title'],
                        location: p['location'],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF28B22) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No, real estate as for now',
            style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PropertyFilterBottomSheet(),
    );
  }
}
