import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyFilterBottomSheet extends StatefulWidget {
  const PropertyFilterBottomSheet({super.key});

  @override
  State<PropertyFilterBottomSheet> createState() => _PropertyFilterBottomSheetState();
}

class _PropertyFilterBottomSheetState extends State<PropertyFilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(50000, 500000);
  final Set<String> _propertyTypes = {};
  String _bedrooms = '1';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (_propertyTypes.isEmpty) {
      _propertyTypes.addAll({l10n.projectCustomHome, l10n.projectApartment});
    }
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
                  Text(l10n.filters, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(l10n.customizePropertySearch, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
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
          Text(l10n.priceRange, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
              Text.rich(
                TextSpan(children: [
                  const TextSpan(text: '\$'),
                  TextSpan(text: (_priceRange.start / 1000).round().toString()),
                  const TextSpan(text: 'K'),
                ]),
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black26),
              ),
              Text.rich(
                TextSpan(children: [
                  const TextSpan(text: '\$'),
                  TextSpan(text: (_priceRange.end / 1000).round().toString()),
                  const TextSpan(text: 'K'),
                ]),
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black26),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Property Type
          Text(l10n.propertyType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              _FilterCheckbox(
                label: l10n.projectCustomHome,
                isSelected: _propertyTypes.contains(l10n.projectCustomHome),
                onChanged: (val) => _toggleType(l10n.projectCustomHome, val),
              ),
              _FilterCheckbox(
                label: l10n.projectApartment,
                isSelected: _propertyTypes.contains(l10n.projectApartment),
                onChanged: (val) => _toggleType(l10n.projectApartment, val),
              ),
              _FilterCheckbox(
                label: l10n.propertyVilla,
                isSelected: _propertyTypes.contains(l10n.propertyVilla),
                onChanged: (val) => _toggleType(l10n.propertyVilla, val),
              ),
              _FilterCheckbox(
                label: l10n.propertyApartment,
                isSelected: _propertyTypes.contains(l10n.propertyApartment),
                onChanged: (val) => _toggleType(l10n.propertyApartment, val),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Bedrooms
          Text(l10n.bedroomsLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
            child: Text(l10n.applyFilters, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
