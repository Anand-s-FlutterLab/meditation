import 'package:get/get.dart';
import 'package:meditation/presentation/see_all_screen/controller/see_all_controller.dart';

class SeeAllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SeeAllController());
  }
}
