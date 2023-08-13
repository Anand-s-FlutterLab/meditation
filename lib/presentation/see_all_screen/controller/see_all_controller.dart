import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meditation/core/app_export.dart';
import 'package:meditation/presentation/mental_training_screen/controller/mental_training_controller.dart';
import 'package:meditation/presentation/see_all_screen/model/see_all_model.dart';

class SeeAllController extends GetxController {
  final mentalTrainingController = Get.find<MentalTrainingController>();
  RxList<SeeAllSearch> seeAllSearchList = RxList<SeeAllSearch>();

  @override
  void onInit() {
    super.onInit();
    fetchSeeAllSearchData();
  }

  void fetchSeeAllSearchData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('homeSeeAllDetails')
          .get();

      List<SeeAllSearch> tempList = [];

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        tempList.add(SeeAllSearch.fromJson(data));
      }

      seeAllSearchList.assignAll(tempList);
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}
