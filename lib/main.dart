// ignore_for_file: constant_identifier_names
//changed

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion/controller/app_controller.dart';
import 'package:global_health_opinion/views/Authentication/changepassword.dart';
import 'package:global_health_opinion/views/Authentication/otpconfirmation.dart';
import 'package:global_health_opinion/views/Authentication/signin.dart';
import 'package:global_health_opinion/views/CaseManagement/closedcase.dart';
import 'package:global_health_opinion/views/CaseManagement/newcase.dart';
import 'package:global_health_opinion/views/CaseManagement/payment.dart';
import 'package:global_health_opinion/views/homepage.dart';
import 'package:global_health_opinion/views/notification.dart';
import 'package:global_health_opinion/views/profile/account_details.dart';
import 'package:global_health_opinion/views/profile/accreditation.dart';
import 'package:global_health_opinion/views/profile/info.dart';
import 'package:global_health_opinion/views/profile/insurance.dart';
import 'package:global_health_opinion/views/profile/password.dart';
import 'package:global_health_opinion/views/profile/profile.dart';
import 'package:global_health_opinion/views/splash/splashscreen.dart';
import 'package:global_health_opinion/views/telecommunication/create.dart';
import 'package:global_health_opinion/views/telecommunication/telecommunication.dart';
import 'package:global_health_opinion/views/telecommunication/updates.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:global_health_opinion/views/CaseManagement/casemanagement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const SplashScreen(),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AppController());
        },
      ),
      getPages: [
        GetPage(
          name: PageRouteName.Home,
          page: () => HomePage(),
        ),
        GetPage(
          name: PageRouteName.login,
          page: () => SignIn(),
        ),
        GetPage(
          name: PageRouteName.casemanage,
          page: () => CaseManagement(),
        ),
        GetPage(
          name: PageRouteName.telecom,
          page: () => Telecommunication(),
        ),
        GetPage(
          name: PageRouteName.notify,
          page: () => const Notificationn(),
        ),
        GetPage(
          name: PageRouteName.profile,
          page: () => Profile(),
        ),
        GetPage(
          name: PageRouteName.newcase,
          page: () => const Newcase(),
        ),
        GetPage(
          name: PageRouteName.closedcase,
          page: () => const Closedcase(),
        ),
        GetPage(
          name: PageRouteName.payment,
          page: () => const Payment(),
        ),
        GetPage(
          name: PageRouteName.create,
          page: () => Create(),
        ),
        GetPage(
          name: PageRouteName.update,
          page: () => const Updates(),
        ),
        GetPage(
          name: PageRouteName.info,
          page: () => Info(),
        ),
        GetPage(
          name: PageRouteName.Accounts,
          page: () => const AccountDetails(),
        ),
        GetPage(
          name: PageRouteName.pass,
          page: () => const Password(),
        ),
        GetPage(
          name: PageRouteName.insu,
          page: () => const Insurance(),
        ),
        GetPage(
          name: PageRouteName.accre,
          page: () => const Accreditation(),
        ),
        GetPage(
          name: PageRouteName.otpConfirmation,
          page: () => OtpConfirmation(),
        ),
        GetPage(
          name: PageRouteName.changepass,
          page: () => ChangePassword(),
        ),
      ],
    );
  }
}

class PageRouteName {
  static const Home = '/home';
  static const login = '/sigin';
  static const casemanage = '/casemanagement';
  static const telecom = '/telecommunication';
  static const notify = '/notification';
  static const profile = '/profile';
  static const newcase = '/newcase';
  static const closedcase = '/closedcase';
  static const payment = '/payment';
  static const update = '/updates';
  static const create = '/creates';
  static const info = '/info';
  static const Accounts = '/ac';
  static const pass = '/pass';
  static const insu = '/requests';
  static const accre = '/Accreditation';
  static const otpConfirmation = '/otpConfirmation';
  static const changepass = '/ChangePassword';
}
