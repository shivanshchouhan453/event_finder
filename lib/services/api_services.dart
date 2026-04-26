import 'dart:convert';

import 'package:event_finder/core/key.dart';
import 'package:http/http.dart' as http;

import '../models/event_model.dart';

class ApiService {
  static const String url = AppKey.url;

  static Future<List<Event>> fetchEvents() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to load events (${response.statusCode}): ${response.body}',
        );
      }

      final decodedBody = json.decode(response.body);
      if (decodedBody is! List) {
        throw Exception('Invalid API response: expected a list of events.');
      }

      return decodedBody.map<Event>((item) {
        if (item is! Map<String, dynamic>) {
          throw Exception('Invalid event item format: $item');
        }
        return Event.fromJson(item);
      }).toList();
    } on FormatException catch (error) {
      throw Exception('Could not parse events response: $error');
    } on http.ClientException catch (error) {
      throw Exception('Network error while loading events: $error');
    } catch (error) {
      throw Exception('Unable to load events: $error');
    }
  }
}
