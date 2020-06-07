// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$userModelAtom = Atom(name: '_HomeControllerBase.userModel');

  @override
  UserGitHubModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserGitHubModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$getUserOnGitHubAsyncAction =
      AsyncAction('_HomeControllerBase.getUserOnGitHub');

  @override
  Future<dynamic> getUserOnGitHub(String user) {
    return _$getUserOnGitHubAsyncAction.run(() => super.getUserOnGitHub(user));
  }

  @override
  String toString() {
    return '''
userModel: ${userModel}
    ''';
  }
}
