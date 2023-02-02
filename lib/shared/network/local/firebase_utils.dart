import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/movies.dart';

class DatabaseUtils {
  static CollectionReference<Results> getMovieCollection() {
    return FirebaseFirestore.instance
        .collection("watchList")
        .withConverter<Results>(
            fromFirestore: (snapshot, options) =>
                Results.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson());
  }

  static Future<void> addMovieToFirebase(Results results) {
    return getMovieCollection().doc("${results.id}").set(results);
  }

  static Stream<QuerySnapshot<Results>> getMovieFromFirebase() {
    return getMovieCollection().snapshots();
  }

  static Future<void> deleteMovieFromFirebase(int id) {
    return getMovieCollection().doc("$id").delete();
  }
}
