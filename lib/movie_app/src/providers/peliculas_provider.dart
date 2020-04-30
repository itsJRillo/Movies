import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;

import 'package:jmapp/movie_app/src/modelos/pelicula_model.dart';


class PeliculasProvider {

  Future<List<Pelicula>> _procesarRes(Uri url) async {
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final peliculasPopulares =
        new Peliculas.fromJsonList(decodeData["results"]);

    return peliculasPopulares.items;
  }

  String _apikey = "4cfc5bbd8134d1f01ca455c7a21af7db";
  String _url = "api.themoviedb.org";
  String _language = "es-ES";
 

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();


  Function (List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream <List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  void dispose(){

    _popularesStreamController?.close();

  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, "3/movie/now_playing",
        {"api_key": _apikey, 
        "language": _language,
        
         
         });

    return await _procesarRes(url);
  }

  Future<List<Pelicula>> getPopulares() async {

    if(_cargando) return [];

    _cargando = true;

    _popularesPage++;


    final url = Uri.https(
        _url, "3/movie/popular", {"api_key": _apikey, "language": _language,"page": _popularesPage.toString()});

    final resp = await _procesarRes(url);


    _populares.addAll(resp);

    popularesSink(_populares);

    _cargando = false;

    return resp;
    
  }
}
