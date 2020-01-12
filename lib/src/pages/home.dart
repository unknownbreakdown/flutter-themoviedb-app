import 'package:flutter/material.dart';
import 'package:themoviedb_app/src/providers/movies.dart';
import 'package:themoviedb_app/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
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
            _buildCardSwiper(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardSwiper() {
    final moviesProvider = MoviesProvider();
    moviesProvider.getNowPlaying();

    return CardSwiper(
      movies: [1,2,3,4,5,6],
    );
  }
}
