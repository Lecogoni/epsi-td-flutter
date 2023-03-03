// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/models/habitation.dart';
import 'package:app/share/location_style.dart';
import 'package:app/views/share/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/models/location.dart';
import 'package:app/services/location_service.dart';
import 'package:intl/intl.dart';

class LocationList extends StatefulWidget {
  
  final LocationService service = LocationService();
  late List<Location> _locations;

  LocationList( {Key? key}) : super(key: key) {
    _locations = service.getLocationsList();
  }

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: Text("Mes Locations"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget._locations.length,
          itemBuilder: (context, index) =>
              _buildRow(widget._locations[index], context),
          itemExtent: 250,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }


  _buildRow(Location location, BuildContext context) {
    String formattedDateDebut = DateFormat.yMMMd('fr_FR').format(location.dateDebut);
    String formattedDateFin = DateFormat.yMMMd('fr_FR').format(location.dateFin);
    late String formattedInvoiceDate; 

    if (location.facture != null){
      formattedInvoiceDate = 'Facture délivré le ' + DateFormat.yMMMd('fr_FR').format(location.facture!.date);
    } else {
      formattedInvoiceDate = 'Aucune facture';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30.0, 0, 15),
              child: _displayHomeInfo(location.idhabitation)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30.0, 0, 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 25),
                    child: 
                      _displayDoubleWidget(location.montanttotal)
                  ),
                ],
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0.0, 0, 0),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(formattedDateDebut,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // width: 50.0,
            // height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: LocationStyle.backgroundColorPurple,
              child: Icon(Icons.arrow_forward),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today_outlined,
                    size: 20, color: Colors.black),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    formattedDateFin,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 25.0, 0.0, 00.0),
              // alignment: Alignment.bottomLeft,
              child: Text(
                  formattedInvoiceDate,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
            ),
          ]
        ),  
      ],
    );
  }

  _displayDoubleWidget(double value){
    return Text(
      '$value €',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
      ),
    );
  }

  _displayHomeInfo(int id) {
    final LocationService service = LocationService();
    List<Habitation> _habitations = service.getLocationHome(id);
    Habitation _home = _habitations[0];

    return Padding(
      padding: const EdgeInsets.all(16.0), // Ajout du padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _home.libelle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _home.adresse,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }


}


