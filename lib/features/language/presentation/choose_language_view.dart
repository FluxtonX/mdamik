import 'package:flutter/material.dart';
import '../../../core/mvvm/view_model_builder.dart';
import 'choose_language_view_model.dart';

class LanguageModel {
  final String name;
  final String flag;

  const LanguageModel(this.name, this.flag);
}

const List<LanguageModel> _languages = [
  LanguageModel('Arabic', '🇦🇪'),
  LanguageModel('English', '🇬🇧'),
  LanguageModel('Urdu', '🇵🇰'),
  LanguageModel('Spanish', '🇪🇸'),
  LanguageModel('French', '🇫🇷'),
  LanguageModel('German', '🇩🇪'),
];

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key});

  static const routeName = '/language/choose';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseLanguageViewModel>(
      viewModelBuilder: () => ChooseLanguageViewModel(),
      builder: (context, vm, _) {
        final top = MediaQuery.paddingOf(context).top;
        final selectedLanguage = _languages[vm.selectedLanguageIndex];

        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          body: Column(
            children: [
              SizedBox(height: top + 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFF28B22).withOpacity(0.2),
                            width: 1.5,
                          ),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFFF28B22),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Choose language',
                      style: TextStyle(
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
                      const Text(
                        'You Selected',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFF28B22)),
                        ),
                        child: Row(
                          children: [
                            _buildCircularFlag(selectedLanguage.flag),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                selectedLanguage.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFFF28B22),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'You Selected',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFF28B22).withOpacity(0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search,
                                color: Colors.grey.shade600, size: 24),
                            const SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: List.generate(
                            _languages.length,
                            (index) {
                              final isSelected =
                                  vm.selectedLanguageIndex == index;
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () => vm.selectLanguage(index),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Row(
                                        children: [
                                          _buildCircularFlag(
                                              _languages[index].flag),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            child: Text(
                                              _languages[index].name,
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
                                  if (index < _languages.length - 1)
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
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/home/main'),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
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
