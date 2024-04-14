import 'package:barberias/barberia/model/photo.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/repository/cloud_firestore_api.dart';
import 'package:barberias/usuario/ui/widgets/profile_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreRepository{
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(User user) async => _cloudFirestoreAPI.updateUserData(user);
  Future<void> updateBarberiaData(Photo photo) => _cloudFirestoreAPI.updateBarberiaData(photo);
  List<ProfilePhoto> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot) => _cloudFirestoreAPI.buildMyPhotos(photosListSnapshot);

  }