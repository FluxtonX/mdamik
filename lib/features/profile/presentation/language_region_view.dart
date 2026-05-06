import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/localization/locale_provider.dart';

class LanguageRegionView extends StatefulWidget {
  const LanguageRegionView({super.key});

  static const routeName = '/profile/language-region';

  @override
  State<LanguageRegionView> createState() => _LanguageRegionViewState();
}

class _LanguageRegionViewState extends State<LanguageRegionView> {
  final LocaleProvider _localeProvider = LocaleProvider();

  String _selectedCurrencyKey = 'currencyUsDollarWithSymbol';
  String _selectedMeasurementKey = 'measurementMetricName';

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _localeProvider,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        final currentLocaleCode = _localeProvider.locale?.languageCode ?? 'en';

        final languages = <Map<String, String>>[
          {
            'code': 'en',
            'name': l10n?.languageNameEnglish ?? 'English',
            'sub': l10n?.languageNameEnglish ?? 'English',
          },
          {
            'code': 'ar',
            'name': l10n?.languageNameArabic ?? 'Arabic',
            'sub': l10n?.arabic ?? 'العربية',
          },
        ];

        final currencies = <Map<String, String>>[
          {
            'key': 'currencyUsDollarWithSymbol',
            'name': l10n?.currencyUsDollarWithSymbol ?? 'US Dollar (\$)',
            'sub': 'USD',
          },
          {
            'key': 'currencyPakistaniRupeeWithSymbol',
            'name': l10n?.currencyPakistaniRupeeWithSymbol ??
                'Pakistani Rupee (Rs)',
            'sub': 'PKR',
          },
          {
            'key': 'currencyUaeDirhamWithSymbol',
            'name': l10n?.currencyUaeDirhamWithSymbol ?? 'UAE Dirham (د.إ)',
            'sub': 'AED',
          },
          {
            'key': 'currencySaudiRiyalWithSymbol',
            'name': l10n?.currencySaudiRiyalWithSymbol ??
                'Saudi Riyal (ر.س)',
            'sub': 'SAR',
          },
        ];

        final measurements = <Map<String, String>>[
          {
            'key': 'measurementMetricName',
            'name': l10n?.measurementMetricName ?? 'Metric (m², km)',
            'sub': l10n?.measurementMetricSub ?? 'Meters, kilometers',
          },
          {
            'key': 'measurementImperialName',
            'name': l10n?.measurementImperialName ?? 'Imperial (sq ft, miles)',
            'sub': l10n?.measurementImperialSub ?? 'Feet, miles',
          },
        ];

        return Scaffold(
          backgroundColor: const Color(0xFFFBFBFB),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF1F1F4)),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back,
                      color: Color(0xFFF28B22), size: 18),
                ),
              ),
            ),
            title: Text(l10n?.languageRegionTitle ?? 'Language & Region',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(l10n?.sectionLanguage ?? 'LANGUAGE'),
                _buildLanguageList(languages, currentLocaleCode),
                const SizedBox(height: 32),
                _buildSectionTitle(l10n?.sectionCurrency ?? 'CURRENCY'),
                _buildKeySelectionList(
                  items: currencies,
                  selectedKey: _selectedCurrencyKey,
                  onSelected: (key) =>
                      setState(() => _selectedCurrencyKey = key),
                ),
                const SizedBox(height: 32),
                _buildSectionTitle(
                    l10n?.sectionMeasurementSystem ?? 'MEASUREMENT SYSTEM'),
                _buildKeySelectionList(
                  items: measurements,
                  selectedKey: _selectedMeasurementKey,
                  onSelected: (key) =>
                      setState(() => _selectedMeasurementKey = key),
                ),
                const SizedBox(height: 48),

                // Save Preferences Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: Text(l10n?.savePreferences ?? 'Save Preferences',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title,
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
    );
  }

  Widget _buildLanguageList(List<Map<String, String>> items, String selectedCode) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = selectedCode == item['code'];
          return InkWell(
            onTap: () async {
              final code = item['code']!;
              await _localeProvider.setLocale(Locale(code));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(height: 4),
                            Text(item['sub']!,
                                style: TextStyle(
                                    color: isSelected
                                        ? const Color(0xFFF28B22).withOpacity(0.5)
                                        : Colors.black.withOpacity(0.3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check_circle,
                            color: Color(0xFFF28B22), size: 24),
                    ],
                  ),
                ),
                if (index < items.length - 1)
                  const Divider(height: 1, color: Color(0xFFF1F1F4)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildKeySelectionList({
    required List<Map<String, String>> items,
    required String selectedKey,
    required ValueChanged<String> onSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final key = item['key']!;
          final isSelected = selectedKey == key;
          return InkWell(
            onTap: () => onSelected(key),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item['name']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(height: 4),
                            Text(item['sub']!,
                                style: TextStyle(
                                    color: isSelected
                                        ? const Color(0xFFF28B22).withOpacity(0.5)
                                        : Colors.black.withOpacity(0.3),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      if (isSelected)
                        const Icon(Icons.check_circle,
                            color: Color(0xFFF28B22), size: 24),
                    ],
                  ),
                ),
                if (index < items.length - 1)
                  const Divider(height: 1, color: Color(0xFFF1F1F4)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
