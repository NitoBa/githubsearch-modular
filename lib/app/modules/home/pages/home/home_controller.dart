import 'package:gobarber/app/modules/home/models/githubUser_model.dart';
import 'package:gobarber/app/modules/home/viewmodels/githubuser_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserGitHubViewModel _gitHubViewModel;

  _HomeControllerBase(this._gitHubViewModel);

  @observable
  UserGitHubModel userModel;

  @action
  Future getUserOnGitHub(String user) async {
    userModel = await _gitHubViewModel.getUser(user);
  }
}
