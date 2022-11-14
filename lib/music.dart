class music {
  final String title;
  final String image;
  final String artist_name;
  final double duration;

  music(
      {required this.title,
      required this.image,
      required this.duration,
      required this.artist_name});

  factory music.fromJson(dynamic json) {
    return music(
        title: json['title'] as String,
        artist_name: json['artists'][0]['name'] as String,
        image: json['thumbnail'] as String,
        duration: json['duration'] as double);
  }
  static List<music> musicsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return music.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Music {title: $title, artist_name: $artist_name, image: $image, duration: $duration}';
  }
}
