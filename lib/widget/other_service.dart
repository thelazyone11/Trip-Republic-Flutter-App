import 'package:flutter/material.dart';

class OurServices extends StatelessWidget {
  final List<String> service = [
    'Hotel Booking',
    'Flight Booking',
    'Train Booking',
    'Self Drive Car',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Text(
              'Services',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 4, bottom: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: (MediaQuery.of(context).size.width / 2) - 20,
                      color: Colors.lightBlue,
                      alignment: Alignment.center,
                      child: Text(service[0]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 16, bottom: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    color: Colors.blueAccent,
                    alignment: Alignment.center,
                    child: Text(service[1]),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 4, bottom: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    color: Colors.lightGreen,
                    alignment: Alignment.center,
                    child: Text(service[2]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 16, bottom: 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: (MediaQuery.of(context).size.width / 2) - 20,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(service[3]),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
