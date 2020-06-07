import 'package:flutter_modular/flutter_modular.dart';
import 'package:gobarber/app/modules/home/viewmodels/githubuser_viewmodel.dart';
import '../home/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import '../../app_module.dart';
import './repositories/home_repository_inteface.dart';
import 'pages/home/home_controller.dart';
import 'pages/home/home_page.dart';
import 'pages/repos/repos_controller.dart';
import 'pages/repos/repos_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReposController(i.get())),
        Bind((i) => HomeController(i.get())),
        Bind((i) => UserGitHubViewModel(i.get())),
        Bind<IHomeRepository>((i) => HomeRepository(AppModule.to.get<Dio>()))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/repos/:user',
            child: (_, args) => ReposPage(user: args.params["user"])),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
