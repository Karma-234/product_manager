import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:product_manager/src/view/products/index_product_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GlobalLoaderOverlay(
            useDefaultLoading: true,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            overlayColor: Colors.black.withOpacity(0.3),
            child: GetMaterialApp(
              onGenerateTitle: (BuildContext context) => 'Product Manager',
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    return const IndexProductView();
                  },
                );
              },
            ),
          );
        });
  }
}
