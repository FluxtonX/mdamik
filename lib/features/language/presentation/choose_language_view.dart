import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/localization/locale_provider.dart';

class LanguageModel {
  final String name;
  final String flag;
  final String code;

  const LanguageModel(this.name, this.flag, this.code);
}

class ChooseLanguageView extends StatefulWidget {
  const ChooseLanguageView({super.key});

  static const routeName = '/language/choose';

  @override
  State<ChooseLanguageView> createState() => _ChooseLanguageViewState();
}

class _ChooseLanguageViewState extends State<ChooseLanguageView> {
  final LocaleProvider _localeProvider = LocaleProvider();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _localeProvider,
      builder: (context, _) {
        final l10n = AppLocalizations.of(context);
        final top = MediaQuery.paddingOf(context).top;

        final List<LanguageModel> languages = [
          LanguageModel(l10n?.arabic ?? 'Arabic', '🇦🇪', 'ar'),
          LanguageModel(l10n?.english ?? 'English', '🇬🇧', 'en'),
        ];

        // Find currently selected language based on LocaleProvider
        final currentLocaleCode = _localeProvider.locale?.languageCode ?? 'en';

        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: Column(
            children: [
              SizedBox(height: top + 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    
                    const SizedBox(width: 16),
                    Text(
                      l10n?.chooseLanguage ?? 'Choose language',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  l10n?.chooseLanguageSubtitle ??
                      'Select your preferred language below This helps us serve you better.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: List.generate(
                            languages.length,
                            (index) {
                              final isSelected =
                                  languages[index].code == currentLocaleCode;
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _localeProvider.setLocale(
                                        Locale(languages[index].code),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Row(
                                        children: [
                                          _buildCircularFlag(
                                              languages[index].flag),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Text(
                                              languages[index].name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: isSelected
                                                    ? const Color(0xFFF28B22)
                                                    : const Color(0xFFF28B22)
                                                        .withOpacity(0.5),
                                                width: 1.5,
                                              ),
                                              color: isSelected
                                                  ? const Color(0xFFF28B22)
                                                  : Colors.transparent,
                                            ),
                                            child: isSelected
                                                ? const Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )
                                                : null,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (index < languages.length - 1)
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Colors.grey.shade200,
                                      indent: 16,
                                      endIndent: 16,
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 54,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFF28B22),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF28B22).withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/auth/login'),
                  child: Text(
                    l10n?.continueText ?? 'Continue',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCircularFlag(String flag) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF1F1F4),
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      child: Transform.scale(
        scale: 1.8,
        child: Text(
          flag,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
