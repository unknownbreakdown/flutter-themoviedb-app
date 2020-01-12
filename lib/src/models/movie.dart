class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  getPosterUrl() {
    if (posterPath == null) {
      return 'https://pngimage.net/wp-content/uploads/2018/06/no-image-available-png-3.png';
    } else {
      return 'https://image.tmdb.org/t/p/w600_and_h900_bestv2$posterPath';
    }
  }
}

// class Movies {
//   List<Movie> movies = new List();

//   Movies();

//   Movies.fromJsonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     for (var item in jsonList) {
//       final movie = new Movie.fromJsonMap(item);
//       movies.add(movie);
//     }
//   }
// }
