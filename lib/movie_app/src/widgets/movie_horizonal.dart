import 'package:flutter/material.dart';
import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';
import 'package:jmapp/movie_app/src/providers/peliculas_provider.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});
  
  
  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;
    
    return Container(

      height: _screenSize.height * 0.2,
      child: PageView(

        children: _tarjetas(),

      ),

    );
  }

  List<Widget>_tarjetas() {

    return peliculas.map((pelicula) {

        return Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Column(
            children: <Widget>[
                FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage("/assets/img/loading.gif"),
                )

            ],
          )
          ,
        );


    }).toList(); 
  }
}