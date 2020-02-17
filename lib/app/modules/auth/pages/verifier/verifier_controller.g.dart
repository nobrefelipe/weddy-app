// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifier_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VerifierController on _VerifierBase, Store {
  final _$errorMessageAtom = Atom(name: '_VerifierBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$checkLoginAsyncAction = AsyncAction('checkLogin');

  @override
  Future<bool> checkLogin() {
    return _$checkLoginAsyncAction.run(() => super.checkLogin());
  }

  final _$getWeddingByCodeAsyncAction = AsyncAction('getWeddingByCode');

  @override
  Future<void> getWeddingByCode(dynamic weddingCode) {
    return _$getWeddingByCodeAsyncAction
        .run(() => super.getWeddingByCode(weddingCode));
  }
}
