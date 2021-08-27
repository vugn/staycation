import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:formz/formz.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:staycation/data/api_base_helper.dart';
import 'package:staycation/data/blocs/form_bloc/form_bloc.dart';
import 'package:staycation/globals/config.dart';
import 'package:staycation/models/detail_page.dart';
import 'package:staycation/widgets/form/form.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class CheckoutPage extends StatefulWidget {
  late final DetailApi detailApi;
  CheckoutPage({required this.detailApi});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final DetailApi detailApi = widget.detailApi;
  late int subTotal;
  int tax = 10;
  late num grandTotal;

  bool showDatePicker = false;
  int _dateCount = 4;
  late String _range = DateFormat('d MMM').format(DateTime.now()).toString() +
      ' - ' +
      DateFormat('d MMM')
          .format(DateTime.now().add(Duration(days: _dateCount - 1)))
          .toString();

  late String _startDate =
      DateFormat('MM-dd-yyyy').format(DateTime.now()).toString();
  late String _endDate = DateFormat('MM-dd-yyyy')
      .format(DateTime.now().add(Duration(days: _dateCount - 1)))
      .toString();

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _range = DateFormat('dd MMM').format(args.value.startDate).toString() +
          ' - ' +
          DateFormat('dd MMM')
              .format(args.value.endDate ?? args.value.startDate)
              .toString();
      _startDate =
          DateFormat('MM-dd-yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('MM-dd-yyyy')
          .format(args.value.endDate ?? args.value.startDate)
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

  PageController _controller = PageController();
  int pageIndex = 1;

  late File _image = File('');
  final ImagePicker _picker = ImagePicker();

  void _imgFromGallery() async {
    final image = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    subTotal = detailApi.price * _dateCount;
    grandTotal = subTotal / tax + subTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/text_logo.png',
          width: 148,
          height: 39,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(pageIndex == 2 ? 0xFF1ABC9C : 0xFFFFFFFF),
                        border: Border.all(
                            color: Color(
                                pageIndex == 2 ? 0xFF1ABC9C : 0xFFE5E5E5))),
                    child: CircleAvatar(
                      foregroundColor: Color(0xFF898989),
                      backgroundColor:
                          Color(pageIndex == 2 ? 0xFF1ABC9C : 0xFFE5E5E5),
                      child: pageIndex == 2
                          ? Icon(Icons.check, color: Colors.white)
                          : Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 40,
                    color: Color(0xFFE5E5E5),
                  ),
                  Container(
                    width: 37,
                    height: 37,
                    child: CircleAvatar(
                      foregroundColor: Color(0xFF898989),
                      backgroundColor: Color(0xFFE5E5E5),
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: BlocProvider(
                  create: (_) => CheckoutFormBloc(),
                  child: BlocListener<CheckoutFormBloc, CheckoutFormState>(
                    listener: (context, state) {
                      if (state.status.isSubmissionSuccess) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(content: Text('Done')),
                          );
                      }
                      if (state.status.isSubmissionInProgress) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(content: Text('Submitting...')),
                          );
                      }
                    },
                    child: ExpandablePageView(
                      controller: _controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Text('Booking Information',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF152C5B)),
                                textAlign: TextAlign.center),
                            SizedBox(height: 3),
                            Text('Please fill up the blank fields below',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFFB0B0B0)),
                                textAlign: TextAlign.center),
                            SizedBox(height: 20),
                            Container(
                                width: 231,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "$baseUrl${detailApi.images[0].imageUrl}",
                                        width: 231,
                                        height: 133,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            SkeletonAnimation(
                                          shimmerColor: Colors.white54,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            width: 231,
                                            height: 133,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(detailApi.title,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF152C5B))),
                                            Row(
                                              children: [
                                                Text("${detailApi.city}, ",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xFFB0B0B0))),
                                                Text(detailApi.country,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xFFB0B0B0))),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("\$${detailApi.price}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF152C5B))),
                                            Text("/Night",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFFB0B0B0))),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )),
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
                                  color: Color(0xFFF5F6F8),
                                  borderRadius: BorderRadius.circular(4)),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _dateCount == 1
                                                ? _dateCount = 1
                                                : _dateCount--;
                                            showDatePicker = false;
                                            _range = DateFormat('d MMM')
                                                    .format(DateTime.now())
                                                    .toString() +
                                                ' - ' +
                                                DateFormat('d MMM')
                                                    .format(DateTime.now().add(
                                                        Duration(
                                                            days: _dateCount -
                                                                1)))
                                                    .toString();
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE74C3C),
                                          borderRadius:
                                              BorderRadius.circular(4))),
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
                                            _dateCount == 30
                                                ? _dateCount = 30
                                                : _dateCount++;
                                            showDatePicker = false;
                                            _range = DateFormat('d MMM')
                                                    .format(DateTime.now())
                                                    .toString() +
                                                ' - ' +
                                                DateFormat('d MMM')
                                                    .format(DateTime.now().add(
                                                        Duration(
                                                            days: _dateCount -
                                                                1)))
                                                    .toString();
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFF1ABC9C),
                                          borderRadius:
                                              BorderRadius.circular(4))),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.calendar_today,
                                        color: Color(0xFF152C5B)),
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
                                  showDatePicker = !showDatePicker;
                                });
                              },
                            ),
                            showDatePicker
                                ? SfDateRangePicker(
                                    onSelectionChanged: _onSelectionChanged,
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                    enablePastDates: false,
                                    maxDate: DateTime.now()
                                        .add(Duration(days: 30 - 1)),
                                    initialSelectedRange: PickerDateRange(
                                        DateTime.now(),
                                        DateTime.now().add(
                                            Duration(days: _dateCount - 1))),
                                  )
                                : Container(),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 231,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("First Name",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    firstNameForm(context),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text("Last Name",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    lastNameForm(context),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text("Email Address",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    emailForm(context),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text("Phone Number",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    phoneNumberForm(context),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 42,
                                        ),
                                        BlocBuilder<CheckoutFormBloc,
                                            CheckoutFormState>(
                                          buildWhen: (previous, current) {
                                            return previous.status !=
                                                current.status;
                                          },
                                          builder: (context, state) {
                                            return state.firstName.valid &&
                                                    state.lastName.valid &&
                                                    state.email.valid &&
                                                    state.phoneNumber.valid
                                                ? Center(
                                                    child: SizedBox(
                                                      width: 160,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              pageIndex = 2;
                                                            });
                                                            _controller
                                                                .jumpToPage(2);
                                                          },
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<Color>(Color(
                                                                      0xFF3252DF)),
                                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(
                                                                          3))),
                                                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(
                                                                  horizontal: 0,
                                                                  vertical:
                                                                      5))),
                                                          child: Text(
                                                              'Continue to Book',
                                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white))),
                                                    ),
                                                  )
                                                : Container();
                                          },
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 160,
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  pageIndex = 2;
                                                });
                                                _controller.jumpToPage(2);
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<Color>(
                                                          Color(0xFFF5F6F8)),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  3))),
                                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 0,
                                                          vertical: 5))),
                                              child: Text('Cancel',
                                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFB0B0B0)))),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    )
                                  ]),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Payment',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF152C5B)),
                                textAlign: TextAlign.center),
                            SizedBox(height: 3),
                            Text('Kindly follow the instructions below',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFFB0B0B0)),
                                textAlign: TextAlign.center),
                            Container(
                              margin: EdgeInsets.only(top: 32),
                              width: 314,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Transfer Pembayaran:',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF152C5B))),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Text('Tax $tax%',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF152C5B))),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text('Sub total: \$$subTotal USD',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF152C5B))),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Text('Total: \$$grandTotal USD',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF152C5B))),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '$baseUrl${detailApi.banks[0].imageUrl}',
                                            width: 64,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(detailApi.banks[0].bankName,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                  detailApi.banks[0].bankNumber,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(detailApi.banks[0].name,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '$baseUrl${detailApi.banks[1].imageUrl}',
                                            width: 74,
                                            height: 34,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(detailApi.banks[1].bankName,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                  detailApi.banks[1].bankNumber,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(detailApi.banks[1].name,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xFF152C5B))),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 44,
                            ),
                            Divider(
                              color: Colors.grey[500],
                            ),
                            Container(
                              width: 231,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Upload Bukti Transfer",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    InkWell(
                                      child: Container(
                                          height: 50,
                                          width: 9999,
                                          padding: EdgeInsets.only(left: 20),
                                          alignment: Alignment.centerLeft,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F6F8),
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                          child: Text(
                                              _image.path == ''
                                                  ? "Select Here ..."
                                                  : basename(_image.path),
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: _image.path == ''
                                                      ? Color(0xFFAFAFAF)
                                                      : Colors.black,
                                                  fontWeight:
                                                      FontWeight.w400))),
                                      onTap: _imgFromGallery,
                                    ),
                                    Text("Asal Bank",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    bankNameForm(context),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Text("Nama Pengirim",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF152C5B))),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    senderNameForm(context)
                                  ]),
                            ),
                            SizedBox(
                              height: 42,
                            ),
                            BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
                                builder: (context, state) {
                              return state.firstName.valid &&
                                      state.lastName.valid &&
                                      state.email.valid &&
                                      state.phoneNumber.valid &&
                                      state.senderName.valid &&
                                      state.bankName.valid &&
                                      _image.path != ''
                                  ? Center(
                                      child: SizedBox(
                                        width: 160,
                                        child: TextButton(
                                            onPressed: () async {
                                              print(
                                                  "Id Item: ${detailApi.id}\nStart Date: $_startDate\n End Date: $_endDate\n Duration: $_dateCount\n First Name: ${state.firstName.value}\n Last Name: ${state.lastName.value}\n Email: ${state.email.value}\n Phone Number: ${state.phoneNumber.value}\n Sender Name: ${state.senderName.value}\n Bank Name: ${state.bankName.value}\n Image Name: ${basename(_image.path)}\n");
                                              context
                                                  .read<CheckoutFormBloc>()
                                                  .add(FormSubmitted(
                                                      duration:
                                                          _dateCount.toString(),
                                                      endDate: _endDate,
                                                      startDate: _startDate,
                                                      idItem: detailApi.id,
                                                      image: _image));
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<Color>(
                                                        Color(0xFF3252DF)),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                3))),
                                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 5))),
                                            child: Text('Continue to Book',
                                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white))),
                                      ),
                                    )
                                  : Container();
                            }),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 160,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      pageIndex = 1;
                                    });
                                    _controller.jumpToPage(0);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(
                                          Color(0xFFF5F6F8)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(3))),
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                          EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 5))),
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFB0B0B0)))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _submit() {
  //   print('First Name: ' +
  //       _firstNameController.text +
  //       ', Last Name: ' +
  //       _lastNameController.text +
  //       ', Email Address: ' +
  //       _emailController.text +
  //       ', Phone Number: ' +
  //       _phoneNumberController.text +
  //       ', Days: $_dateCount');
  // }
}
