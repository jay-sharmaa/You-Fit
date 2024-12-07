import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youfit/utils/Contants.dart';

final apiKey = Constants.apikey;
const baseUrl = 'https://work-out-api1.p.rapidapi.com/search';

class GetApiData {
  Future<List<Map<String, dynamic>>?> fetchWorkouts() async {
    final uri = Uri.parse('$baseUrl');

    final headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': 'work-out-api1.p.rapidapi.com',
    };

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final data = (jsonDecode(response.body) as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();
        print(data.runtimeType);
        // print(data[0]);
        return data;
      } else {
        throw Exception('API error: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch workouts: $error');
    }
  }

  void getApiData() async {
    try {
      final workouts = await fetchWorkouts();
      print(workouts?[0]['Equipment']);
    } catch (error) {
      print(error);
    }
  }
}
