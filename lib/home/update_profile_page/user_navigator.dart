abstract class UserNavigator{
  void showMyLoading();
  void hideDialog();
  void showSuccess({required String message,required bool isDelete});
  void showError({required String message});

}