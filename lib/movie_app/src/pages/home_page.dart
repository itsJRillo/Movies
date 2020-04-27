import 'package:flutter/material.dart';

import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';
import 'package:jmapp/movie_app/src/providers/peliculas_provider.dart';
import 'package:jmapp/movie_app/src/widgets/card_swiper.dart';
import 'package:jmapp/movie_app/src/widgets/movie_horizonal.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  

  @override
  Widget build(BuildContext context) {
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
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {

       if (snapshot.hasData ){

         return CardSwiper(peliculas: snapshot.data);

       } else {
         return  Container(
           height: 150,
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
          children: <Widget>[
            Text(
              "Populares",
              style: Theme.of(context).textTheme.subhead,
            ),
            FutureBuilder(
              future: peliculasProvider.getPopulares(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              

              if ( snapshot.hasData ){

                return MovieHorizontal(peliculas: snapshot.data);
              } else {


                 return CircularProgressIndicator();

              }

              },
            )
          ],
        ));
  }
}


