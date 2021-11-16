import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  Task({this.id, this.content, this.done, this.createdAt});
  final String? id;
  final String? content;
  bool? done;
  final Timestamp? createdAt;

  factory Task.fromDocSnap(QueryDocumentSnapshot docSnap) {
    return Task(
      id: docSnap.id,
      content: docSnap.get('content'),
      done: docSnap.get('done'),
      createdAt: docSnap.get('created_at'),
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      'content': content,
      'done': done,
      'created_at': createdAt,
    };
  }

  void updateCheckoxDone() {

  }
}
