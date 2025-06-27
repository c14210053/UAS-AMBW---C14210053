import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  String selectedEmoji = '😊';
  final noteController = TextEditingController();

  void saveMood() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection('moods').add({
      'uid': user.uid,
      'emoji': selectedEmoji,
      'note': noteController.text,
      'timestamp': Timestamp.now(),
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Mood")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedEmoji,
              items: ['😊', '😔', '😡', '😢', '😍'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) => setState(() => selectedEmoji = value!),
            ),
            TextField(
              controller: noteController,
              decoration: const InputDecoration(labelText: "Catatan"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: saveMood, child: const Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
