abstract class DialogService {
  Future showDialog(String message);

  Future showLoadingDialog({required String message, required bool willPop});
}
