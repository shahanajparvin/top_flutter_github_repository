

import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {

  final String dateString;

  const DateWidget({super.key, required this.dateString});

  @override
  Widget build(BuildContext context) {
    return Text(convertDateFormat());
  }
  convertDateFormat(){
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.day.toString().padLeft(2, '0')}-"
        "${dateTime.year} "
        "${dateTime.hour.toString().padLeft(2, '0')}:"
        "${dateTime.second.toString().padLeft(2, '0')}";
    return formattedDate;
  }
}
