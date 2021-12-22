import 'package:cloud_firestore/cloud_firestore.dart';

enum ServiceName {
  /* movie 전체 데이터 */
  MOVIE,

  /* movie 안에 content 데이터 */
  CONTENT,

  /* movie 안에 like 데이터 */
  LIKE,

  /* movie 안에 poster 데이터 */
  POSTER,

  /* movie 안에 title 데이터 */
  TITLE,
}

dynamic ConnectedService(serviceName) {
  var stream;

  switch (serviceName) {
    case ServiceName.MOVIE:
      stream = Firestore.instance.collection('movie').snapshots();
      break;

    case ServiceName.CONTENT:
      stream = Firestore.instance
          .collection('movie')
          .where('content', isEqualTo: true)
          .snapshots();
      break;

    case ServiceName.LIKE:
      stream = Firestore.instance
          .collection('movie')
          .where('like', isEqualTo: true)
          .snapshots();
      break;

    case ServiceName.POSTER:
      stream = Firestore.instance
          .collection('movie')
          .where('poster', isEqualTo: true)
          .snapshots();
      break;

    case ServiceName.TITLE:
      stream = Firestore.instance
          .collection('movie')
          .where('title', isEqualTo: true)
          .snapshots();
      break;
  }
  return stream;
}
