import 'package:event_finder/models/event_model.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(event.imageUrl),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(event.category),
                  Text("${event.date} at ${event.time}"),
                  Text(event.location),
                  SizedBox(height: 12),
                  Text(event.description),
                  SizedBox(height: 20),
                  ElevatedButton(onPressed: () {}, child: Text("Get Tickets")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
