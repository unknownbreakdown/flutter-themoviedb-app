import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:themoviedb_app/src/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //width: _screenSize.width,
      //height: _screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: screenSize.width * 0.8,
        itemHeight: screenSize.height * 0.5,
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            //borderRadius: BorderRadius.circular(3.0),
            child: FadeInImage(
              placeholder: AssetImage('lib/images/loading.gif'),
              image: NetworkImage(movies[index].getPosterUrl()),
              fit: BoxFit.contain,
            )
          );
        },
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
