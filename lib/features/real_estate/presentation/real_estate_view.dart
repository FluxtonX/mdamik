import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  String? _selectedCategoryKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    final Map<String, String> categoriesMap = {
      'All': l10n?.skillAll ?? 'All',
      'Apartment': l10n?.propertyApartment ?? 'Apartment',
      'Villa': l10n?.propertyVilla ?? 'Villa',
      'Land': l10n?.propertyLand ?? 'Land',
      'Office': l10n?.propertyOffice ?? 'Office',
    };

    _selectedCategoryKey ??= 'All';

    final List<Map<String, dynamic>> properties = [
      {
        'image': 'assets/images/property_villa.png',
        'price': '\$285,000',
        'rating': 4.8,
        'title': l10n?.propertyVilla ?? 'Modern Villa',
        'location': 'Downtown',
      },
      {
        'image': 'assets/images/property_apartment.png',
        'price': '\$125,000',
        'rating': 4.6,
        'title': l10n?.propertyApartment ?? 'Luxury Apartment',
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
        'image': 'assets/images/project_home_build.png',
        'price': '\$75,000',
        'rating': 4.3,
        'title': 'Studio Apt',
        'location': 'Midtown',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(l10n?.realEstate ?? 'Real Estate', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                  _buildTabItem(0, l10n?.buy ?? 'Buy'),
                  _buildTabItem(1, l10n?.sell ?? 'Sell'),
                  _buildTabItem(2, l10n?.rent ?? 'Rent'),
                ],
              ),
            ),
          ),

          // Category Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: categoriesMap.entries.map((entry) {
                final isSelected = _selectedCategoryKey == entry.key;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: FilterChip(
                    label: Text(entry.value),
                    selected: isSelected,
                    onSelected: (val) => setState(() => _selectedCategoryKey = entry.key),
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
            child: properties.isEmpty
                ? _buildEmptyState(l10n)
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: properties.length,
                    itemBuilder: (context, index) {
                      final p = properties[index];
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

  Widget _buildEmptyState(AppLocalizations? l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n?.noRealEstate ?? 'No real estate for now',
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
