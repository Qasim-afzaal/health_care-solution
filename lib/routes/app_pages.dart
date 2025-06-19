import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/pages/all_chats/all_chat.dart';
import 'package:veritey/pages/all_chats/all_chat_binding.dart';
import 'package:veritey/pages/auth/create_password/create_password.dart';
import 'package:veritey/pages/auth/create_password/create_password_binding.dart';
import 'package:veritey/pages/auth/enable_permission/enable_location_permission_screen.dart';
import 'package:veritey/pages/auth/enable_permission/enable_location_permission_screen_binding.dart';
import 'package:veritey/pages/auth/location/location_screen.dart';
import 'package:veritey/pages/auth/location/location_screen_binding.dart';
import 'package:veritey/pages/auth/location_options/location_options_screen.dart';
import 'package:veritey/pages/auth/location_options/location_options_screen_binding.dart';
import 'package:veritey/pages/auth/login/login.dart';
import 'package:veritey/pages/auth/otp/otp_page.dart';
import 'package:veritey/pages/auth/otp/otp_page_binding.dart';
import 'package:veritey/pages/auth/phone/phone.dart';
import 'package:veritey/pages/auth/phone/phone_binding.dart';
import 'package:veritey/pages/auth/select_address/select_address_screen.dart';
import 'package:veritey/pages/auth/select_address/select_address_screen_binding.dart';
import 'package:veritey/pages/auth/select_country/select_country_screen.dart';
import 'package:veritey/pages/auth/select_country/select_country_screen_binding.dart';
import 'package:veritey/pages/chat/chat.dart';
import 'package:veritey/pages/chat/chat_binding.dart';
import 'package:veritey/pages/chat_page/chat_page.dart';
import 'package:veritey/pages/chat_page/chat_page_binding.dart';
import 'package:veritey/pages/home/home.dart';
import 'package:veritey/pages/profile/profile.dart';
import 'package:veritey/pages/profile/profile_binding.dart';
import 'package:veritey/pages/profile/profile_detail.dart';
import 'package:veritey/pages/schedule/schedule_page.dart';
import 'package:veritey/pages/schedule/schedule_page_binding.dart';
import 'package:veritey/pages/solution_care/care_giver/care_giver.dart';
import 'package:veritey/pages/solution_care/care_giver/care_giver_binding.dart';
import 'package:veritey/pages/solution_care/components/booking_page.dart';
import 'package:veritey/pages/solution_care/home_health/home_health.dart';
import 'package:veritey/pages/solution_care/home_health/home_health_binding.dart';
import 'package:veritey/pages/solution_care/medical_care/medical_care.dart';
import 'package:veritey/pages/solution_care/medical_care/medical_care_binding.dart';
import 'package:veritey/pages/solution_care/mental_health/mental_health.dart';
import 'package:veritey/pages/solution_care/mental_health/mental_health_binding.dart';
import 'package:veritey/pages/solution_care/on_demand/on_demand.dart';
import 'package:veritey/pages/solution_care/on_demand/on_demand_binding.dart';
import 'package:veritey/pages/solution_care/solution_care.dart';
import 'package:veritey/pages/solution_care/solution_care_binding.dart';
import 'package:veritey/pages/start/create_account/create_account.dart';
import 'package:veritey/pages/start/get_started_screen/get_started_screen.dart';
import 'package:veritey/pages/start/get_started_screen/get_started_screen_binding.dart';
import 'package:veritey/pages/start/splash/splash.dart';

import '../pages/auth/login/login_binding.dart';
import '../pages/dashboard/dashboard_binding.dart';
import '../pages/home/home_binding.dart';
import '../pages/start/create_account/create_account_binding.dart';
import '../pages/start/splash/splash_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: _Paths.CREATE_ACCOUNT,
        page: () => const CreateAccountPage(),
        binding: CreateAccountBinding()),
    GetPage(
        name: _Paths.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: _Paths.MAINPAGE,
        page: () => const GetStarted(),
        binding: GetStartedScreenBinding()),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => DashboardPage(),
        binding: DashBoardBinding()),
    GetPage(name: _Paths.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: _Paths.CHAT,
        page: () => const ChatPage(),
        binding: ChatBinding()),
    GetPage(
        name: _Paths.CHAT_PAGE,
        page: () => const ChatScreen(),
        binding: ChatScreenBinding()),
    GetPage(
        name: _Paths.SHEDULE,
        page: () => SchedulePage(),
        binding: SchedulePageBinding()),
    GetPage(
        name: _Paths.CARE,
        page: () => SolutionCare(),
        binding: SolutionCareBinding()),
    GetPage(
        name: _Paths.MENTAL_HEALTH,
        page: () => MentalHealth(),
        binding: MentalHealthBinding()),
    GetPage(
        name: _Paths.HOME_HEALTH,
        page: () => HomeHealthPage(),
        binding: HomeHealthBinding()),
    GetPage(
        name: _Paths.MEDICAL_CARE,
        page: () => MedicalCarePage(),
        binding: MedicalCareBinding()),
    GetPage(
        name: _Paths.CARE_GIVER,
        page: () => CareGiverPage(),
        binding: CareGiverBinding()),
    GetPage(
        name: _Paths.ON_DEMAND,
        page: () => OnDemandPage(),
        binding: OnDemandBinding()),
    GetPage(
        name: _Paths.BOOKING_PAGE,
        page: () => BookingPage(),
        binding: MentalHealthBinding()),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.PROFILE_DETAIL,
        page: () => ProfileDetailPage(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.LOCATION_SCREEN,
        page: () => const LocationScreen(),
        binding: LocationScreenBinding()),
    GetPage(
        name: _Paths.LOCATION_SCREEN2,
        page: () => const LocationOptionsScreen(),
        binding: LocationOptionsScreenBinding()),
    GetPage(
        name: _Paths.LOCATION_PERMISSION_SCREEN,
        page: () => const EnableLocationPermissionScreen(),
        binding: EnableLocationPermissionScreenBinding()),
    GetPage(
        name: _Paths.SELECTED_COUNTRY,
        page: () => const SelectCountryScreen(),
        binding: SelectCountryScreenBinding()),
    GetPage(
        name: _Paths.ALL_CHAT,
        page: () => AllChatPage(),
        binding: AllChatBinding()),
    GetPage(
        name: _Paths.CREATE_PASSWORD,
        page: () => CreatePasswordPage(),
        binding: CreatePasswordBinding()),
    GetPage(
        name: _Paths.SELECTED_ADDRESS,
        page: () => const SelectAddressScreen(),
        binding: SelectAddressScreenBinding()),
    GetPage(
        name: _Paths.OTP,
        page: () => const OtpPage(),
        binding: OtpPageBinding()),
    GetPage(
        name: _Paths.PHONE, page: () => PhonePage(), binding: PhoneBinding()),
  ];
}
