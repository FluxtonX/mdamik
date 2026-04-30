import 'package:flutter/material.dart';
import 'widgets/labor_card.dart';

class LaborHiringView extends StatefulWidget {
  const LaborHiringView({super.key});

  static const routeName = '/labor';

  @override
  State<LaborHiringView> createState() => _LaborHiringViewState();
}

class _LaborHiringViewState extends State<LaborHiringView> {
  String _selectedSkill = 'All';

  final List<String> _skills = ['All', 'Mason', 'Electrician', 'Plumber', 'Painter', 'Carpenter'];

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
        title: const Text('Labor Hiring', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search by skill or name...',
                  hintStyle: TextStyle(color: Colors.black12, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.black12),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Filter by Skill
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Filter by Skill', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: _skills.map((skill) {
                final isSelected = _selectedSkill == skill;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: InkWell(
                    onTap: () => setState(() => _selectedSkill = skill),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFF28B22) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                      ),
                      child: Text(
                        skill,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Labor List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                LaborCard(
                  initials: 'AH',
                  name: 'Ahmed Hassan',
                  skill: 'Mason (Raj Mistri)',
                  rate: '\$45/day',
                  rating: 4.9,
                  reviews: 128,
                  distance: '1.2 km',
                  status: LaborStatus.availableNow,
                  experience: 8,
                  jobs: 156,
                ),
                LaborCard(
                  initials: 'MA',
                  name: 'Mohammed Ali',
                  skill: 'Electrician',
                  rate: '\$38/day',
                  rating: 4.8,
                  reviews: 95,
                  distance: '2.5 km',
                  status: LaborStatus.availableNow,
                  experience: 6,
                  jobs: 98,
                ),
                LaborCard(
                  initials: 'OK',
                  name: 'Omar Khaled',
                  skill: 'Plumber',
                  rate: '\$35/day',
                  rating: 4.7,
                  reviews: 67,
                  distance: '3.1 km',
                  status: LaborStatus.availableSoon,
                  experience: 5,
                  jobs: 72,
                ),
                LaborCard(
                  initials: 'YI',
                  name: 'Youssef Ibrahim',
                  skill: 'Painter',
                  rate: '\$28/day',
                  rating: 4.6,
                  reviews: 54,
                  distance: '4.8 km',
                  status: LaborStatus.busy,
                  experience: 4,
                  jobs: 58,
                ),
                LaborCard(
                  initials: 'KM',
                  name: 'Karim Mostafa',
                  skill: 'Carpenter',
                  rate: '\$42/day',
                  rating: 4.9,
                  reviews: 112,
                  distance: '0.8 km',
                  status: LaborStatus.availableNow,
                  experience: 10,
                  jobs: 145,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
