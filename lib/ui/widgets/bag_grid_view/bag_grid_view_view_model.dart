import 'package:bagzz/app/app.locator.dart';
import 'package:bagzz/app/app.router.dart';
import 'package:bagzz/core/service/navigation/navigator_service.dart';
import 'package:bagzz/core/service/snack_bar_service/snack_bar_service.dart';
import 'package:bagzz/models/bag.dart';
import 'package:stacked/stacked.dart';

class BagGridViewModel extends BaseViewModel {
  final List<Bag> bags;

  BagGridViewModel(this.bags);

  final navigatorService = locator<NavigationService>();
  final snackBarService = locator<SnackBarService>();

  void onBagImagePressed(int index) {
    navigatorService.pushNamed(Routes.BagItemDetailsPage,
        arguments: BagItemDetailsPageArguments(bag: bags[index]));
  }

  void addToWishList() {
    snackBarService.showSnackBar('Bag added to wish list.');
  }
}
