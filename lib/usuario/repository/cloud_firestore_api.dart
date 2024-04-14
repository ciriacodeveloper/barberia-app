import 'package:barberias/barberia/model/photo.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/ui/widgets/profile_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PHOTOS = "photos";

  final Firestore _db = Firestore.instance; //va a obtener la entidad del usuario y  la va a dejar disponibe para la entidad base de datos
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myfavoritePhotos': user.myFavoritePhotos,
      'lastSignIn': DateTime.now()
    }, merge: true); //esto es para que se aplique a la base de datos
  }

  Future<void> updateBarberiaData(Photo photo) async {
    CollectionReference refBarberia = _db.collection(PHOTOS);
    await _auth.currentUser().then((FirebaseUser user){
      refBarberia.add({
        'title': photo.name,
        'description': photo.description,
        'urlImage': photo.urlImage,
        'userOwner': _db.document("${USERS}/${user.uid}"),//este es un tipo de dato reference
      }).then((DocumentReference dr){
        dr.get().then((DocumentSnapshot snapshot){
          // lo que hará esto es devolverme el id de Barbershop, ademas necesito es ingrsar este id como una referencia y como un array
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myPhotos' : FieldValue.arrayUnion([_db.document("${PHOTOS}/${snapshot.documentID}")])
          });

        });
      });
    });

  }

  List<ProfilePhoto> buildMyPhotos(List<DocumentSnapshot> photosListSnapshot){
    List<ProfilePhoto> profilePhotos = List<ProfilePhoto>();
    photosListSnapshot.forEach((p) {
      profilePhotos.add(ProfilePhoto(
        Photo(name: p.data['title'],
            description: p.data['description'],
            urlImage: p.data['urlImage'],
        ),
      ));
    });

    return profilePhotos;
  }


}