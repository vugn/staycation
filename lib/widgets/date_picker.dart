import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  static int dateCount = 4;

  static late String range =
      DateFormat('d MMM').format(DateTime.now()).toString() +
          ' - ' +
          DateFormat('d MMM')
              .format(DateTime.now().add(Duration(days: dateCount - 1)))
              .toString();
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  bool _showDatePicker = false;
  String _range = DatePicker.range;
  int _dateCount = DatePicker.dateCount;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _range = DateFormat('dd MMM').format(args.value.startDate).toString() +
          ' - ' +
          DateFormat('d MMM')
              .format(DateTime.now().add(Duration(days: _dateCount - 1)))
              .toString();

      _dateCount = int.parse(DateFormat('dd')
              .format(args.value.endDate ?? args.value.startDate)) -
          int.parse(DateFormat('dd').format(args.value.startDate)) +
          1;
      args.value.endDate != null
          ? _dateCount = args.value.startDate
                  .difference(args.value!.endDate)
                  .inDays
                  .abs() +
              1
          : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 14, bottom: 8),
          width: 231,
          alignment: Alignment.centerLeft,
          child: Text(
            'How long you will stay?',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF152C5B)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          width: 231,
          height: 45,
          decoration: BoxDecoration(
              color: Color(0xFFF5F6F8), borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _dateCount == 1 ? _dateCount = 1 : _dateCount--;
                        _showDatePicker = false;
                        _range = DateFormat('d MMM')
                                .format(DateTime.now())
                                .toString() +
                            ' - ' +
                            DateFormat('d MMM')
                                .format(DateTime.now()
                                    .add(Duration(days: _dateCount - 1)))
                                .toString();
                      });
                    },
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFFE74C3C),
                      borderRadius: BorderRadius.circular(4))),
              Text(
                '$_dateCount Night${_dateCount > 1 ? 's' : ''}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF152C5B)),
              ),
              Container(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _dateCount == 30 ? _dateCount = 30 : _dateCount++;
                        _showDatePicker = false;
                        _range = DateFormat('d MMM')
                                .format(DateTime.now())
                                .toString() +
                            ' - ' +
                            DateFormat('d MMM')
                                .format(DateTime.now()
                                    .add(Duration(days: _dateCount - 1)))
                                .toString();
                      });
                    },
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF1ABC9C),
                      borderRadius: BorderRadius.circular(4))),
            ],
          ),
        ),
        _dateCount == 30
            ? Container(
                margin: EdgeInsets.only(top: 2),
                width: 231,
                alignment: Alignment.centerLeft,
                child: Text(
                  '30 Days is max range',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE74C3C)),
                ),
              )
            : Container(),
        Container(
          margin: EdgeInsets.only(top: 24, bottom: 8),
          width: 231,
          alignment: Alignment.centerLeft,
          child: Text(
            'Pick a Date',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF152C5B)),
          ),
        ),
        InkWell(
          child: Container(
            margin: EdgeInsets.only(bottom: 14),
            width: 231,
            height: 45,
            decoration: BoxDecoration(
                color: Color(0xFFF5F6F8),
                borderRadius: BorderRadius.circular(4)),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.calendar_today, color: Color(0xFF152C5B)),
                Text(
                  '$_range',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF152C5B)),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Color(0xFFF5F6F8),
                ),
              ],
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            setState(() {
              _showDatePicker = !_showDatePicker;
            });
          },
        ),
        _showDatePicker
            ? SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                enablePastDates: false,
                maxDate: DateTime.now().add(Duration(days: 30 - 1)),
                initialSelectedRange: PickerDateRange(DateTime.now(),
                    DateTime.now().add(Duration(days: _dateCount - 1))),
              )
            : Container(),
      ],
    );
  }
}
