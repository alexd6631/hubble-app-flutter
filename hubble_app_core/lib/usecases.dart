import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';

import 'repositories.dart';
import 'models.dart';

part 'usecases.g.dart';

class ListPictureBloc {
  final PictureRespository pictureRespository;
  final filter = BehaviorSubject<String>();
  Stream<List<HubblePicture>> _pictures;

  ListPictureBloc(this.pictureRespository) {
    filter.add("");
    _pictures = _getPictures(filter).asBroadcastStream();
  }

  Stream<List<HubblePicture>> get pictures => _pictures;

  Stream<List<HubblePicture>> _getPictures(Stream<String> filter) =>
      Rx.combineLatest2(
        pictureRespository.getPictures(),
        filter,
        (List<HubblePicture> pics, String f) {
          final fLower = f.toLowerCase();
          if (f.isNotEmpty) {
            return pics
                .where((p) => p.name.toLowerCase().contains(fLower))
                .toList();
          } else {
            return pics;
          }
        },
      );
}

class PictureDetailStore = PictureDetailStoreBase with _$PictureDetailStore;

abstract class PictureDetailStoreBase with Store {
  final String pictureId;
  final PictureRespository respository;

  @observable
  ObservableFuture<HubblePictureDetails> pictureDetails;

  PictureDetailStoreBase(this.pictureId, this.respository) {
    load();
  }

  @action
  load() async {
    pictureDetails =
        ObservableFuture(respository.getPictureDetail(pictureId).first);
  }
}
