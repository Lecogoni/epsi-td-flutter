import 'package:app/share/location_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final DateTime dateDebut;
  final DateTime dateFin;

  const DateWidget(this.dateDebut, this.dateFin, {Key? key}) : super(key: key);

  Widget _buildDatePart(DateTime date) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 20,
            color: Colors.black
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(DateFormat('dd MMM yyyy', 'fr').format(date),
                style: const TextStyle(
                  fontSize: 18,
                ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDatePart(dateDebut),
        SizedBox(width: 30),
        CircleAvatar(
          backgroundColor: LocationStyle.backgroundColorPurple,
          child: Icon(Icons.arrow_forward),
        ),
        SizedBox(width: 30),
        _buildDatePart(dateFin),
      ],
    );
  }
}

