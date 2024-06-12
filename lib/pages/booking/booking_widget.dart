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
    _model.fetchTables(restaurantId);
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
              Text(
                restaurant['name'] ?? 'Restaurant',
                style: FlutterFlowTheme.of(context).headlineSmall,
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
                          onChanged: (val) => setState(() => _model.choiceChipsValue = val?.firstOrNull),
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
              Expanded(
                child: Consumer<BookingModel>(
                  builder: (context, model, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(16.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: model.tables.length,
                      itemBuilder: (context, index) {
                        final table = model.tables[index];
                        return GestureDetector(
                          onTap: table['status'] == 'Available' ? () {
                            setState(() {
                              _model.selectedTableId = table['id'];
                            });
                          } : null,
                          child: Container(
                            decoration: BoxDecoration(
                              color: table['status'] == 'Available'
                                  ? Colors.white
                                  : table['status'] == 'Reserved'
                                  ? Colors.red
                                  : table['id'] == _model.selectedTableId
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Table ${table['tableNumber']}',
                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Inter',
                                  color: table['id'] == _model.selectedTableId
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
                      if (result) {
                        context.goNamed('Success');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to make reservation'),
                          ),
                        );
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
}
