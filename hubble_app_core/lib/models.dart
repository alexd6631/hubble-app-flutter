import 'package:built_value/built_value.dart';

part 'models.g.dart';

abstract class HubblePicture implements Built<HubblePicture, HubblePictureBuilder> {
  String get id;
  String get name;
  String get mission;

  HubblePicture._();

  factory HubblePicture([void Function(HubblePictureBuilder) updates]) = _$HubblePicture;
}

abstract class HubblePictureDetails implements Built<HubblePictureDetails, HubblePictureDetailsBuilder>{
  @nullable String get description;
  String get url;

  HubblePictureDetails._();
  factory HubblePictureDetails([void Function(HubblePictureDetailsBuilder) updates]) = _$HubblePictureDetails;
}