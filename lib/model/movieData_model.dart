import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MovieData {
  final String title;
  final String content;
  final String poster;
  final bool like;
  final DocumentReference reference;

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
