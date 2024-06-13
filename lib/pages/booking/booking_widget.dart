import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'booking_model.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({
    super.key,
    required this.restaurant,
  });

  final Map<String, dynamic> restaurant;

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  late BookingModel _model;
  late String restaurantId;
  late Map<String, dynamic> restaurant;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = Provider.of<BookingModel>(context, listen: false);
    restaurant = widget.restaurant['restaurant'];
    restaurantId = restaurant['id'];
    _fetchTables();
  }

  Future<void> _fetchTables() async {
    await _model.fetchTables(restaurantId);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Booking',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22.0,
            ),
          ),
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 5),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9E9E9),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xFFE9E9E9),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  restaurant['image_urls'][0],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant['name'],
                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Icon(
                                          Icons.phone,
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      Text(
                                        restaurant['contact'],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          fontSize: 11,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Icon(
                                          Icons.location_pin,
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      Text(
                                        restaurant['address'],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Inter',
                                          fontSize: 11,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 1),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Book',
                                      options: FFButtonOptions(
                                        width: 80,
                                        height: 30,
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        iconPadding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                        color: Colors.black,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        elevation: 3,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 4)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 0),
                child: Wrap(
                  spacing: 0,
                  runSpacing: 0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 32),
                        child: FlutterFlowChoiceChips(
                          options: [
                            ChipData('12:00 PM'),
                            ChipData('12:30 PM'),
                            ChipData('1:00 PM'),
                            ChipData('1:30 PM'),
                            ChipData('2:00 PM'),
                            ChipData('2:30 PM')
                          ],
                          onChanged: (val) {
                            setState(() {
                              _model.choiceChipsValue = val?.firstOrNull;
                            });
                            _fetchTables(); // Ensure this is called to fetch updated table information
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Colors.black,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          chipSpacing: 12,
                          rowSpacing: 24,
                          multiselect: false,
                          alignment: WrapAlignment.spaceBetween,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                                [],
                              ),
                          wrapped: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Choose Table',
                style: FlutterFlowTheme.of(context).headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusIndicator(context, Colors.white, 'Available'),
                    _buildStatusIndicator(context, Colors.black, 'Selected'),
                    _buildStatusIndicator(context, Colors.red.shade700, 'Reserved'),
                  ],
                ),
              ),
              Expanded(
                child: Consumer<BookingModel>(
                  builder: (context, model, child) {
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: model.tables.length,
                      itemBuilder: (context, index) {
                        final table = model.tables[index];
                        final isReserved = model.reservations[table['id']] == model.choiceChipsValue;
                        return GestureDetector(
                          onTap: () {
                            if (!isReserved) {
                              setState(() {
                                _model.selectedTableId = table['id'];
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isReserved
                                  ? Colors.red.shade700
                                  : (_model.selectedTableId == table['id'] ? Colors.black : Colors.white),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                'Table ${table['tableNumber']}',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Inter',
                                  color: isReserved || _model.selectedTableId == table['id']
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.selectedTableId != null) {
                      final result = await _model.makeReservation(
                        _model.selectedTableId!,
                        _model.choiceChipsValue ?? '12:00 PM',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result ? 'Reservation was made successfully.' : 'Failed to make reservation.'),
                        ),
                      );
                      if (result) {
                        context.goNamed('Success');
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a table'),
                        ),
                      );
                    }
                  },
                  text: 'Make Reservation',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 52.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(BuildContext context, Color color, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Inter',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
      ],
    );
  }
}
