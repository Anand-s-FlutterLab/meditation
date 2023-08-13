import 'package:meditation/core/app_export.dart';
import 'package:meditation/presentation/home_screen/controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 2.5,
              width: width,
              decoration: const BoxDecoration(
                color: Color(0xff2D31AC),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(45)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    customText(
                      text: "DAY 7",
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    customText(
                        text: "Love and Accept Yourself",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        maxLines: 2,
                        textAlign: TextAlign.start),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                    text: "Popular",
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.seeAllScreen),
                    child: customText(
                      text: "See All",
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.45,
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(left: 20, right: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    children: [
                      homeScreenCard(
                        containerColor: const Color(0xff2D73D5),
                        cardTitle: "Anxiety",
                        cardDesc: "Turn down the stress volume",
                        cardTiming: "7 steps | 5 - 11 min",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      homeScreenCard(
                        containerColor: const Color(0xffC58A72),
                        cardTitle: "Happiness",
                        cardDesc: "Daily Calm",
                        cardTiming: "7 steps | 3 - 11 min",
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      homeScreenCard(
                        containerColor: const Color(0xff44ADE3),
                        cardTitle: "Anxiety",
                        cardDesc: "Turn down the stress volume",
                        cardTiming: "7 steps | 5 - 11 min",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      homeScreenCard(
                        containerColor: const Color(0xff6565c7),
                        cardTitle: "Happiness",
                        cardDesc: "Daily Calm",
                        cardTiming: "7 steps | 3 - 11 min",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}

Widget homeScreenCard({
  required Color containerColor,
  required String cardTitle,
  required String cardDesc,
  required String cardTiming,
}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
    height: height * 0.20,
    width: width * 0.75,
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          text: cardTitle,
        ),
        const SizedBox(
          height: 10,
        ),
        customText(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          text: cardDesc,
        ),
        const Spacer(),
        customText(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          text: cardTiming,
        ),
      ],
    ),
  );
}
