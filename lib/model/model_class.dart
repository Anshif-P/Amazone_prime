class movies {
  final String title;
  final String? backdropPath;
  final String overView;
  final String? posterPath;
  final String releaseDate;
  final dynamic voteAverage;

  movies({
    required this.title,
    required this.backdropPath,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory movies.fromMap(Map<String, dynamic> json) {
    return movies(
      title: json['title'] ?? json['name'],
      backdropPath: json['backdrop_path'],
      overView: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? json['first_air_date'],
      voteAverage: json['vote_average'],
    );
  }
}
