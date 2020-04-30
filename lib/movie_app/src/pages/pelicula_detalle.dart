import 'package:flutter/material.dart';
import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _crearAppBar(pelicula),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _posterTitulo(pelicula, context),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
            _descripcion( pelicula ),
          ]),
        )
      ],
    ));
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            "${pelicula.title}",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          background: FadeInImage(
              image: NetworkImage(pelicula.getBackGroundImg()),
              placeholder: AssetImage("assets/img/loading.gif"),
              fadeInDuration: Duration(milliseconds: 150),
              fit: BoxFit.cover)),
    );
  }

  Widget _posterTitulo(Pelicula pelicula, context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150,
              ),
            ),
            SizedBox(width: 15.0),
            Flexible(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    pelicula.title,
                    style: TextStyle(fontSize: 25),
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  Text(
                    pelicula.originalTitle,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Divider(),
                  Row(
                    
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.deepOrangeAccent),
                      Text("${pelicula.voteAverage} / 10", style: Theme.of(context).textTheme.subhead),
                      SizedBox(width: 10),
                      Icon(Icons.public, color: Colors.greenAccent),
                      Text("${pelicula.popularity}", style: Theme.of(context).textTheme.subhead),
                   
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _descripcion(Pelicula pelicula) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,),
      

    );
  }
}
