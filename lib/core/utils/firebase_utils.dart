import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';

class FirebaseUtils {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore:
              (snapshot, _) => UserModel.fromFireStore(snapshot.data()!),
          toFirestore: (user, options) => user.toFireStore(),
        );
  }

  static Future<void> addUserToFireStore(UserModel user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> getUserFromFireStore(String uId) async {
    var querySnapShot = await getUserCollection().doc(uId).get();
    return querySnapShot.data();
  }
}
