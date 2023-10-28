import 'package:flutter/material.dart';
import 'package:get/get.dart';

appSnackBar(
    {String title = '',
    String message = '',
    AlertType alertType = AlertType.success}) {
  return Get.showSnackbar(
    GetSnackBar(
        title: title.isNotEmpty
            ? title
            : alertType == AlertType.success
                ? 'Success'
                : alertType == AlertType.warning
                    ? 'Warning'
                    : 'Error',
        duration: const Duration(seconds: 1),
        message: message,
        backgroundColor: alertType == AlertType.success
            ? Colors.green
            : alertType == AlertType.warning
                ? Colors.amber
                : Colors.red),
  );
}

enum AlertType { success, error, warning }
