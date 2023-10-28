import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:product_manager/src/views/products/view/index_product_view.dart';

/// The Widget that configures your application.
class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // productController.initDatabase();
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
              theme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  hintStyle: GoogleFonts.karla(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
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
