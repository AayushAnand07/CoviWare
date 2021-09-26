import 'package:flutter/material.dart';

class Slot extends StatefulWidget {
  final List? slots;

  const Slot({this.slots});
  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff473F98),
        title: Text(
          'Available Slots',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.slots!.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.orange[200],
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Center ID - ' +
                              widget.slots![index]['center_id'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Center Name - ' +
                              widget.slots![index]['name'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Center Address - ' +
                              widget.slots![index]['address'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          'Vaccine Name - ' +
                              widget.slots![index]['vaccine'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          'Available Capacity Dose-1 ' +
                              ' ' +
                              widget.slots![index]['available_capacity_dose1']
                                  .toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          'Available Capacity Dose-2 ' +
                              ' ' +
                              widget.slots![index]['available_capacity_dose2']
                                  .toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          'Slots - ' + widget.slots![index]['slots'].toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(),
                        Text(
                          'Fees-' +
                              ' ' +
                              widget.slots![index]['fee'].toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
