import 'package:cloud_firestore/cloud_firestore.dart';

class MovieData {
  String? title;
  String? content;
  String? poster;
  bool? like;
  DocumentReference? reference;

  MovieData({this.title, this.content, this.poster, this.like, this.reference});

  MovieData.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        content = map['content'],
        poster = map['poster'],
        like = map['like'];

  MovieData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "MovieData<$title:$content>";
}
