class UserReposModel {
  String name;
  String fullName;

  UserReposModel({this.name, this.fullName});

  UserReposModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['full_name'] = this.fullName;
    return data;
  }
}
