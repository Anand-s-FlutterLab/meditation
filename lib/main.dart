import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meditation/presentation/mental_training_screen/binding/mental_training_binding.dart';
import 'package:meditation/routes/app_routes.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(
    Meditation(),
  );
}

class Meditation extends StatelessWidget {
  Meditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation',
      initialRoute: AppRoutes.homeScreen,
      getPages: AppRoutes.pages,
      initialBinding: MentalTrainingBinding(),
    );
  }
}
