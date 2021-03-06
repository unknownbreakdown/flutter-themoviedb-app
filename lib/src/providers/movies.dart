import 'dart:async';
import 'dart:convert';

import 'package:themoviedb_app/src/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = 'ebb2d63b545cda81f85fbe3658c52e0b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _resultsPage = 0;
  bool _loading = false;
  List<Movie> _popularMovies = List();
  final _popularMoviesStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularMoviesStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularMoviesStreamController.stream; 


  void disposeStreams() {
    _popularMoviesStreamController?.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    
    return await buildList(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];
    _loading = true;
    _resultsPage++;
    final url = Uri.https(_url, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': _resultsPage.toString()});
    final movieList = await buildList(url);
    _popularMovies.addAll(movieList);
    popularSink(_popularMovies);
    _loading = false;

    return _popularMovies;
  }

  Future<List<Movie>> buildList(url) async {
    final httpResponse = await http.get(url);
    final jsonData = json.decode(httpResponse.body);
    List<Movie> movies = new List();

    if (jsonData['results'] != null) {
      for (var item in jsonData['results']) {
        final movie = new Movie.fromJsonMap(item);
        movies.add(movie);
      }
      return movies;
    } else {
      return null;
    }
  }

}
