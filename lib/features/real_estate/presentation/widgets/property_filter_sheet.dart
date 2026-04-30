import 'package:flutter/material.dart';

class PropertyFilterBottomSheet extends StatefulWidget {
  const PropertyFilterBottomSheet({super.key});

  @override
  State<PropertyFilterBottomSheet> createState() => _PropertyFilterBottomSheetState();
}

class _PropertyFilterBottomSheetState extends State<PropertyFilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(50000, 500000);
  final Set<String> _propertyTypes = {'House', 'Apartment'};
  String _bedrooms = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Filters', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('Customize your property search', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
                ],
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, color: Colors.black26),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Price Range
          const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          RangeSlider(
            values: _priceRange,
            min: 10000,
            max: 1000000,
            divisions: 20,
            activeColor: const Color(0xFFF28B22),
            inactiveColor: const Color(0xFFF1F1F4),
            labels: RangeLabels(
              '\$${(_priceRange.start / 1000).round()}K',
              '\$${(_priceRange.end / 1000).round()}K',
            ),
            onChanged: (values) => setState(() => _priceRange = values),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${(_priceRange.start / 1000).round()}K', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black26)),
              Text('\$${(_priceRange.end / 1000).round()}K', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black26)),
            ],
          ),
          const SizedBox(height: 32),

          // Property Type
          const Text('Property Type', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _FilterCheckbox(
                label: 'House',
                isSelected: _propertyTypes.contains('House'),
                onChanged: (val) => _toggleType('House', val),
              ),
              _FilterCheckbox(
                label: 'Apartment',
                isSelected: _propertyTypes.contains('Apartment'),
                onChanged: (val) => _toggleType('Apartment', val),
              ),
              _FilterCheckbox(
                label: 'Villa',
                isSelected: _propertyTypes.contains('Villa'),
                onChanged: (val) => _toggleType('Villa', val),
              ),
              _FilterCheckbox(
                label: 'Studio',
                isSelected: _propertyTypes.contains('Studio'),
                onChanged: (val) => _toggleType('Studio', val),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Bedrooms
          const Text('Bedrooms', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['1', '2', '3', '4+'].map((b) {
              final isSelected = _bedrooms == b;
              return InkWell(
                onTap: () => setState(() => _bedrooms = b),
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFF28B22) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                  ),
                  child: Center(
                    child: Text(
                      b,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 40),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF28B22),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: const Text('Apply Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  void _toggleType(String type, bool? value) {
    setState(() {
      if (value == true) {
        _propertyTypes.add(type);
      } else {
        _propertyTypes.remove(type);
      }
    });
  }
}

class _FilterCheckbox extends StatelessWidget {
  const _FilterCheckbox({required this.label, required this.isSelected, required this.onChanged});

  final String label;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isSelected,
            onChanged: onChanged,
            activeColor: const Color(0xFFF28B22),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            side: const BorderSide(color: Color(0xFFF1F1F4), width: 1.5),
          ),
        ),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
      ],
    );
  }
}
