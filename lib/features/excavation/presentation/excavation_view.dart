import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/excavation_step_header.dart';

class ExcavationView extends StatefulWidget {
  const ExcavationView({super.key});

  static const routeName = '/excavation';

  @override
  State<ExcavationView> createState() => _ExcavationViewState();
}

class _ExcavationViewState extends State<ExcavationView> {
  int _currentStep = 1;
  
  // Step 1 Data
  final TextEditingController _lengthController = TextEditingController(text: '10');
  final TextEditingController _widthController = TextEditingController(text: '8');
  final TextEditingController _depthController = TextEditingController(text: '3');
  double _volume = 240.0;

  // Step 2 Data
  String? _selectedType;
  final List<Map<String, String>> _excavationTypes = [
    {'title': 'Foundation Excavation', 'desc': 'For building footings'},
    {'title': 'Basement Excavation', 'desc': 'Deep structural dig'},
    {'title': 'Trenching', 'desc': 'For pipes and cables'},
    {'title': 'Road Excavation', 'desc': 'Sub-base preparation'},
    {'title': 'Land Clearing', 'desc': 'Surface-level clearing'},
  ];

  // Step 3 Data
  String? _selectedSoil;
  final List<Map<String, dynamic>> _soilTypes = [
    {'title': 'Soft Soil', 'desc': 'Low cost • Fastest', 'rate': 10},
    {'title': 'Mixed Soil', 'desc': 'Medium cost • Moderate', 'rate': 15},
    {'title': 'Rocky Soil', 'desc': 'High cost • Slowest', 'rate': 25},
  ];

  void _calculateVolume() {
    final l = double.tryParse(_lengthController.text) ?? 0;
    final w = double.tryParse(_widthController.text) ?? 0;
    final d = double.tryParse(_depthController.text) ?? 0;
    setState(() {
      _volume = l * w * d;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
              ? (l10n?.excavationTitle ?? 'Excavation')
              : (_currentStep == 2
                  ? (l10n?.excavationTypeTitle ?? 'Excavation Type')
                  : (l10n?.soilTypeTitle ?? 'Soil Type')),
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (_currentStep == 1) _buildStep1(l10n),
            if (_currentStep == 2) _buildStep2(l10n),
            if (_currentStep == 3) _buildStep3(l10n),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAction(l10n),
    );
  }

  Widget _buildStep1(AppLocalizations? l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExcavationStepHeader(
          step: 1,
          title: l10n?.step1Title ?? 'Measurement Input',
          subtitle: l10n?.step1Subtitle ?? 'Enter site dimensions to calculate volume',
        ),
        const SizedBox(height: 24),
        _buildInputField(l10n?.lengthMeters ?? 'Length (meters)', _lengthController),
        const SizedBox(height: 16),
        _buildInputField(l10n?.widthMeters ?? 'Width (meters)', _widthController),
        const SizedBox(height: 16),
        _buildInputField(l10n?.depthMeters ?? 'Depth (meters)', _depthController),
        const SizedBox(height: 24),
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
              Row(
                children: [
                  const Icon(Icons.calculate_outlined, color: Color(0xFFE57E2E), size: 18),
                  const SizedBox(width: 8),
                  Text(l10n?.calculatedVolume ?? 'Calculated Volume',
                      style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '${_volume.toStringAsFixed(2)} m\u00b3',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFFF28B22)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStep2(AppLocalizations? l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExcavationStepHeader(
          step: 2,
          title: l10n?.selectExcavationType ?? 'Select Excavation Type',
          subtitle: 'Volume: ${_volume.toStringAsFixed(2)} m\u00b3',
        ),
        const SizedBox(height: 24),
        ..._excavationTypes.map((type) {
          final isSelected = _selectedType == type['title'];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedType = type['title']),
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
                          Text(type['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 4),
                          Text(type['desc']!, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    if (isSelected) const Icon(Icons.check_circle, color: Color(0xFFF28B22), size: 20),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildStep3(AppLocalizations? l10n) {
    final selectedSoilData = _soilTypes.firstWhere((s) => s['title'] == _selectedSoil, orElse: () => _soilTypes[0]);
    final totalEstimate = _volume * selectedSoilData['rate'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExcavationStepHeader(
          step: 3,
          title: l10n?.selectSoilType ?? 'Select Soil Type',
          subtitle: '$_selectedType \u2022 ${_volume.toStringAsFixed(2)} m\u00b3',
        ),
        const SizedBox(height: 24),
        ..._soilTypes.map((soil) {
          final isSelected = _selectedSoil == soil['title'];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () => setState(() => _selectedSoil = soil['title']),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(soil['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 4),
                          Text(soil['desc']!, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Icon(
                      isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                      color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        if (_selectedSoil != null) ...[
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F1F4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cost Breakdown', style: TextStyle(color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 16),
                _buildBreakdownRow(l10n?.volume ?? 'Volume', '${_volume.toStringAsFixed(2)} m\u00b3'),
                const SizedBox(height: 12),
                _buildBreakdownRow(l10n?.ratePerM3 ?? 'Rate per m\u00b3', '\$${selectedSoilData['rate']}'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Color(0xFFF1F1F4)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n?.totalEstimate ?? 'Total Estimate', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFFF28B22))),
                    Text('\$${totalEstimate.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Color(0xFFF28B22))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (_) => _calculateVolume(),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  Widget _buildBreakdownRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 13, fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _buildBottomAction(AppLocalizations? l10n) {
    String label = '';
    bool isEnabled = true;
    
    if (_currentStep == 1) {
      label = l10n?.continueToExcavationType ?? 'Continue to Excavation Type';
    } else if (_currentStep == 2) {
      label = l10n?.continueToSoilType ?? 'Continue to Soil Type';
      isEnabled = _selectedType != null;
    } else {
      label = l10n?.viewServiceProviders ?? 'View Service Providers';
      isEnabled = _selectedSoil != null;
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 10),
      child: ElevatedButton(
        onPressed: isEnabled ? () {
          if (_currentStep < 3) {
            setState(() => _currentStep++);
          } else {
            // Navigate to service providers
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
