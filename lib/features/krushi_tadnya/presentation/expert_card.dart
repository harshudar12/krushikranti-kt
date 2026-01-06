import 'package:flutter/material.dart';

class ExpertCard extends StatelessWidget {
  final String name;
  final String specialty;

  const ExpertCard({super.key, required this.name, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Krushi Tadnya", style: TextStyle(fontWeight: FontWeight.bold)), //
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/expert_placeholder.png')), //
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 16)), //
                    Text(specialty, style: TextStyle(color: Colors.green)), //
                  ],
                ),
                Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Chat Screen
                  },
                  icon: Icon(Icons.chat),
                  label: Text("Chat"), //
                )
              ],
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                // Logic for "Request Visit"
              },
              child: const Text("Request Farm Visit"),
            )
          ],
        ),
      ),
    );
  }
}