import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';



class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

  
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.only(top: 10),
            child: Swiper(
          
          itemBuilder: (BuildContext context, int index){

            return ClipRRect (
            
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
                image: NetworkImage( peliculas[index].getPosterImg()),
                placeholder: AssetImage("assets/img/loading.gif"), 
                fit: BoxFit.fill),
            );            
          },
          itemCount: peliculas.length,
         
          layout: SwiperLayout.DEFAULT,
        ),
    );
  }
}