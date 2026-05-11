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
  String _selectedMaterial = 'materialConcrete';
  bool _isMaterialDropdownOpen = false;

  final List<String> _materials = [
    'materialConcrete',
    'materialSand',
    'materialBackfill',
    'materialMortar'
  ];

  final List<Map<String, dynamic>> _projectTypes = [
    {'icon': Icons.home_outlined, 'key': 'typeHouses'},
    {'icon': Icons.business_outlined, 'key': 'typeApartment'},
    {'icon': Icons.apartment_outlined, 'key': 'typeBuilding'},
    {'icon': Icons.factory_outlined, 'key': 'typeFactory'},
    {'icon': Icons.storefront_outlined, 'key': 'typeShop'},
    {'icon': Icons.edit_road_outlined, 'key': 'typeRoads'},
    {'icon': Icons.park_outlined, 'key': 'typeGardens'},
    {'icon': Icons.warehouse_outlined, 'key': 'typeWarehouse'},
  ];

  final List<Map<String, dynamic>> _services = [
    {
      'icon': Icons.engineering_outlined,
      'key': 'engineeringTitle',
      'descKey': 'svcDescDesignPlanning'
    },
    {
      'icon': Icons.layers_outlined,
      'key': 'materials',
      'descKey': 'svcDescSupplyDelivery'
    },
    {
      'icon': Icons.engineering_outlined,
      'key': 'labor',
      'descKey': 'svcDescSkilledWorkers'
    },
    {
      'icon': Icons.format_paint_outlined,
      'key': 'finishing',
      'descKey': 'svcDescPaintTiles'
    },
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
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFFF28B22), size: 20),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.projectSetup,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: l10n.step),
                  const TextSpan(text: ' '),
                  TextSpan(text: _currentStep.toString()),
                  const TextSpan(text: ' / 4'),
                ],
              ),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 12),
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
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            shadowColor:
                                const Color(0xFFF28B22).withOpacity(0.4),
                          ),
                          child: Text(l10n.hireNow,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFF28B22)),
                            foregroundColor: const Color(0xFFF28B22),
                            minimumSize: const Size(double.infinity, 56),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          child: Text(l10n.saveProject,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
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
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      shadowColor: const Color(0xFFF28B22).withOpacity(0.4),
                    ),
                    child: Text(l10n.continueText,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
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

  String _getLocalizedText(String key, AppLocalizations l10n) {
    switch (key) {
      // Project Types
      case 'typeHouses':
        return l10n.typeHouses;
      case 'typeApartment':
        return l10n.typeApartment;
      case 'typeBuilding':
        return l10n.typeBuilding;
      case 'typeFactory':
        return l10n.typeFactory;
      case 'typeShop':
        return l10n.typeShop;
      case 'typeRoads':
        return l10n.typeRoads;
      case 'typeGardens':
        return l10n.typeGardens;
      case 'typeWarehouse':
        return l10n.typeWarehouse;
      // Services
      case 'engineeringTitle':
        return l10n.engineeringTitle;
      case 'materials':
        return l10n.materials;
      case 'labor':
        return l10n.labor;
      case 'finishing':
        return l10n.finishing;
      // Service Descs
      case 'svcDescDesignPlanning':
        return l10n.svcDescDesignPlanning;
      case 'svcDescSupplyDelivery':
        return l10n.svcDescSupplyDelivery;
      case 'svcDescSkilledWorkers':
        return l10n.svcDescSkilledWorkers;
      case 'svcDescPaintTiles':
        return l10n.svcDescPaintTiles;
      // Materials
      case 'materialConcrete':
        return l10n.materialConcrete;
      case 'materialSand':
        return l10n.materialSand;
      case 'materialBackfill':
        return l10n.materialBackfill;
      case 'materialMortar':
        return l10n.materialMortar;
      default:
        return key;
    }
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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.selectProjectType,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 4),
        Text(l10n.chooseProjectTypeDesc,
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16)),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: _projectTypes.length,
          itemBuilder: (context, index) {
            final type = _projectTypes[index];
            final isSelected = _selectedType == type['key'];
            return _SelectableCard(
              icon: type['icon'],
              label: _getLocalizedText(type['key'], l10n),
              isSelected: isSelected,
              onTap: () => setState(() => _selectedType = type['key']),
            );
          },
        ),
      ],
    );
  }

  Widget _buildStep2() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.selectServicesTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 4),
        Text(l10n.chooseServicesNeed,
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16)),
        const SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _services.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final service = _services[index];
            final isSelected = _selectedServices.contains(service['key']);
            return _ServiceSelectionItem(
              icon: service['icon'],
              label: _getLocalizedText(service['key'], l10n),
              desc: _getLocalizedText(service['descKey'], l10n),
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedServices.remove(service['key']);
                  } else {
                    _selectedServices.add(service['key']);
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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.inputQuantity,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 4),
        Text(l10n.enterAreaSelectMaterial,
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16)),
        const SizedBox(height: 24),
        // Area Selector
        Text(l10n.areaSqm,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black26)),
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
                onPressed: () =>
                    setState(() => _area = _area > 0 ? _area - 1 : 0),
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F1F4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              Column(
                children: [
                  Text(_area.toString(),
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF28B22))),
                  Text(l10n.metersSq,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFCE6D3),
                          fontWeight: FontWeight.w600)),
                ],
              ),
              IconButton(
                onPressed: () => setState(() => _area++),
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                    backgroundColor: const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Material Type Dropdown
        Text(l10n.materialType,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black26)),
        const SizedBox(height: 12),
        Column(
          children: [
            InkWell(
              onTap: () => setState(
                  () => _isMaterialDropdownOpen = !_isMaterialDropdownOpen),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_getLocalizedText(_selectedMaterial, l10n),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Icon(
                      _isMaterialDropdownOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFCE6D3).withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          _getLocalizedText(m, l10n),
                          style: TextStyle(
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected
                                ? const Color(0xFFF28B22)
                                : Colors.black,
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
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.costEstimationTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        const SizedBox(height: 4),
        Text(l10n.detailedBreakdownProject,
            style:
                TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16)),
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
                        TextSpan(
                            text:
                                l10n.projectTypeShop),
                        const TextSpan(text: ' • '),
                        TextSpan(text: _area.toString()),
                        TextSpan(text: l10n.sqUnit),
                      ],
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE6D3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(_getLocalizedText(_selectedMaterial, l10n),
                        style: const TextStyle(
                            color: Color(0xFFF28B22),
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: Color(0xFFF1F1F4)),
              ),
              _CostItem(
                  label: l10n.materials,
                  value: l10n.cost12500),
              const SizedBox(height: 16),
              _CostItem(
                  label: l10n.labor,
                  value: l10n.cost8200),
              const SizedBox(height: 16),
              _CostItem(
                  label: l10n.engineeringTitle,
                  value: l10n.cost4800),
              const SizedBox(height: 16),
              _CostItem(
                  label: l10n.finishing,
                  value: l10n.cost3500),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: Color(0xFFF1F1F4)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.totalLabel,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(l10n.cost29000,
                      style: const TextStyle(
                          color: Color(0xFFF28B22),
                          fontWeight: FontWeight.w800,
                          fontSize: 24)),
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
        Text(label,
            style: const TextStyle(
                color: Colors.black26, fontWeight: FontWeight.w500)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _SelectableCard extends StatelessWidget {
  const _SelectableCard(
      {required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap});

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
          color: const Color(0x26F58220),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF58220) : Colors.transparent,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF58220).withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFFF58220), size: 38),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 17,
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
          color: const Color(0x26F58220),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFFF58220) : Colors.transparent,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF58220).withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFFF58220), size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 2),
                  Text(desc,
                      style:
                          const TextStyle(color: Colors.black26, fontSize: 15)),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFF28B22)
                      : const Color(0xFFF1F1F4),
                  width: 1.5,
                ),
                color:
                    isSelected ? const Color(0xFFF28B22) : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 12)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
