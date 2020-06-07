class UserGitHubModel {
  String login;
  String avatarUrl;
  String name;

  UserGitHubModel({this.login, this.avatarUrl, this.name});

  UserGitHubModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    return data;
  }
}
