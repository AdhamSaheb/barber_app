import 'dart:convert';

import 'package:http/http.dart' as http;

class TimeService {
  final String apiUrl = "http://worldtimeapi.org/api/timezone/Asia/Jerusalem";

  Future<dynamic> getJLMTime() async {
    try {
      // _currentTime = await NTP.now();
      var result = await http.get(apiUrl);

      return DateTime.parse(json.decode(result.body)['datetime']).toLocal();
    } catch (error) {
      return DateTime.now().toLocal();
    }
  }
}
