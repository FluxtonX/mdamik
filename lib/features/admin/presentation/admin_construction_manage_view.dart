import 'package:flutter/material.dart';

class AdminConstructionManageView extends StatefulWidget {
  const AdminConstructionManageView({super.key});

  static const routeName = '/admin/manage/construction';

  @override
  State<AdminConstructionManageView> createState() => _AdminConstructionManageViewState();
}

class _AdminConstructionManageViewState extends State<AdminConstructionManageView> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Active', 'Pending', 'Rejected'];

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
                      'Construction',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Search Bar
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Color(0xFF8A8A8A), size: 22),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search project types...',
                            hintStyle: TextStyle(
                              color: Color(0xFFB0B0B0),
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
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

          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
              children: const [
                _ProjectTypeCard(title: 'House', projectsCount: '45 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Apartment', projectsCount: '28 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Building', projectsCount: '12 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Factory', projectsCount: '8 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Shop', projectsCount: '15 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Roads', projectsCount: '6 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Gardens', projectsCount: '10 active projects'),
                SizedBox(height: 12),
                _ProjectTypeCard(title: 'Warehouse', projectsCount: '4 active projects'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/admin/manage/construction/add');
        },
        backgroundColor: const Color(0xFFE8711A),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}

class _ProjectTypeCard extends StatelessWidget {
  const _ProjectTypeCard({
    required this.title,
    required this.projectsCount,
  });

  final String title;
  final String projectsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                projectsCount,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8A8A8A),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Color(0xFFB0B0B0),
          ),
        ],
      ),
    );
  }
}
