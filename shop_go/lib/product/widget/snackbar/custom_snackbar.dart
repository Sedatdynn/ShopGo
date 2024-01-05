import 'package:flutter/material.dart';
import 'package:shop_go/product/app/app_colors.dart';

class ToastService {
  showMessage({
    required String title,
    required ToastType toastType,
    required BuildContext context,
    String? buttonLabel,
    Function(SnackBarClosedReason)? onClosed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        content: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
        )),
        backgroundColor: toastType == ToastType.error ? AppColors.red : AppColors.green,
      ),
    );
  }
}

enum ToastType { error, info }
