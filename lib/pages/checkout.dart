import 'package:flutter/material.dart';
import 'package:staycation/models/detail_page.dart';

class CheckoutPage extends StatefulWidget {
  late final DetailApi detailApi;
  CheckoutPage({required this.detailApi});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final DetailApi detailApi = widget.detailApi;
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
      body: SafeArea(
        child: Column(
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
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFE5E5E5))),
                  child: CircleAvatar(
                    foregroundColor: Color(0xFF898989),
                    backgroundColor: Color(0xFFE5E5E5),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Container(
                  width: 44,
                  height: 44,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: CircleAvatar(
                    foregroundColor: Color(0xFF898989),
                    backgroundColor: Color(0xFFE5E5E5),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
