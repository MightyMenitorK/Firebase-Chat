class Message {
  final String id;
  final String text;
  final String userId;
  final String userName;
  final String userImage;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.text,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.createdAt,
  });

  // Factory method to create a Message from a Firestore document
  factory Message.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Message(
      id: documentId,
      text: data['text'] ?? '',
      userId: data['userId'] ?? '',
      userName: data['userName'] ?? '',
      userImage: data['userImage'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Convert a Message object to a Map for saving to Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'createdAt': createdAt,
    };
  }
}

