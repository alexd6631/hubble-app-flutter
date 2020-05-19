// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecases.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PictureDetailStore on PictureDetailStoreBase, Store {
  final _$pictureDetailsAtom =
      Atom(name: 'PictureDetailStoreBase.pictureDetails');

  @override
  ObservableFuture<HubblePictureDetails> get pictureDetails {
    _$pictureDetailsAtom.reportRead();
    return super.pictureDetails;
  }

  @override
  set pictureDetails(ObservableFuture<HubblePictureDetails> value) {
    _$pictureDetailsAtom.reportWrite(value, super.pictureDetails, () {
      super.pictureDetails = value;
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
pictureDetails: ${pictureDetails}
    ''';
  }
}
