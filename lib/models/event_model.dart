class Event {
  final int id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final String distance;
  final String description;

  Event({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.distance,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    final parsedId = int.tryParse(json['id']?.toString() ?? '') ?? 0;

    return Event(
      id: parsedId,
      title: json['title']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      distance: json['distance']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
}
