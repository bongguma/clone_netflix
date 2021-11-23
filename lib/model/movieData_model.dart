class MovieData {
  final String title;
  final String content;
  final String poster;
  final bool like;

  MovieData.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        content = map['content'],
        poster = map['poster'],
        like = map['like'];

  // @override
  // String toString() => "MovieData<$title:$content>";
}
