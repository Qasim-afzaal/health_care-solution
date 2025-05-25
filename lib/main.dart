import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'package:veritey/api_repository/loading.dart';
import 'package:veritey/core/constants/helper.dart';
import 'package:veritey/core/constants/imports.dart';
import 'package:veritey/core/theme/theme_light.dart';
import 'package:veritey/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // await Firebase.initializeApp();
  Loading();
  Utils.screenPortrait();
//  Get.lazyPut<SocketService>(() => SocketService(), fenix: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeLight().theme,
                builder: EasyLoading.init(),
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
              ),
            ));
  }
}
