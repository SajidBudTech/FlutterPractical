// ViewModel
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  BuildContext viewContext;
  //
  /*void showAlert({
    String title = "",
    String description = "",
    IconData iconData,
    Color backgroundColor,
  }) {
    EdgeAlert.show(
      viewContext,
      title: title,
      description: description,
      backgroundColor: backgroundColor ?? AppColor.successfulColor,
      icon: iconData ?? FlutterIcons.check_ant,
    );
  }

  //
  void showDialogAlert({
    DialogData dialogData,
    Function onPositivePressed,
  }) {
    CustomDialog.showConfirmationActionAlertDialog(
      viewContext,
      dialogData,
      negativeButtonAction: () {
        //dismiss dialog
        CustomDialog.dismissDialog(
          viewContext,
        );
      },
      positiveButtonAction: () {
        //dismiss dialog
        CustomDialog.dismissDialog(
          viewContext,
        );

        //
        onPositivePressed();
      },
    );
  }*/
}
