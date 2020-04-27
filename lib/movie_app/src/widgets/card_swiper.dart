import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';



class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

  final _screenSize = MediaQuery.of(context).size;


    return Container(
      padding: EdgeInsets.only(top: 10),
            child: Swiper(
          
          itemBuilder: (BuildContext context, int index){

            return new ClipRRect (

            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
                image: NetworkImage( peliculas[index].getPosterImg()),
                placeholder: AssetImage("assets/img/no-image.jpg"), 
                fit: BoxFit.fill),
            );            
          },
          itemCount: peliculas.length,
          itemWidth: _screenSize.width,
          itemHeight: _screenSize.height,
          layout: SwiperLayout.STACK,
        ),
    );
  }
}