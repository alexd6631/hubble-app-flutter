import 'dart:convert';

import 'package:http/http.dart';

import 'package:hubble_app_core/models.dart';
import 'package:hubble_app_core/repositories.dart';
import 'package:rxdart/rxdart.dart';

final _retryForever = (error, stack) {
  print("hey $error");
  return Stream.value("").delay(Duration(seconds: 5));
};

class PictureRepositoryImpl implements PictureRespository {
  final HubbleClient client;

  PictureRepositoryImpl(this.client);

  var _cache = Map<String, HubblePictureDetails>();

  @override
  Stream<List<HubblePicture>> getPictures() => Rx.retryWhen(
        _fetchPictures,
        _retryForever,
      );

  Stream<List<HubblePicture>> _fetchPictures() {
    return Rx.range(0, 10)
        .asyncMap((page) => client.getPicturesList(page))
        .reduce((previous, element) => previous + element)
        .asStream();
  }

  @override
  Stream<HubblePictureDetails> getPictureDetail(String id) {
    final inCache = _cache[id];
    if (inCache != null) {
      return Stream.value(inCache);
    } else {
      return client
          .getPictureDetails(int.parse(id))
          .asStream()
          .doOnData((data) {
        _cache[id] = data;
      });
    }
  }
}

extension ThisOneIsForNico on String {
  String prefixHttps() => "https:$this";
}

class HubbleClient {
  final Client client;

  HubbleClient(this.client);

  Future<List<HubblePicture>> getPicturesList(int page) async {
    print("Fetching page $page");
    final resp =
        await client.get("http://hubblesite.org/api/v3/images/all?page=$page");
    print("Got body ${resp.body}");
    final body = json.decode(resp.body) as List<dynamic>;
    return body
        .map((e) => HubblePicture((b) => b
          ..id = e["id"].toString()
          ..name = e["name"]
          ..mission = e["mission"]))
        .toList();
  }

  Future<HubblePictureDetails> getPictureDetails(int id) async {
    print("Fetching details");
    final resp = await client.get("http://hubblesite.org/api/v3/image/$id");
    final body = json.decode(resp.body) as Map<String, dynamic>;
    print("Body = ${body.keys}");

    final imageFiles = body["image_files"] as List<dynamic>;
    print(imageFiles);

    return HubblePictureDetails((b) => b
      ..description = body["description"]
      ..url = ((body["image_files"][0]["file_url"] as String).prefixHttps()));
  }
}

PictureRespository defaultPictureRespository() =>
    PictureRepositoryImpl(HubbleClient(Client()));
