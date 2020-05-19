import 'models.dart';

abstract class PictureRespository {
  Stream<List<HubblePicture>> getPictures();

  Stream<HubblePictureDetails> getPictureDetail(String id);
}