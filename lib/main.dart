import 'package:cyberking_capitals/app/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const CyberKingCapitals());
}

class CyberKingCapitals extends StatelessWidget {
  const CyberKingCapitals({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: Colors.white,
            ),
            title: 'CYBERKING CAPITALS',
            initialRoute: '/',
            getPages: AppPages.pages,
          );
        });
  }
}
