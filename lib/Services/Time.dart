import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TimeService {
  final String apiUrl = "http://worldtimeapi.org/api/timezone/Asia/Jerusalem";

  Future<dynamic> getJLMTime() async {
    try {
      // _currentTime = await NTP.now();
      var result = await http.get(apiUrl);
      final formatter = DateFormat(r'''yyyy-MM-ddThh:mm''');
      return formatter.parse(json.decode(result.body)['datetime']);
    } catch (error) {
      print('Error');
      return DateTime.now().toLocal();
    }
  }
}
