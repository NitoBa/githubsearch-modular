import 'package:gobarber/app/modules/home/models/githubReposModel.dart';

import '../models/githubUser_model.dart';

abstract class IHomeRepository {
  Future<UserGitHubModel> getGitHubUser(String user);
  Future<List<UserReposModel>> getReposOfGitHubUser(String user);
}
