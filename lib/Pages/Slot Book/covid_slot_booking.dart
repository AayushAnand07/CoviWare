import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'VaccineSlot.dart';

class SlotBook extends StatefulWidget {
  const SlotBook({Key? key}) : super(key: key);

  @override
  _SlotBookState createState() => _SlotBookState();
}

class _SlotBookState extends State<SlotBook> {
  final _formKey = GlobalKey<FormState>();
  List slots = [];
  DateTime? _SelectedDate;
  TextEditingController PinEditingController = TextEditingController();
  TextEditingController DayEditingController = TextEditingController();
  TextEditingController MonthEditingController = TextEditingController();

  fetchslots() async {
    await http
        .get(Uri.parse(
            'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=' +
                PinEditingController.text +
                '&date=' +
                DayEditingController.text +
                '%2F' +
                MonthEditingController.text +
                '%2F2021'))
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        slots = result['sessions'];
        slots:
        slots;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Slot(
                    slots: slots,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff473F98),
        title: Text(
          'Slot Booking',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Lottie.asset('assets/vaccine.json', height: 220),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Check Vaccine Slot',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      validator: (val) {
                        return val!.isNotEmpty && val.length == 6
                            ? null
                            : 'Please write a proper Pin';
                      },
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      controller: PinEditingController,
                      decoration: InputDecoration(
                          labelText: "Enter Pincode",
                          labelStyle: TextStyle(fontSize: 18),
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide:
                                BorderSide(width: 50.0, color: Colors.red),
                          )),
                      //controller: _amountController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        validator: (val) {
                          return val!.isNotEmpty &&
                                  val.length <= 2 &&
                                  int.tryParse(val)! <= 31 &&
                                  int.tryParse(val)! > 0
                              ? null
                              : 'Proper date';
                        },
                        controller: DayEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Date",
                            labelStyle: TextStyle(fontSize: 18),
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(width: 50.0, color: Colors.red),
                            )),
                        //controller: _amountController,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextFormField(
                        validator: (val) {
                          return val!.isNotEmpty &&
                                  int.tryParse(val)! <= 12 &&
                                  int.tryParse(val)! > 0
                              ? null
                              : 'Proper month';
                        },
                        keyboardType: TextInputType.number,
                        controller: MonthEditingController,
                        decoration: InputDecoration(
                            labelText: "Month",
                            labelStyle: TextStyle(fontSize: 18),
                            border: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(width: 50.0, color: Colors.red),
                            )),
                      ),
                    ),
                    SizedBox(height: 2),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      fetchslots();
                    },
                    child: TextButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return null;
                        }
                        fetchslots();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Color(0xff071939),
                                Color(0xff002366)
                              ])),
                          alignment: Alignment.center,
                          child: Text(
                            'Find Slots',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      launch('https://selfregistration.cowin.gov.in/');
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 13),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Color(0xff0F52BA),
                              Color(0xff002366)
                            ])),
                        alignment: Alignment.center,
                        child: Text(
                          'Book Your Slot',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
