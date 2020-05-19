import 'dart:async';

import 'package:hubble_app_core/models.dart';
import 'package:hubble_app_core/repositories.dart';
import 'package:hubble_app_core/usecases.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  group("Usecases test", () {
    test("ListPictureBloc test", () async {
      final mockRepo = MockRepo();

      when(mockRepo.getPictures()).thenAnswer(
        (realInvocation) => Stream.value(
          [
            HubblePicture((b) {
              b.id = "1";
              b.name = "jupiter";
              b.mission = "test";
            }),
            HubblePicture((b) {
              b.id = "2";
              b.name = "nebula";
              b.mission = "test";
            }),
          ],
        ),
      );

      final bloc = ListPictureBloc(mockRepo);
      var history = <List<HubblePicture>>[];

      bloc.pictures.listen((event) {
        history.add(event);
      });

      bloc.filter.add("nebula");

      await Future.delayed(Duration(seconds: 0)); //yield execution
      final idsHistory = history.map((pics) => pics.map((p) => p.id));

      expect(idsHistory, [
        ["1", "2"],
        ["2"]
      ]);
    });

    test("PictureDetailsStore test", () async {
      final details = HubblePictureDetails(
        (b) => b
          ..url = "http://foobar"
          ..description = "",
      );
      final mockRepo = MockRepo();
      when(mockRepo.getPictureDetail("42")).thenAnswer(
        (realInvocation) => Stream.value(details),
      );

      final store = PictureDetailStore("42", mockRepo);
      store.load();
      expect(store.pictureDetails.status, mobx.FutureStatus.pending);
      await Future.delayed(Duration(seconds: 0));
      expect(store.pictureDetails.status, mobx.FutureStatus.fulfilled);
      expect(store.pictureDetails.value, details);
    });
  });
}

class MockRepo extends Mock implements PictureRespository {}
