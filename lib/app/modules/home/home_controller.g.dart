// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$gridScrollControllerAtom =
      Atom(name: '_HomeBase.gridScrollController');

  @override
  double get gridScrollController {
    _$gridScrollControllerAtom.context
        .enforceReadPolicy(_$gridScrollControllerAtom);
    _$gridScrollControllerAtom.reportObserved();
    return super.gridScrollController;
  }

  @override
  set gridScrollController(double value) {
    _$gridScrollControllerAtom.context.conditionallyRunInAction(() {
      super.gridScrollController = value;
      _$gridScrollControllerAtom.reportChanged();
    }, _$gridScrollControllerAtom,
        name: '${_$gridScrollControllerAtom.name}_set');
  }

  final _$postsAtom = Atom(name: '_HomeBase.posts');

  @override
  Stream<List<PostModel>> get posts {
    _$postsAtom.context.enforceReadPolicy(_$postsAtom);
    _$postsAtom.reportObserved();
    return super.posts;
  }

  @override
  set posts(Stream<List<PostModel>> value) {
    _$postsAtom.context.conditionallyRunInAction(() {
      super.posts = value;
      _$postsAtom.reportChanged();
    }, _$postsAtom, name: '${_$postsAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void updateGridScrollController(dynamic value) {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.updateGridScrollController(value);
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPosts() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getPosts();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }
}
