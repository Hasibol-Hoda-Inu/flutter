import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class matchUpdate extends StatelessWidget {
  const matchUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cricket').doc("VcC5Sy0AS0jCIvv9UBTf").snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'),
            );
          }
          else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'),
            );
          }

          final score = snapshot.data!;

          return Center(
            child: Column(
              children: [
                const SizedBox(height: 56,),
                Text(
                  score.get('match_name'),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 48,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          score.get('team_a'),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          score.get('score_of_team_a'),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const Text('vs'),
                    Column(
                      children: [
                        Text(
                          score.get('team_b'),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          score.get('score_of_team_b'),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
