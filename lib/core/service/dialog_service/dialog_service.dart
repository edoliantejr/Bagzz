abstract class DialogService {
  Future showConfirmationDialog({
    required String title,
    required String middleText,
    required Function onCancel,
    required Function onContinue,
    required String textConfirm,
  });

  Future showLoadingDialog({
    required String message,
    required bool willPop,
  });
}
