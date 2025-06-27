import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_mood_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_logged_in', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final moodsRef = FirebaseFirestore.instance.collection('moods').where('uid', isEqualTo: user?.uid);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Journal"),
        actions: [
          IconButton(onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: moodsRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              return ListTile(
                leading: Text(data['emoji'] ?? '❓'),
                title: Text(data['note'] ?? ''),
                subtitle: Text(data['timestamp'].toDate().toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddMoodScreen())),
      ),
    );
  }
}