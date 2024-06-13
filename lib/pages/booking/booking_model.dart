import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';

class BookingModel extends ChangeNotifier {
  /// State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String? selectedTableId;
  String? reservationTime;
  List<dynamic> tables = [];
  FormFieldController<List<String>>? choiceChipsValueController;
  String? choiceChipsValue;
  Map<String, String> reservations = {};

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }

  Future<void> fetchTables(String restaurantId) async {
    final url = 'http://185.146.1.28:8000/api/tables/all/restaurant/$restaurantId';
    final cookies = await _getCookies();
    final response = await Dio().get(url, options: Options(headers: {'Cookie': cookies}));

    if (response.statusCode == 200 && response.data != null) {
      tables = (response.data['tables'] as List).map((table) {
        return {
          'id': table['id'],
          'status': (table['isReserved'] ?? false) ? 'Reserved' : 'Available',
          'numberOfSeats': table['numberOfSeats'],
          'tableNumber': table['TableNumber'],
        };
      }).toList();
      tables.sort((a, b) => a['tableNumber'].compareTo(b['tableNumber']));
      await fetchReservations(restaurantId);
    } else {
      print('Failed to load tables: ${response.data}');
    }
    notifyListeners();
  }

  Future<void> fetchReservations(String restaurantId) async {
    final url = 'http://185.146.1.28:8000/api/reservations/all/restaurant/$restaurantId';
    final cookies = await _getCookies();
    final response = await Dio().get(url, options: Options(headers: {'Cookie': cookies}));

    if (response.statusCode == 200 && response.data != null) {
      final reservationsData = response.data['reservations'];
      for (var reservation in reservationsData) {
        reservations[reservation['table']['id']] = reservation['reservationTime'];
      }
    } else {
      print('Failed to load reservations: ${response.data}');
    }
    notifyListeners();
  }

  Future<bool> makeReservation(String tableId, String reservationTime) async {
    final url = 'http://185.146.1.28:8000/api/reservations/make';
    final cookies = await _getCookies();
    final response = await Dio().post(
      url,
      options: Options(headers: {'Cookie': cookies, 'Content-Type': 'application/json'}),
      data: jsonEncode({
        'table_id': tableId,
        'reservation_time': reservationTime,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      throw Exception('Missing ID in request');
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (response.statusCode == 500) {
      throw Exception('Internal server error');
    } else {
      return false;
    }
  }

  Future<String> _getCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('jwt') ?? '';
    final rt = prefs.getString('RT') ?? '';
    return 'jwt=$jwt; RT=$rt';
  }
}
