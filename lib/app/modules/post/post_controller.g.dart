// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostController on _PostBase, Store {
  final _$postAtom = Atom(name: '_PostBase.post');

  @override
  PostModel get post {
    _$postAtom.context.enforceReadPolicy(_$postAtom);
    _$postAtom.reportObserved();
    return super.post;
  }

  @override
  set post(PostModel value) {
    _$postAtom.context.conditionallyRunInAction(() {
      super.post = value;
      _$postAtom.reportChanged();
    }, _$postAtom, name: '${_$postAtom.name}_set');
  }

  final _$getPostAsyncAction = AsyncAction('getPost');

  @override
  Future<dynamic> getPost(dynamic postUID) {
    return _$getPostAsyncAction.run(() => super.getPost(postUID));
  }
}
