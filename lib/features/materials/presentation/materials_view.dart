import 'package:flutter/material.dart';
import 'widgets/material_card.dart';
import 'widgets/project_calculator.dart';

class MaterialsView extends StatefulWidget {
  const MaterialsView({super.key});

  static const routeName = '/materials';

  @override
  State<MaterialsView> createState() => _MaterialsViewState();
}

class _MaterialsViewState extends State<MaterialsView> {
  String _selectedCategory = 'Cement';

  final List<Map<String, dynamic>> _categories = [
    {'label': 'Cement', 'icon': Icons.layers_outlined},
    {'label': 'Steel', 'icon': Icons.architecture_outlined},
    {'label': 'Sand', 'icon': Icons.grain_outlined},
    {'label': 'Ceramic', 'icon': Icons.grid_view_outlined},
  ];

  final List<Map<String, dynamic>> _allMaterials = [
    {
      'image': 'assets/images/project_home_build.png',
      'title': 'Portland Cement 50kg',
      'price': '\$12.50',
      'unit': 'bag',
      'category': 'Cement',
    },
    {
      'image': 'assets/images/project_apartment.png',
      'title': 'Steel Rebar 12mm',
      'price': '\$8.75',
      'unit': 'rod',
      'category': 'Steel',
    },
    {
      'image': 'assets/images/property_family_house.png',
      'title': 'Ceramic Tiles 60×60',
      'price': '\$22.00',
      'unit': 'box',
      'category': 'Ceramic',
    },
    {
      'image': 'assets/images/property_villa.png',
      'title': 'Fine Sand 1m³',
      'price': '\$35.00',
      'unit': 'm³',
      'category': 'Sand',
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
        title: const Text('Materials', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: const Icon(Icons.shopping_cart_outlined, color: Color(0xFFF28B22), size: 18),
            ),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ProjectCalculator(),
                  const SizedBox(height: 24),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFF1F1F4)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search materials...',
                        hintStyle: TextStyle(color: Colors.black12, fontSize: 14),
                        prefixIcon: Icon(Icons.search, color: Colors.black12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Category Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((cat) {
                        final isSelected = _selectedCategory == cat['label'];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: InkWell(
                            onTap: () => setState(() => _selectedCategory = cat['label']),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFF28B22) : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    cat['icon'],
                                    color: isSelected ? Colors.white : Colors.black26,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    cat['label'],
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black26,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Product Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: _allMaterials.length,
                    itemBuilder: (context, index) {
                      final item = _allMaterials[index];
                      return MaterialCard(
                        image: item['image'],
                        title: item['title'],
                        price: item['price'],
                        unit: item['unit'],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
