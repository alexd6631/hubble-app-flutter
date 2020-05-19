// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PictureDetailStore on PictureDetailStoreBase, Store {
  final _$isLoadingAtom = Atom(name: 'PictureDetailStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$pictureDetailsAtom =
      Atom(name: 'PictureDetailStoreBase.pictureDetails');

  @override
  HubblePictureDetails get pictureDetails {
    _$pictureDetailsAtom.reportRead();
    return super.pictureDetails;
  }

  @override
  set pictureDetails(HubblePictureDetails value) {
    _$pictureDetailsAtom.reportWrite(value, super.pictureDetails, () {
      super.pictureDetails = value;
    });
  }

  final _$errorAtom = Atom(name: 'PictureDetailStoreBase.error');

  @override
  dynamic get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(dynamic value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('PictureDetailStoreBase.load');

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
pictureDetails: ${pictureDetails},
error: ${error}
    ''';
  }
}
