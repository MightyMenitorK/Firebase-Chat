import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new message to the messages collection
  Future<void> addMessage({
    required String text,
    required String userId,
  }) async {
    try {
      await _firestore.collection('messages').add({
        'text': text,
        'userId': userId,
        'createdAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error adding message: $e');
    }
  }

  // Retrieve messages from the messages collection, ordered by creation time
  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // Get a single message by its document ID
  Future<DocumentSnapshot> getMessageById(String id) async {
    try {
      return await _firestore.collection('messages').doc(id).get();
    } catch (e) {
      throw Exception('Error fetching message: $e');
    }
  }

  // Delete a message by its document ID
  Future<void> deleteMessage(String id) async {
    try {
      await _firestore.collection('messages').doc(id).delete();
    } catch (e) {
      throw Exception('Error deleting message: $e');
    }
  }

  // Update a message by its document ID
  Future<void> updateMessage(String id, String newText) async {
    try {
      await _firestore.collection('messages').doc(id).update({
        'text': newText,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw Exception('Error updating message: $e');
    }
  }
}

