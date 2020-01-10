import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> movies;

  CardSwiper({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //width: _screenSize.width,
      //height: _screenSize.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.8,
        itemHeight: _screenSize.height * 0.5,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: new Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.cover,
            ),
          );
        },
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
