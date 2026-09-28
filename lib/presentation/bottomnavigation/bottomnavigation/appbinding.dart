import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:gratikey/data/controllers/appsetupcontroller.dart';
import 'package:gratikey/data/controllers/authcontroller.dart';
import 'package:gratikey/data/controllers/bottomnavigationcontroller.dart';
import 'package:gratikey/data/controllers/breathcontroller.dart';
import 'package:gratikey/data/controllers/communitycontroller.dart';
import 'package:gratikey/data/controllers/homecontroller.dart';
import 'package:gratikey/data/controllers/journalcontroller.dart';
import 'package:gratikey/data/controllers/keyscontroller.dart';
import 'package:gratikey/data/controllers/onboardingcontroller.dart';
import 'package:gratikey/data/controllers/passwordcontroller.dart';
import 'package:gratikey/data/controllers/prefrencecontroller.dart';
import 'package:gratikey/data/controllers/profilecontroller.dart';
import 'package:gratikey/data/controllers/subcryptioncontroller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController(),permanent: true);
    Get.put(HomeController(),permanent: true);
    Get.put(AuthController(),permanent: true);
    Get.put(OnboardingController(),permanent: true);
    Get.put(AppSetupController(),permanent: true);
    Get.put(BreathController(),permanent: true);
    Get.put(CommunityController(),permanent: true);
    Get.put(JournalController(),permanent: true);
    Get.put(KeysController(),permanent: true);
    Get.put(Passwordcontroller(),permanent: true);
    Get.put(PreferencesController(),permanent: true);
    Get.put(ProfileController(),permanent: true);
    Get.put(SubscriptionController(),permanent: true);

  }
}