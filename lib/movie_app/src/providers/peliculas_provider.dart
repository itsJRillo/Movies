import 'dart:convert';

import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';

import "package:http/http.dart" as http;

class PeliculasProvider {

  Future<List<Pelicula>> _procesarRes(Uri url) async {


    final resp = await http.get(url);

      final decodeData = json.decode(resp.body);

      final peliculasPopulares = new Peliculas.fromJsonList(decodeData["results"]);

      return peliculasPopulares.items;


  }



    String _apikey   = "4cfc5bbd8134d1f01ca455c7a21af7db";
    String _url      = "api.themoviedb.org";
    String _language = "es-ES";



   Future<List<Pelicula>> getEnCines() async {

     final url = Uri.https(_url, "3/movie/now_playing", {

       "api_key" : _apikey,
       "language": _language
       
         } );


    return await _procesarRes(url);

 

    }

    Future<List<Pelicula>> getPopulares() async {

      final url = Uri.https(_url, "3/movie/popular", {

        "api_key": _apikey,
        "language": _language

      } );

      return await _procesarRes(url);


      




    }


}