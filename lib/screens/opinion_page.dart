import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpinionPage extends StatelessWidget {
  OpinionPage({super.key});

  final TextEditingController _opinionController = TextEditingController();

  // Function to save opinion to Firestore
  void _submitOpinion(BuildContext context) async {
    final opinionText = _opinionController.text;
    if (opinionText.isNotEmpty) {
      try {
        await FirebaseFirestore.instance.collection('opinions').add({
          'opinion': opinionText,
          'createdAt': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opinion submitted!')),
        );

        // Clear the text field after submission
        _opinionController.clear();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to submit opinion.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Your Opinions'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Express your thoughts about "Look Back":',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _opinionController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Write your opinion here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _submitOpinion(context),
              child: const Text('Submit Opinion'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OpinionsListPage()),
                );
              },
              child: const Text('See What Others Think'),
            ),
          ],
        ),
      ),
    );
  }
}

class OpinionsListPage extends StatelessWidget {
  const OpinionsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What Others Think'),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('opinions')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading opinions.'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No opinions shared yet.'));
          }

          final opinions = snapshot.data!.docs;
          return ListView.builder(
            itemCount: opinions.length,
            itemBuilder: (context, index) {
              final opinionData =
                  opinions[index].data() as Map<String, dynamic>;
              final opinion = opinionData['opinion'] ?? 'No opinion available';

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(opinion),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
