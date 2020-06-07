import 'package:gobarber/app/modules/home/models/githubReposModel.dart';
import 'package:gobarber/app/modules/home/models/githubUser_model.dart';
import 'package:gobarber/app/modules/home/repositories/home_repository_inteface.dart';

class UserGitHubViewModel {
  final IHomeRepository _homeRepository;

  UserGitHubViewModel(this._homeRepository);

  Future<UserGitHubModel> getUser(String user) async {
    var userModel = await _homeRepository.getGitHubUser(user);

    if (userModel.name == null) {
      return UserGitHubModel(
          login: "login not found",
          name: "username not found",
          avatarUrl:
              "data:image/png;base64,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");
    }
    return userModel;
  }

  Future<List<UserReposModel>> getRepos(String user) async {
    var userRepoModel =
        await _homeRepository.getReposOfGitHubUser(user.toLowerCase());

    return userRepoModel;
  }
}
