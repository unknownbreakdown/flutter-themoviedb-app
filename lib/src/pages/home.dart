import 'package:flutter/material.dart';
import 'package:themoviedb_app/src/providers/movies.dart';
import 'package:themoviedb_app/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
  final _moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            _buildCardSwiper(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSwiper(BuildContext context) {
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
}
