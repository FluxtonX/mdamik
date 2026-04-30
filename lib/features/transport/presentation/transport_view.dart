import 'package:flutter/material.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  static const routeName = '/transport';

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  int _currentStep = 1;

  // Step 1 Data
  String? _selectedService;
  final List<Map<String, dynamic>> _services = [
    {
      'title': 'Material Transport',
      'desc': 'Cement, steel, sand, bricks',
      'icon': Icons.local_shipping_outlined
    },
    {
      'title': 'Equipment Hauling',
      'desc': 'Excavators, generators, cranes',
      'icon': Icons.construction_outlined
    },
    {
      'title': 'Worker Transport',
      'desc': 'Daily pickup and drop',
      'icon': Icons.people_outline
    },
    {
      'title': 'Waste Removal',
      'desc': 'Debris and demolition waste',
      'icon': Icons.delete_outline
    },
  ];

  // Step 2 Data
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  String? _recommendedVehicle;

  // Step 3 Data
  String? _selectedVehicle;
  final List<Map<String, dynamic>> _vehicles = [
    {'title': 'Mini Loader / Suzuki', 'capacity': 'Up to 1 ton', 'price': '\$25'},
    {'title': 'Standard Pickup Truck', 'capacity': 'Up to 2 tons', 'price': '\$40'},
    {'title': 'Medium Truck', 'capacity': 'Up to 5 tons', 'price': '\$85'},
    {'title': 'Heavy Truck', 'capacity': 'Up to 20 tons', 'price': '\$150'},
    {'title': 'Flatbed Trailer', 'capacity': 'Up to 30+ tons', 'price': '\$220'},
  ];

  void _updateRecommendation(String weight) {
    final w = double.tryParse(weight) ?? 0;
    setState(() {
      if (w == 0) {
        _recommendedVehicle = null;
      } else if (w <= 1) {
        _recommendedVehicle = 'Mini Loader / Suzuki';
      } else if (w <= 2) {
        _recommendedVehicle = 'Standard Pickup Truck';
      } else if (w <= 5) {
        _recommendedVehicle = 'Medium Truck';
      } else if (w <= 20) {
        _recommendedVehicle = 'Heavy Truck';
      } else {
        _recommendedVehicle = 'Flatbed Trailer';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (_currentStep > 1) {
              setState(() => _currentStep--);
            } else {
              Navigator.pop(context);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(
          _currentStep == 1 ? 'Transport' : (_currentStep == 2 ? 'Load Details' : 'Select Vehicle'),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentStep == 1) _buildStep1(),
            if (_currentStep == 2) _buildStep2(),
            if (_currentStep == 3) _buildStep3(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAction(),
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What do you need to transport?',
          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.9,
          ),
          itemCount: _services.length,
          itemBuilder: (context, index) {
            final service = _services[index];
            final isSelected = _selectedService == service['title'];
            return InkWell(
              onTap: () => setState(() => _selectedService = service['title']),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCE6D3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(service['icon'], color: const Color(0xFFF28B22), size: 24),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      service['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service['desc'],
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 9, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1E4).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Selected', style: TextStyle(color: Color(0xFFE57E2E), fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('$_selectedService', style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildInputField('Load Weight (tons)', _weightController, hint: 'Enter weight in tons', onChanged: _updateRecommendation),
        const SizedBox(height: 16),
        _buildInputField('Pickup Location', _pickupController, hint: 'Enter pickup address', icon: Icons.location_on_outlined),
        const SizedBox(height: 16),
        _buildInputField('Delivery Location', _deliveryController, hint: 'Enter delivery address', icon: Icons.navigation_outlined),
        if (_recommendedVehicle != null) ...[
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1E4).withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recommended Vehicle', style: TextStyle(color: Color(0xFFE57E2E), fontSize: 11, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(_recommendedVehicle!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Load: ${_weightController.text} tons',
          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        ..._vehicles.map((v) {
          final isSelected = _selectedVehicle == v['title'];
          final isRecommended = _recommendedVehicle == v['title'];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedVehicle = v['title']),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                  boxShadow: isSelected ? [BoxShadow(color: const Color(0xFFF28B22).withOpacity(0.1), blurRadius: 10)] : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(v['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(v['capacity'], style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Text(v['price'], style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {String? hint, IconData? icon, Function(String)? onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: const Color(0xFFF28B22), size: 18),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.black12, fontSize: 13),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomAction() {
    String label = '';
    bool isEnabled = true;

    if (_currentStep == 1) {
      label = 'Select Vehicle'; // Although screenshot says "Select Vehicle" here too
      isEnabled = _selectedService != null;
    } else if (_currentStep == 2) {
      label = 'Select Vehicle';
      isEnabled = _weightController.text.isNotEmpty && _pickupController.text.isNotEmpty && _deliveryController.text.isNotEmpty;
    } else {
      label = 'Book Transport';
      isEnabled = _selectedVehicle != null;
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 10),
      child: ElevatedButton(
        onPressed: isEnabled ? () {
          if (_currentStep < 3) {
            setState(() => _currentStep++);
            if (_currentStep == 3 && _selectedVehicle == null) {
              _selectedVehicle = _recommendedVehicle;
            }
          } else {
            // Booking logic
          }
        } : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF28B22),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFFFCE6D3),
          disabledForegroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0,
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
