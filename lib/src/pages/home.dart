import 'package:flutter/material.dart';
import 'package:themoviedb_app/src/providers/movies.dart';
import 'package:themoviedb_app/src/widgets/card_reel.dart';
import 'package:themoviedb_app/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  final _moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
    _moviesProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("The Movie DB App"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _implementCardSwiper(context),
            _implementCardReel(context),
          ],
        ),
      ),
    );
  }

  Widget _implementCardSwiper(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
      future: _moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            movies: snapshot.data,
          );
        } else {
          return Container(
            width: screenSize.width,
            height: screenSize.height * 0.5,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  _implementCardReel(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            "Popular Movies",
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: _moviesProvider.popularStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return CardReel(
                  movies: snapshot.data,
                  loadNextPage: _moviesProvider.getPopular,
                );
              } else {
                return Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
