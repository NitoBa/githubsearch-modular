import 'package:gobarber/app/modules/home/models/githubReposModel.dart';
import 'package:gobarber/app/modules/home/viewmodels/githubuser_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'repos_controller.g.dart';

class ReposController = _ReposControllerBase with _$ReposController;

abstract class _ReposControllerBase with Store {
  final UserGitHubViewModel _gitHubViewModel;

  _ReposControllerBase(this._gitHubViewModel);

  @action
  Future<List<UserReposModel>> getReposOfUser(String user) async {
    return await _gitHubViewModel.getRepos(user);
  }
}
