import 'package:get/get.dart';
import 'package:meditation/presentation/home_screen/home_screen.dart';
import 'package:meditation/presentation/home_screen/binding/home_binding.dart';
import 'package:meditation/presentation/mental_training_screen/binding/mental_training_binding.dart';
import 'package:meditation/presentation/profile_screen_screen/binding/profile_screen_binding.dart';
import 'package:meditation/presentation/profile_screen_screen/profile_screen_screen.dart';
import 'package:meditation/presentation/see_all_screen/binding/see_all_binding.dart';
import 'package:meditation/presentation/see_all_screen/see_all_screen.dart';
import 'package:meditation/presentation/mental_training_screen/mental_training_screen.dart';

class AppRoutes {
  static String homeScreen = "/home_screen";
  static String seeAllScreen = "/see_all_screen";
  static String profileScreen = "/profile_screen";
  static String mentalTrainingScreen = "/mental_training_screen";

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: seeAllScreen,
      page: () => const SeeAllScreen(),
      bindings: [SeeAllBindings()],
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
      bindings: [ProfileScreenBinding()],
    ),
    GetPage(
      name: mentalTrainingScreen,
      page: () => MentalTrainingScreen(),
      bindings: [MentalTrainingBinding()],
    ),
  ];
}
