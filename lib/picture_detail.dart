import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hubble_app_core/models.dart';
import 'package:hubble_app_core/usecases.dart';
import 'package:photo_view/photo_view.dart';

class PictureDetailPage extends StatelessWidget {
  final HubblePicture picture;
  final PictureDetailStore bloc;

  PictureDetailPage(this.picture, this.bloc);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(picture.name),
          actions: getActions(context),
        ),
        body: _body(),
      ),
    );
  }

  List<Widget> getActions(BuildContext context) {
    if (bloc.pictureDetails?.description != null) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => PictureInfoPage(
                        details: bloc.pictureDetails,
                      ),
                  fullscreenDialog: true),
            );
          },
        )
      ];
    } else {
      return <Widget>[];
    }
  }

  Widget _body() {
    if (bloc.isLoading) {
      return Center(
          child: CircularProgressIndicator(
        value: null,
      ));
    } else if (bloc.pictureDetails != null) {
      return PictureDetailWidget(bloc.pictureDetails);
    } else {
      return errorWidget();
    }
  }

  Widget errorWidget() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Error: ${bloc.error}"),
        RaisedButton(
          onPressed: () {
            bloc.load();
          },
          child: Text("Réessayer"),
        )
      ],
    ),
  );
}

class PictureDetailWidget extends StatelessWidget {
  final HubblePictureDetails details;

  PictureDetailWidget(this.details);

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      imageProvider: NetworkImage(details.url),
    );
  }
}

class PictureInfoPage extends StatelessWidget {
  final HubblePictureDetails details;

  const PictureInfoPage({Key key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infos"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Html(
              data: details.description,
              style: {"body": Style(fontSize: FontSize.larger)},
            ),
          ),
        ),
      ),
    );
  }
}
