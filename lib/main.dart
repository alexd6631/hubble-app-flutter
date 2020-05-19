import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hubble_app/picture_list.dart';
import 'package:hubble_app_core/hubble_app_core.dart';
import 'package:hubble_app_core/models.dart';
import 'package:hubble_app_core/repositories.dart';
import 'package:hubble_app_core/usecases.dart';
import 'package:hubble_app_http/hubble_app_http.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PictureRespository>(
          create: (ctx) => defaultPictureRespository(),
        ),
        Provider<ListPictureBloc>(
          create: (ctx) => ListPictureBloc(ctx.read<PictureRespository>()),
        )
      ],
      child: buildMaterialApp(),
    );
  }

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: testFromLibrary(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      home: Consumer<ListPictureBloc>(
        builder: (_, b, __) => PictureListPage(bloc: b),
      ),
    );
  }

  Widget buildCupertino() {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: Colors.blue,
        //brightness: Brightness.dark
      ),
      home: Consumer<ListPictureBloc>(
        builder: (_, b, __) => CupertinoPictureListPage(bloc: b),
      ),
    );
  }
}

class MockRepository implements PictureRespository {
  @override
  Stream<List<HubblePicture>> getPictures() => Stream.value(<HubblePicture>[
        HubblePicture((b) {
          b.id = "test";
          b.name = "test";
          b.mission = "test";
        })
      ]);

  @override
  Stream<HubblePictureDetails> getPictureDetail(String id) {
    // TODO: implement getPictureDetail
    throw UnimplementedError();
  }
}
