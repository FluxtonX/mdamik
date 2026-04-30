import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  static const routeName = '/transport';

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  int _currentStep = 1;

  // Step 1 Data
  String? _selectedServiceKey;

  // Step 2 Data
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();
  String? _recommendedVehicleKey;

  // Step 3 Data
  String? _selectedVehicleKey;

  void _updateRecommendation(String weight, AppLocalizations? l10n) {
    final w = double.tryParse(weight) ?? 0;
    setState(() {
      if (w == 0) {
        _recommendedVehicleKey = null;
      } else if (w <= 1) {
        _recommendedVehicleKey = 'Mini Loader';
      } else if (w <= 2) {
        _recommendedVehicleKey = 'Standard Pickup';
      } else if (w <= 5) {
        _recommendedVehicleKey = 'Medium Truck';
      } else if (w <= 20) {
        _recommendedVehicleKey = 'Heavy Truck';
      } else {
        _recommendedVehicleKey = 'Flatbed Trailer';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    final List<Map<String, dynamic>> services = [
      {
        'key': 'Material',
        'title': l10n?.materialTransport ?? 'Material Transport',
        'desc': l10n?.materialTransportDesc ?? 'Cement, steel, sand, bricks',
        'icon': Icons.local_shipping_outlined
      },
      {
        'key': 'Equipment',
        'title': l10n?.equipmentHauling ?? 'Equipment Hauling',
        'desc': l10n?.equipmentHaulingDesc ?? 'Excavators, generators, cranes',
        'icon': Icons.construction_outlined
      },
      {
        'key': 'Worker',
        'title': l10n?.workerTransport ?? 'Worker Transport',
        'desc': l10n?.workerTransportDesc ?? 'Daily pickup and drop',
        'icon': Icons.people_outline
      },
      {
        'key': 'Waste',
        'title': l10n?.wasteRemoval ?? 'Waste Removal',
        'desc': l10n?.wasteRemovalDesc ?? 'Debris and demolition waste',
        'icon': Icons.delete_outline
      },
    ];

    final Map<String, Map<String, dynamic>> vehiclesMap = {
      'Mini Loader': {'title': 'Mini Loader / Suzuki', 'capacity': l10n?.upToCapacity('1 ton') ?? 'Up to 1 ton', 'price': '\$25'},
      'Standard Pickup': {'title': 'Standard Pickup Truck', 'capacity': l10n?.upToCapacity('2 tons') ?? 'Up to 2 tons', 'price': '\$40'},
      'Medium Truck': {'title': 'Medium Truck', 'capacity': l10n?.upToCapacity('5 tons') ?? 'Up to 5 tons', 'price': '\$85'},
      'Heavy Truck': {'title': 'Heavy Truck', 'capacity': l10n?.upToCapacity('20 tons') ?? 'Up to 20 tons', 'price': '\$150'},
      'Flatbed Trailer': {'title': 'Flatbed Trailer', 'capacity': l10n?.upToCapacity('30+ tons') ?? 'Up to 30+ tons', 'price': '\$220'},
    };

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
          _currentStep == 1 
            ? (l10n?.transport ?? 'Transport') 
            : (_currentStep == 2 
                ? (l10n?.loadDetails ?? 'Load Details') 
                : (l10n?.selectVehicle ?? 'Select Vehicle')),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentStep == 1) _buildStep1(l10n, services),
            if (_currentStep == 2) _buildStep2(l10n),
            if (_currentStep == 3) _buildStep3(l10n, vehiclesMap),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAction(l10n),
    );
  }

  Widget _buildStep1(AppLocalizations? l10n, List<Map<String, dynamic>> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n?.whatNeedTransport ?? 'What do you need to transport?',
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
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            final isSelected = _selectedServiceKey == service['key'];
            return InkWell(
              onTap: () => setState(() => _selectedServiceKey = service['key']),
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

  Widget _buildStep2(AppLocalizations? l10n) {
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
              Text(l10n?.selected ?? 'Selected', style: const TextStyle(color: Color(0xFFE57E2E), fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text('$_selectedServiceKey', style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildInputField(
          l10n?.loadWeightTons ?? 'Load Weight (tons)', 
          _weightController, 
          hint: l10n?.enterWeightTons ?? 'Enter weight in tons', 
          onChanged: (val) => _updateRecommendation(val, l10n)
        ),
        const SizedBox(height: 16),
        _buildInputField(
          l10n?.pickupLocation ?? 'Pickup Location', 
          _pickupController, 
          hint: l10n?.enterPickupAddress ?? 'Enter pickup address', 
          icon: Icons.location_on_outlined
        ),
        const SizedBox(height: 16),
        _buildInputField(
          l10n?.deliveryLocation ?? 'Delivery Location', 
          _deliveryController, 
          hint: l10n?.enterDeliveryAddress ?? 'Enter delivery address', 
          icon: Icons.navigation_outlined
        ),
        if (_recommendedVehicleKey != null) ...[
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
                Text(l10n?.recommendedVehicle ?? 'Recommended Vehicle', style: const TextStyle(color: Color(0xFFE57E2E), fontSize: 11, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('$_recommendedVehicleKey', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildStep3(AppLocalizations? l10n, Map<String, Map<String, dynamic>> vehiclesMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n?.loadTons(_weightController.text) ?? 'Load: ${_weightController.text} tons',
          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        ...vehiclesMap.entries.map((entry) {
          final isSelected = _selectedVehicleKey == entry.key;
          final v = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedVehicleKey = entry.key),
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
        }),
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

  Widget _buildBottomAction(AppLocalizations? l10n) {
    String label = '';
    bool isEnabled = true;

    if (_currentStep == 1) {
      label = l10n?.selectVehicle ?? 'Select Vehicle';
      isEnabled = _selectedServiceKey != null;
    } else if (_currentStep == 2) {
      label = l10n?.selectVehicle ?? 'Select Vehicle';
      isEnabled = _weightController.text.isNotEmpty && _pickupController.text.isNotEmpty && _deliveryController.text.isNotEmpty;
    } else {
      label = l10n?.bookTransport ?? 'Book Transport';
      isEnabled = _selectedVehicleKey != null;
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 10),
      child: ElevatedButton(
        onPressed: isEnabled ? () {
          if (_currentStep < 3) {
            setState(() => _currentStep++);
            if (_currentStep == 3 && _selectedVehicleKey == null) {
              _selectedVehicleKey = _recommendedVehicleKey;
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
