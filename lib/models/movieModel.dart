

class Movie{

  final String bannerPath;
  final String posterPath;
  final String title;
  final String description;
  final String rating;
  final String date;

  Movie({
    required this.date,
    required this.title,
    required this.rating,
    required this.bannerPath,
    required this.posterPath,
    required this.description,
});

  Map<String,dynamic> toJson(){
  return{
    'title': title,
    'date': date,
    'poster': posterPath,
    'banner': bannerPath,
    'description': description,
    'rating': rating,
  };
}

factory Movie.fromJson(Map<String,dynamic> json){
  return Movie(
    title : json['title'],
    description: json['description'],
    bannerPath: json['banner'],
    rating: json['rating'],
    posterPath: json['poster'],
    date: json['date'],
  );
}

}

