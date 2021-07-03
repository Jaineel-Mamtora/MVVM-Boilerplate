import '../locator.dart';
import '../ui/views/home_view.dart';
import '../viewmodels/base_viewmodel.dart';
import '../services/navigation_service.dart';

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> onModelReady() async {
    // important line!!
    await Future.delayed(Duration(milliseconds: 1000));
    _navigationService.pushNamedAndRemoveUntil(HomeView.routeName);
  }

  void onModelDestroy() {}
}
