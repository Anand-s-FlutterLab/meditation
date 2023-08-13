import 'package:get/get.dart';
import 'package:meditation/presentation/profile_screen_screen/controller/profile_screen_controller.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileScreenController,
    );
  }
}
