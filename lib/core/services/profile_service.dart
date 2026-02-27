import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService {
  ProfileService._();

  static final ProfileService instance = ProfileService._();

  final DocumentReference<Map<String, dynamic>> _doc =
      FirebaseFirestore.instance.collection('profiles').doc('main');

  Future<Map<String, dynamic>?> getProfile() async {
    final snap = await _doc.get();
    return snap.data();
  }

  Future<void> updateProfile({
    required String name,
    required String phone,
    required int avatarIndex,
  }) async {
    await _doc.set(
      {
        'name': name,
        'phone': phone,
        'avatarIndex': avatarIndex,
        'updatedAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    );
  }

  Future<void> deleteProfile() async {
    await _doc.delete();
  }
}