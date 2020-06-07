import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gobarber/app/modules/home/models/githubReposModel.dart';
import 'package:gobarber/app/modules/home/pages/repos/repos_controller.dart';

class ReposPage extends StatefulWidget {
  final String user;

  const ReposPage({Key key, this.user = ""}) : super(key: key);

  @override
  _ReposPageState createState() => _ReposPageState();
}

class _ReposPageState extends ModularState<ReposPage, ReposController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuário ${widget.user}"),
      ),
      body: Observer(builder: (_) {
        return FutureBuilder<List<UserReposModel>>(
          future: controller.getReposOfUser(widget.user),
          builder: (context, snapshot) {
            var repos = snapshot.data;
            if (repos == null || repos.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: repos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        title: Text(repos[index].name),
                        subtitle: Text(repos[index].fullName),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
