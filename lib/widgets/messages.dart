class Message {
  final String id; // Unique ID for the message
  final String text; // Content of the message
  final String userId; // ID of the user who sent the message
  final DateTime createdAt; // Timestamp of when the message was created

  Message({
    required this.id,
    required this.text,
    required this.userId,
    required this.createdAt,
  });

  // Convert a Message object to a Map (useful for Firestore or JSON storage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create a Message object from a Map (useful for Firestore or JSON retrieval)
  factory Message.fromMap(Map<String, dynamic> map, String documentId) {
    return Message(
      id: documentId,
      text: map['text'] ?? '',
      userId: map['userId'] ?? '',
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }
}

