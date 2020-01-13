import 'package:flutter/material.dart';
import 'package:themoviedb_app/src/models/movie.dart';

class CardReel extends StatelessWidget {
  final List<Movie> movies;
  final Function loadNextPage;

  CardReel({@required this.movies, @required this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.3
    );
    pageController.addListener(() {
      if (pageController.position.pixels >= pageController.position.maxScrollExtent - 300) {
        loadNextPage();
      }
    });

    return Container(
      height: screenSize.height * 0.24,
      child: PageView.builder(
        controller: pageController,
        pageSnapping: false,
        itemCount: movies.length,
        itemBuilder: (context, i) {
          return _buildCard(context, movies[i]);
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, Movie movie) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Column(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage('lib/images/loading.gif'),
              image: NetworkImage(movie.getPosterUrl()),
              fit: BoxFit.contain,
              height: screenSize.height * 0.21,
            ),
            SizedBox(height: 3.0,),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );
  }

  // List<Widget> _buildCards(BuildContext context) {
  //   final screenSize = MediaQuery.of(context).size;

  //   return movies.map((movie) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 10.0),
  //       child: Column(
  //         children: <Widget>[
  //           FadeInImage(
  //             placeholder: AssetImage('lib/images/loading.gif'),
  //             image: NetworkImage(movie.getPosterUrl()),
  //             fit: BoxFit.contain,
  //             height: screenSize.height * 0.21,
  //           ),
  //           SizedBox(height: 3.0,),
  //           Text(
  //             movie.title,
  //             overflow: TextOverflow.ellipsis,
  //             style: Theme.of(context).textTheme.caption,
  //           ),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
