import 'package:flutter/material.dart';

import 'package:jmapp/movie_app/src/providers/peliculas_provider.dart';
import 'package:jmapp/movie_app/src/widgets/card_swiper.dart';
import 'package:jmapp/movie_app/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();



  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text("Películas"),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[_swiperTarjetas(), _footer(context)],
      )),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Populares",
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            StreamBuilder(
              stream: peliculasProvider.popularesStream,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal( peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ));
  }
}
