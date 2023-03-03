import 'package:app/services/habitation_service.dart';
import 'package:app/share/location_style.dart';
import 'package:app/share/location_text_style.dart';
import 'package:app/views/habitation_details.dart';
import 'package:app/views/share/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/cupertino.dart';

import 'models/typehabitat.dart';
import 'models/habitation.dart';
import 'views/habitation_list.dart';

class MyHomePage extends StatelessWidget {
  final HabitationService service = HabitationService();
  final String title;
  final int x = 0;

  late List<TypeHabitat> _typeHabitats;
  late List<Habitation> _habitations;

  MyHomePage({required this.title, Key? key}) 
    : super(key: key){
      _habitations = service.getHabitationsTop10();
      _typeHabitats = service.getTypeHabitats();
    }

  // final _typehabitats = [TypeHabitat(1, "Maison"), TypeHabitat(2, "Appartement")];
  // final _habitations = [
  //   Habitation(1, "maison.png", "Maison méditérannéenne", "12 grande rue", 3, 92, 800),
  //   Habitation(1, "appartement.png", "appartement", "12 petit rue des bois", 2, 40, 500),
  //   Habitation(2, "appartement.png", "mon appartement", "2 impasse maurice chauvet", 4, 70, 600),
  // ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            _buildTypeHabitat(context),
            SizedBox(height: 20),
            _buildDerniereLocation(context),
          ]
          )
      ),
      bottomNavigationBar: BottomNavigationBarWidget(this.x), 
    );
  }

  _buildTypeHabitat(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _typeHabitats.length, 
          (index) => _buildHabitat(context, _typeHabitats[index]),
        )
      )
    );
  }

  // Home Page icons Maisons et Appartements
  _buildHabitat(BuildContext context, TypeHabitat typehabitat) {
    var icon = Icons.house;
    switch (typehabitat.id){
      case 2:
        icon = Icons.apartment;
        break;
      default: 
        icon = Icons.home;
    }
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: LocationStyle.backgroundColorPurple,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                  HabitationList(typehabitat.id == 1)
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white70
              ),
              SizedBox(width: 5),
              Text(
                typehabitat.libelle,
                style: LocationTextStyle.regularWhiteTextStyle,
              )
            ],
          ),
        )
        
      ),
    );
  }

  _buildDerniereLocation(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: _habitations.length,
        itemExtent: 220,
        itemBuilder: (context, index) =>
            _buildRow(_habitations[index], context),
          scrollDirection: Axis.horizontal,
        ),
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {
    var format = NumberFormat("### €");

    return Container(
      width: 240,
      margin: EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HabitationDetails(habitation)));
        },
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/locations/${habitation.image}',
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              habitation.libelle,
              style: LocationTextStyle.regularTextStyle,
            ),
            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                Text(
                  habitation.adresse, 
                  style: LocationTextStyle.regularTextStyle,
                ),
              ],
            ),
            Text(
              format.format(habitation.prixmois),
              style: LocationTextStyle.boldTextStyle,
            ),
          ],
        )),
    );
  }
}