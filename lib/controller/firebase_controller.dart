import 'package:clone_netflix/model/movie_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  List<MovieData>? movieList = [];
  // List<MovieData> get movieList => _movieList!;

  readMovieDataList() {
    Firestore.instance.collection('movie').getDocuments().then((snapshot) {
      movieList = snapshot.documents
          .map((movieData) => MovieData.fromSnapshot(movieData))
          .toList();
    });
    update();
  }

  void changeMovieLike(int currentPage) {
    Firestore.instance
        .collection('movie')
        .document('movie${currentPage + 1}')
        .updateData({'like': true});

    movieList = readMovieDataList();
    update();
  }
}
