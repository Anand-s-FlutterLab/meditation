import 'package:meditation/presentation/mental_training_screen/controller/mental_training_controller.dart';
import 'package:get/get.dart';

class MentalTrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => MentalTrainingController());
  }
}
