import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hubble_app/picture_detail.dart';
import 'package:hubble_app_core/models.dart';
import 'package:hubble_app_core/repositories.dart';
import 'package:hubble_app_core/usecases.dart';
import 'package:provider/provider.dart';

class PictureListPage extends StatelessWidget {
  final ListPictureBloc bloc;

  const PictureListPage({Key key, @required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Hubble pictures"),
        ),
        body: StreamBuilder(
            stream: bloc.pictures,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.error != null) {
                return Center(
                  child: Text("Erreur de chargement"),
                );
              }
              if (data != null) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          bloc.filter.add(value);
                        },
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Rechercher"
                        ),
                      ),
                    ),
                    Expanded(
                        child:
                            Scrollbar(child: pictureListView(context, data))),
                  ],
                );
              } else {
                return showLoader();
              }
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget showLoader() => Center(
          child: CircularProgressIndicator(
        value: null,
      ));

  Widget pictureListView(BuildContext context, List<HubblePicture> pictures) =>
      ListView.builder(
        itemCount: pictures.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(pictures[index].name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PictureDetailPage(
                    pictures[index],
                    PictureDetailStore(
                      pictures[index].id,
                      context.watch<PictureRespository>(),
                    )),
              ),
            );
          },
        ),
      );
}

class CupertinoPictureListPage extends StatelessWidget {
  final ListPictureBloc bloc;

  const CupertinoPictureListPage({Key key, @required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // the App.build method, and use it to set our appbar title.
          middle: Text("Hubble pictures"),
        ),
        child: StreamBuilder(
            stream: bloc.pictures,
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.error != null) {
                return Center(
                  child: Text("Erreur de chargement"),
                );
              }
              if (data != null) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                        onChanged: (value) {
                          bloc.filter.add(value);
                        },
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Expanded(
                        child:
                            Scrollbar(child: pictureListView(context, data))),
                  ],
                );
              } else {
                return showLoader();
              }
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget showLoader() => Center(
        child: CupertinoActivityIndicator(),
      );

  Widget pictureListView(BuildContext context, List<HubblePicture> pictures) =>
      ListView.separated(
        itemCount: pictures.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(8),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 40),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(pictures[index].name)),
          ),
        ),
        separatorBuilder: (_, i) => Divider(),
      );
}
