import 'dart:io';

import 'package:barberias/barberia/model/photo.dart';
import 'package:barberias/barberia/repository/firebase_storage_repository.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/repository/auth_repository.dart';
import 'package:barberias/usuario/repository/cloud_firestore_api.dart';
import 'package:barberias/usuario/repository/cloud_firestore_repository.dart';
import 'package:barberias/usuario/ui/widgets/profile_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UsuarioBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos o Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase; //el objeto authStatus nos va a devolver el estado de la sesion

  //esto es un metodo que es un futuro que me devuelva un FirebaseUser
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos de uso de la app
  //1. SignIn a la aplicación Google
  Future<FirebaseUser>signIn() => _auth_repository.signInFirebase();

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updateBarberiaData(Photo photo) => _cloudFirestoreRepository.updateBarberiaData(photo);
  Stream<QuerySnapshot> photosListStream = Firestore.instance.collection(CloudFirestoreAPI().PHOTOS).snapshots();
  Stream<QuerySnapshot> get photosStream => photosListStream;
  List<ProfilePhoto> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot) => _cloudFirestoreRepository.buildMyPhotos(photosListSnapshot);

  Stream<QuerySnapshot> myPhotosListStream(String uid) =>
      Firestore.instance.collection(CloudFirestoreAPI().PHOTOS)
          .where("userOwner", isEqualTo: Firestore.instance.document("${CloudFirestoreAPI().USERS}/${uid}"))
          .snapshots();

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  signOut() =>_auth_repository.signOut();

  @override
  void dispose() {
    // TODO: implement dispose
  }

}