import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Pesquisa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Usuário no github",
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 60),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Pesquisar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: () {
                  String user = _textEditingController.text;
                  if (user.length > 0) controller.getUserOnGitHub(user);
                },
              ),
            ),
            Observer(
              builder: (_) {
                var user = controller.userModel;

                return user != null
                    ? Card(
                        child: ListTile(
                          leading: Image.network(user.avatarUrl),
                          title: Text(user.name),
                          subtitle: Text(user.login),
                          trailing: IconButton(
                            icon: Icon(Icons.send,
                                color: user.name == "username not found"
                                    ? Colors.grey
                                    : Colors.green),
                            onPressed: () {
                              if (user.name == "username not found")
                                return null;
                              Modular.to.pushNamed('/repos/${user.login}');
                            },
                          ),
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
