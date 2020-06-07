import 'package:dio/dio.dart';
import 'package:gobarber/app/modules/home/models/githubReposModel.dart';
import 'package:gobarber/app/modules/home/models/githubUser_model.dart';
import './home_repository_inteface.dart';

class HomeRepository implements IHomeRepository {
  final Dio _dio;

  HomeRepository(this._dio);

  @override
  Future<UserGitHubModel> getGitHubUser(String user) async {
    var response = await _dio.get("https://api.github.com/users/$user");

    return UserGitHubModel.fromJson(response.data);
  }

  @override
  Future<List<UserReposModel>> getReposOfGitHubUser(String user) async {
    var response = await _dio.get("https://api.github.com/users/$user/repos");
    List<UserReposModel> repos = [];

    response.data.map((repo) {
      return repos.add(UserReposModel.fromJson(repo));
    }).toList();

    return repos;
  }
}
