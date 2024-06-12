import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';

class BookingModel extends ChangeNotifier {
  /// State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String? selectedTableId;
  String reservationTime = '12:00 PM';

  List<dynamic> tables = [];

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }

  Future<void> fetchTables(String restaurantId) async {
    final url = 'http://185.146.1.28:8000/api/reservations/all/restaurant/$restaurantId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      tables = responseData['reservations'];
      notifyListeners();
    } else {
      print('Failed to load tables: ${response.body}');
    }
  }

  Future<bool> makeReservation(String tableId, String reservationTime) async {
    final url = 'http://185.146.1.28:8000/api/reservations/make';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'table_id': tableId,
        'reservation_time': reservationTime,
      }),
    );

    return response.statusCode == 200;
  }
}
