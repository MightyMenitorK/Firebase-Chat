import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'new_message.dart';
import 'message_bubble.dart';
import 'constants.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Add log-out functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MessagesList(),
          ),
          const NewMessage(),
        ],
      ),
    );
  }
}

class MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(AppConstants.messagesCollection)
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final messages = snapshot.data?.docs ?? [];

        return ListView.builder(
          reverse: true, // To start from the bottom
          itemCount: messages.length,
          itemBuilder: (ctx, index) {
            final message = messages[index];
            return MessageBubble(
              message['text'],
              message['userId'],
              isMe: message['userId'] ==
                  FirebaseAuth.instance.currentUser?.uid,
            );
          },
        );
      },
    );
  }
}

