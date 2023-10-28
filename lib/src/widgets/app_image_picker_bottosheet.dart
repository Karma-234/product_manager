import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_manager/src/service/image_picker_service/image_picker_service_impl.dart';
import 'package:product_manager/src/widgets/app_snackbar.dart';
import 'package:product_manager/src/widgets/app_text.dart';

import '../misc/enums.dart';

Future<String?> showImagePickerBottomsheet(BuildContext context) {
  return showModalBottomSheet<String?>(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.r),
        topRight: Radius.circular(12.r),
      ),
    ),
    context: context,
    builder: (context) => const AppImagePickerBottomsheet(),
  );
}

class AppImagePickerBottomsheet extends StatelessWidget {
  const AppImagePickerBottomsheet({Key? key}) : super(key: key);

  Widget imgType(
      {required VoidCallback onTap,
      required IconData icon,
      required String title}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(18.h),
          Icon(
            icon,
            color: Colors.black,
          ),
          Gap(4.h),
          AppText(
            text: title,
          ),
          Gap(30.h),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imgHandler = ImageHandlerImpl();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        imgType(
          onTap: () {
            try {
              imgHandler.pickImage(ImageSource.camera).then((imageData) {
                if (imageData == null) return;
                Get.back(result: imageData.path);
              });
            } catch (e) {
              appSnackBar(
                  alertType: AlertType.error,
                  message: 'Open settings to grant permission!');
            }
          },
          icon: Icons.camera_alt_outlined,
          title: 'Camera',
        ),
        imgType(
          onTap: () {
            try {
              imgHandler.pickImage(ImageSource.gallery).then((imageData) {
                if (imageData == null) return;
                Get.back(result: imageData.path);
              });
            } catch (e) {
              appSnackBar(
                  alertType: AlertType.error,
                  message: 'Open settings to grant permission!');
            }
          },
          icon: Icons.photo_library_rounded,
          title: 'Gallery',
        ),
      ],
    );
  }
}
