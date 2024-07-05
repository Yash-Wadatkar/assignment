import 'package:assignment/features/home/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataSource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<UserModel>> getUsersFromDataSource() {
    return firebaseFirestore.collection('users').snapshots().map((snapshot) =>
        snapshot.docs
            .map((document) => UserModel.fromJson(document.data()))
            .toList());
  }

  Future<void> deleteDataFromSource(String email) async {
    try {
      // Query for the document with the specified email
      var querySnapshot = await firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      // Delete each document matching the query
      querySnapshot.docs.forEach((document) {
        document.reference.delete();
        print("Document with Email $email has been deleted successfully");
      });
    } catch (e) {
      print("Error deleting document: $e");
    }
  }

  Future<void> updateUserData(String email, UserModel updatedUser) async {
    try {
      // Query for the document with the specified email
      var querySnapshot = await firebaseFirestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      // Update each document matching the query
      querySnapshot.docs.forEach((document) {
        document.reference.update({
          'firstName': updatedUser.firstName,
          'lastName': updatedUser.lastName,
          // Add other fields to update as needed
        });
        print("Document with Email $email has been updated successfully");
      });
    } catch (e) {
      print("Error updating document: $e");
    }
  }
}
