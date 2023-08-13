import 'package:meditation/presentation/see_all_screen/controller/see_all_controller.dart';
import 'package:meditation/core/app_export.dart';

class SeeAllScreen extends GetWidget<SeeAllController> {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: customText(
          text: "Popular",
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.seeAllSearchList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  int color = int.parse(
                      "0xff${controller.seeAllSearchList[index].color}");
                  return GestureDetector(
                    onTap: () {
                      controller.mentalTrainingController.title.value =
                          controller.seeAllSearchList[index].title;
                      controller.mentalTrainingController.color.value =
                          controller.seeAllSearchList[index].color;
                      controller.mentalTrainingController.audioPlayer();
                      Get.toNamed(AppRoutes.mentalTrainingScreen);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(color),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                              text: controller.seeAllSearchList[index].title,
                              textAlign: TextAlign.start,
                            ),
                            customText(
                              text: controller.seeAllSearchList[index].timing,
                              color: Colors.grey,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite_border, color: Colors.grey),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemCount: controller.seeAllSearchList.length,
              ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
