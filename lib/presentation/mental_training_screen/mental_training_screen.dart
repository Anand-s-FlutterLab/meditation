import 'package:meditation/presentation/mental_training_screen/controller/mental_training_controller.dart';
import 'package:meditation/core/app_export.dart';

class MentalTrainingScreen extends GetWidget<MentalTrainingController> {
  @override
  Widget build(BuildContext context) {
    int color = int.parse("0xff${controller.color.value}");
    return Scaffold(
      backgroundColor: Color(color),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.arrow_drop_down_outlined),
                    customText(
                        text: controller.title.value,
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    const Icon(Icons.close),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.65,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.favorite_border, color: Colors.white, size: 30),
                  Icon(Icons.pause_circle_outline,
                      color: Colors.white, size: 40),
                  Icon(Icons.menu, color: Colors.white, size: 30)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => SizedBox(
                  height: 80,
                  width: width,
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    value:
                        controller.player.value.position.inSeconds.toDouble(),
                    min: 0.0,
                    max: 43.0,
                    onChanged: (double value) {
                      controller.player.value.seek(
                        Duration(seconds: value.toInt()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
