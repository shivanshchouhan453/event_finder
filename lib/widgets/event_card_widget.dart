import 'package:event_finder/models/event_model.dart';
import 'package:event_finder/screens/event_detail_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => EventDetailScreen(event: event)),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(event.imageUrl),
            ListTile(
              title: Text(event.title),
              subtitle: Text("${event.date} • ${event.time}"),
              trailing: Text(event.distance),
            ),
          ],
        ),
      ),
    );
  }
}
