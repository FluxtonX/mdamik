import 'package:flutter/material.dart';
import 'package:mdamik/features/profile/presentation/profile_view.dart';
import 'package:mdamik/features/projects/presentation/project_details_view.dart';

import '../features/auth/presentation/auth_login_view.dart';
import '../features/auth/presentation/auth_otp_view.dart';
import '../features/auth/presentation/auth_register_view.dart';
import '../features/auth/presentation/auth_reset_password_view.dart';
import '../features/auth/presentation/auth_success_view.dart';
import '../features/chat/presentation/chat_conversation_view.dart';
import '../features/home/presentation/all_services_view.dart';
import '../features/home/presentation/main_nav_view.dart';
import '../features/home/presentation/notifications_view.dart';
import '../features/project_setup/presentation/construction_view.dart';
import '../features/project_setup/presentation/payment_success_view.dart';
import '../features/project_setup/presentation/payment_view.dart';
import '../features/project_setup/presentation/project_setup_view.dart';
import '../features/engineering/presentation/engineering_view.dart';
import '../features/engineering/presentation/professional_list_view.dart';
import '../features/excavation/presentation/excavation_view.dart';
import '../features/financial/presentation/financial_view.dart';
import '../features/labor/presentation/labor_hiring_view.dart';
import '../features/materials/presentation/materials_view.dart';
import '../features/transport/presentation/transport_view.dart';
import '../features/services/presentation/services_view.dart';
import '../features/services/presentation/site_services_list_view.dart';
import '../features/real_estate/presentation/property_details_view.dart';
import '../features/real_estate/presentation/real_estate_view.dart';
import '../features/projects/presentation/project_management_details_view.dart';
import '../features/profile/presentation/profile_information_view.dart';
import '../features/profile/presentation/security_privacy_view.dart';
import '../features/profile/presentation/notifications_settings_view.dart';
import '../features/splash/presentation/splash_view.dart';
import '../features/language/presentation/choose_language_view.dart';
import '../features/management/presentation/management_view.dart';
import '../features/management/presentation/management_details_view.dart';
import '../features/profile/presentation/language_region_view.dart';
import '../features/profile/presentation/payment_methods_view.dart';
import '../features/profile/presentation/support_view.dart';
import '../features/payment/presentation/payment_options_view.dart';
import '../features/payment/presentation/payment_info_view.dart';
import '../features/payment/presentation/payment_review_view.dart';
import '../features/payment/presentation/payment_processing_view.dart';
import '../features/payment/presentation/payment_successful_view.dart';
import '../features/admin/presentation/admin_login_view.dart';
import '../features/admin/presentation/admin_main_nav_view.dart';
import '../features/admin/presentation/admin_construction_manage_view.dart';
import '../features/admin/presentation/admin_add_project_type_view.dart';
import '../features/admin/presentation/admin_real_estate_manage_view.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/localization/locale_provider.dart';

class App extends StatelessWidget {
  final LocaleProvider localeProvider;

  const App({super.key, required this.localeProvider});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: localeProvider,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: localeProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          title: 'MDAMIK',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: null,
          ),
          initialRoute: SplashView.routeName,
          routes: {
            SplashView.routeName: (_) => const SplashView(),
            AuthLoginView.routeName: (_) => const AuthLoginView(),
            AuthOtpView.routeName: (_) => const AuthOtpView(),
            AuthRegisterView.routeName: (_) => const AuthRegisterView(),
            AuthResetPasswordView.routeName: (_) =>
                const AuthResetPasswordView(),
            AuthSuccessView.routeName: (_) => const AuthSuccessView(),
            MainNavView.routeName: (_) => const MainNavView(),
            AllServicesView.routeName: (_) => const AllServicesView(),
            NotificationsView.routeName: (_) => const NotificationsView(),
            ProjectDetailsView.routeName: (_) => const ProjectDetailsView(),
            ChatConversationView.routeName: (_) => const ChatConversationView(),
            ConstructionView.routeName: (_) => const ConstructionView(),
            ProjectSetupView.routeName: (_) => const ProjectSetupView(),
            PaymentView.routeName: (_) => const PaymentView(),
            PaymentSuccessView.routeName: (_) => const PaymentSuccessView(),
            RealEstateView.routeName: (_) => const RealEstateView(),
            PropertyDetailsView.routeName: (_) => const PropertyDetailsView(),
            EngineeringView.routeName: (_) => const EngineeringView(),
            ProfessionalListView.routeName: (_) => const ProfessionalListView(),
            MaterialsView.routeName: (_) => const MaterialsView(),
            LaborHiringView.routeName: (_) => const LaborHiringView(),
            ExcavationView.routeName: (_) => const ExcavationView(),
            TransportView.routeName: (_) => const TransportView(),
            ServicesView.routeName: (_) => const ServicesView(),
            SiteServicesListView.routeName: (_) => const SiteServicesListView(),
            ProjectManagementDetailsView.routeName: (_) =>
                const ProjectManagementDetailsView(),
            FinancialView.routeName: (_) => const FinancialView(),
            ProfileView.routeName: (_) => const ProfileView(),
            ProfileInformationView.routeName: (_) =>
                const ProfileInformationView(),
            SecurityPrivacyView.routeName: (_) => const SecurityPrivacyView(),
            NotificationsSettingsView.routeName: (_) =>
                const NotificationsSettingsView(),
            ChooseLanguageView.routeName: (_) => const ChooseLanguageView(),
            ManagementView.routeName: (_) => const ManagementView(),
            ManagementDetailsView.routeName: (_) =>
                const ManagementDetailsView(),
            LanguageRegionView.routeName: (_) => const LanguageRegionView(),
            PaymentMethodsView.routeName: (_) => const PaymentMethodsView(),
            SupportView.routeName: (_) => const SupportView(),
            PaymentOptionsView.routeName: (_) => const PaymentOptionsView(),
            PaymentInfoView.routeName: (_) => const PaymentInfoView(),
            PaymentReviewView.routeName: (_) => const PaymentReviewView(),
            PaymentProcessingView.routeName: (_) =>
                const PaymentProcessingView(),
            PaymentSuccessfulView.routeName: (_) =>
                const PaymentSuccessfulView(),
            AdminLoginView.routeName: (_) => const AdminLoginView(),
            AdminMainNavView.routeName: (_) => const AdminMainNavView(),
            AdminConstructionManageView.routeName: (_) => const AdminConstructionManageView(),
            AdminAddProjectTypeView.routeName: (_) => const AdminAddProjectTypeView(),
            AdminRealEstateManageView.routeName: (_) => const AdminRealEstateManageView(),
          },
        );
      },
    );
  }
}
