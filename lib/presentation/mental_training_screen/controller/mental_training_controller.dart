import 'package:meditation/core/app_export.dart';
import 'package:just_audio/just_audio.dart';

class MentalTrainingController extends GetxController {
  final player = AudioPlayer().obs;
  RxString title = "".obs;
  RxString color = "".obs;

  void onInit() {
    super.onInit();
  }

  Future<void> audioPlayer() async {
    try {
      await player.value.setAsset('assets/audio.mp3').then((value) {
        print("Audio Started");
      });
      print("Audio Playing");
    } catch (e) {
      print(e);
    }
  }
}
