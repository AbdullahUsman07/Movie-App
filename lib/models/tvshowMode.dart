class TvShow {
  final String bannerPath;
  final String posterPath;
  final String title;
  final String description;
  final String rating;
  final String date;

  TvShow({
    required this.date,
    required this.title,
    required this.rating,
    required this.bannerPath,
    required this.posterPath,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'poster': posterPath,
      'banner': bannerPath,
      'description': description,
      'date': date,
      'rating': rating,
    };
  }

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      date: json['date'],
      title: json['title'],
      rating: json['rating'],
      bannerPath: json['banner'],
      posterPath: json['poster'],
      description: json['description'],
    );
  }
}
