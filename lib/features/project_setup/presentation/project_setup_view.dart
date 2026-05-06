import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widgets/setup_progress_bar.dart';

class ProjectSetupView extends StatefulWidget {
  const ProjectSetupView({super.key});

  static const routeName = '/project-setup';

  @override
  State<ProjectSetupView> createState() => _ProjectSetupViewState();
}

class _ProjectSetupViewState extends State<ProjectSetupView> {
  int _currentStep = 1;
  String? _selectedType;
  final Set<String> _selectedServices = {};
  int _area = 100;
  String _selectedMaterial = 'Concrete';
  bool _isMaterialDropdownOpen = false;

  final List<String> _materials = ['Concrete', 'Sand', 'Backfill', 'Mortar'];

  final List<Map<String, dynamic>> _projectTypes = [
    {'icon': Icons.home_outlined, 'label': 'House'},
    {'icon': Icons.business_outlined, 'label': 'Apartment'},
    {'icon': Icons.apartment_outlined, 'label': 'Building'},
    {'icon': Icons.factory_outlined, 'label': 'Factory'},
    {'icon': Icons.storefront_outlined, 'label': 'Shop'},
    {'icon': Icons.edit_road_outlined, 'label': 'Roads'},
    {'icon': Icons.park_outlined, 'label': 'Gardens'},
    {'icon': Icons.warehouse_outlined, 'label': 'Warehouse'},
  ];

  final List<Map<String, dynamic>> _services = [
    {'icon': Icons.engineering_outlined, 'label': 'Engineering', 'desc': 'Design & Planning'},
    {'icon': Icons.layers_outlined, 'label': 'Materials', 'desc': 'Supply & Delivery'},
    {'icon': Icons.engineering_outlined, 'label': 'Labor', 'desc': 'Skilled Workers'},
    {'icon': Icons.format_paint_outlined, 'label': 'Finishing', 'desc': 'Paint & Tiles'},
  ];

  void _onNext() {
    if (_currentStep == 4) {
      Navigator.of(context).pushNamed('/payment');
      return;
    }
    setState(() => _currentStep++);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.projectSetup, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: l10n.step),
                  const TextSpan(text: ' '),
                  TextSpan(text: _currentStep.toString()),
                  const TextSpan(text: ' / 4'),
                ],
              ),
              style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: SetupProgressBar(currentStep: _currentStep, totalSteps: 4),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildStepContent(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 12),
            child: _currentStep == 4
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF28B22),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            shadowColor: const Color(0xFFF28B22).withOpacity(0.4),
                          ),
                          child: Text(l10n.hireNow, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFF28B22)),
                            foregroundColor: const Color(0xFFF28B22),
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(l10n.saveProject, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: _isNextEnabled() ? _onNext : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28B22),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      shadowColor: const Color(0xFFF28B22).withOpacity(0.4),
                    ),
                    child: Text(l10n.continueText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
          ),
        ],
      ),
    );
  }

  bool _isNextEnabled() {
    if (_currentStep == 1) return _selectedType != null;
    if (_currentStep == 2) return _selectedServices.isNotEmpty;
    return true;
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return _buildStep1();
      case 2:
        return _buildStep2();
      case 3:
        return _buildStep3();
      case 4:
        return _buildStep4();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.selectProjectType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(AppLocalizations.of(context)!.chooseProjectTypeDesc, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: _projectTypes.length,
          itemBuilder: (context, index) {
            final type = _projectTypes[index];
            final isSelected = _selectedType == type['label'];
            return _SelectableCard(
              icon: type['icon'],
              label: type['label'],
              isSelected: isSelected,
              onTap: () => setState(() => _selectedType = type['label']),
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
        Text(AppLocalizations.of(context)!.selectServicesTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(AppLocalizations.of(context)!.chooseServicesNeed, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
        const SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _services.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final service = _services[index];
            final isSelected = _selectedServices.contains(service['label']);
            return _ServiceSelectionItem(
              icon: service['icon'],
              label: service['label'],
              desc: service['desc'],
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedServices.remove(service['label']);
                  } else {
                    _selectedServices.add(service['label']);
                  }
                });
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.inputQuantity, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(AppLocalizations.of(context)!.enterAreaSelectMaterial, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
        const SizedBox(height: 24),
        // Area Selector
        Text(AppLocalizations.of(context)!.areaSqm, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black26)),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => setState(() => _area = _area > 0 ? _area - 1 : 0),
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(backgroundColor: const Color(0xFFF1F1F4), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
              Column(
                children: [
                  Text(_area.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFFF28B22))),
                  Text(AppLocalizations.of(context)!.metersSq, style: const TextStyle(fontSize: 12, color: Color(0xFFFCE6D3), fontWeight: FontWeight.w600)),
                ],
              ),
              IconButton(
                onPressed: () => setState(() => _area++),
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(backgroundColor: const Color(0xFFF28B22), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Material Type Dropdown
        Text(AppLocalizations.of(context)!.materialType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black26)),
        const SizedBox(height: 12),
        Column(
          children: [
            InkWell(
              onTap: () => setState(() => _isMaterialDropdownOpen = !_isMaterialDropdownOpen),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedMaterial, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Icon(
                      _isMaterialDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: const Color(0xFFF28B22),
                    ),
                  ],
                ),
              ),
            ),
            if (_isMaterialDropdownOpen)
              Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                ),
                child: Column(
                  children: _materials.map((m) {
                    final isSelected = _selectedMaterial == m;
                    return InkWell(
                      onTap: () => setState(() {
                        _selectedMaterial = m;
                        _isMaterialDropdownOpen = false;
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFCE6D3).withOpacity(0.5) : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          m,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? const Color(0xFFF28B22) : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.costEstimationTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        Text(AppLocalizations.of(context)!.detailedBreakdownProject, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: AppLocalizations.of(context)!.projectTypeShop),
                        const TextSpan(text: ' • '),
                        TextSpan(text: _area.toString()),
                        TextSpan(text: AppLocalizations.of(context)!.sqUnit),
                      ],
                    ),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE6D3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(_selectedMaterial, style: const TextStyle(color: Color(0xFFF28B22), fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: Color(0xFFF1F1F4)),
              ),
              _CostItem(label: AppLocalizations.of(context)!.materials, value: AppLocalizations.of(context)!.cost12500),
              const SizedBox(height: 16),
              _CostItem(label: AppLocalizations.of(context)!.labor, value: AppLocalizations.of(context)!.cost8200),
              const SizedBox(height: 16),
              _CostItem(label: AppLocalizations.of(context)!.engineeringTitle, value: AppLocalizations.of(context)!.cost4800),
              const SizedBox(height: 16),
              _CostItem(label: AppLocalizations.of(context)!.finishing, value: AppLocalizations.of(context)!.cost3500),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: Color(0xFFF1F1F4)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.totalLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(AppLocalizations.of(context)!.cost29000, style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.w800, fontSize: 20)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CostItem extends StatelessWidget {
  const _CostItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}


class _SelectableCard extends StatelessWidget {
  const _SelectableCard({required this.icon, required this.label, required this.isSelected, required this.onTap});

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFFCE6D3) : const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceSelectionItem extends StatelessWidget {
  const _ServiceSelectionItem({
    required this.icon,
    required this.label,
    required this.desc,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String desc;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(desc, style: const TextStyle(color: Colors.black26, fontSize: 11)),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
                  width: 1.5,
                ),
                color: isSelected ? const Color(0xFFF28B22) : Colors.transparent,
              ),
              child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 12) : null,
            ),
          ],
        ),
      ),
    );
  }
}
