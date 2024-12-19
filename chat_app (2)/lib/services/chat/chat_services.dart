class ChatServices {
//get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.insatnce;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }
  //send message

  //get message
}
