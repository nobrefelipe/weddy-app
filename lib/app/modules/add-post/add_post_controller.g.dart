// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPostController on _AddPostBase, Store {
  final _$tagsContentOpacityAtom =
      Atom(name: '_AddPostBase.tagsContentOpacity');

  @override
  double get tagsContentOpacity {
    _$tagsContentOpacityAtom.context
        .enforceReadPolicy(_$tagsContentOpacityAtom);
    _$tagsContentOpacityAtom.reportObserved();
    return super.tagsContentOpacity;
  }

  @override
  set tagsContentOpacity(double value) {
    _$tagsContentOpacityAtom.context.conditionallyRunInAction(() {
      super.tagsContentOpacity = value;
      _$tagsContentOpacityAtom.reportChanged();
    }, _$tagsContentOpacityAtom, name: '${_$tagsContentOpacityAtom.name}_set');
  }

  final _$tagsAtom = Atom(name: '_AddPostBase.tags');

  @override
  List<UserModel> get tags {
    _$tagsAtom.context.enforceReadPolicy(_$tagsAtom);
    _$tagsAtom.reportObserved();
    return super.tags;
  }

  @override
  set tags(List<UserModel> value) {
    _$tagsAtom.context.conditionallyRunInAction(() {
      super.tags = value;
      _$tagsAtom.reportChanged();
    }, _$tagsAtom, name: '${_$tagsAtom.name}_set');
  }

  final _$onClickGetPictureAsyncAction = AsyncAction('onClickGetPicture');

  @override
  Future<void> onClickGetPicture(dynamic context) {
    return _$onClickGetPictureAsyncAction
        .run(() => super.onClickGetPicture(context));
  }

  final _$addPostHasuraAsyncAction = AsyncAction('addPostHasura');

  @override
  Future<bool> addPostHasura(dynamic imagePath) {
    return _$addPostHasuraAsyncAction.run(() => super.addPostHasura(imagePath));
  }

  final _$_AddPostBaseActionController = ActionController(name: '_AddPostBase');

  @override
  void setTagsContentOpacity(dynamic value) {
    final _$actionInfo = _$_AddPostBaseActionController.startAction();
    try {
      return super.setTagsContentOpacity(value);
    } finally {
      _$_AddPostBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGuestToTags(dynamic guest) {
    final _$actionInfo = _$_AddPostBaseActionController.startAction();
    try {
      return super.addGuestToTags(guest);
    } finally {
      _$_AddPostBaseActionController.endAction(_$actionInfo);
    }
  }
}
