import 'package:app/models/habitation.dart';
import 'package:app/services/habitation_service.dart';
import 'package:app/views/habitation_details.dart';
import 'package:app/views/share/bottom_navigation_bar_widget.dart';
import 'package:app/views/share/habitation_features_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HabitationList extends StatelessWidget {
  final HabitationService service = HabitationService();
  late List<Habitation> _habitations;
  final bool isHouseList;
  final int x = 0;
  HabitationList(this.isHouseList, {Key? key}) : super(key: key) {
    _habitations =
        isHouseList ? service.getMaisons() : service.getAppartements();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des ${isHouseList ? 'maisons' : 'appartements'}"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _habitations.length,
          itemBuilder: (context, index) =>
              _buildRow(_habitations[index], context),
          itemExtent: 285,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(this.x), 
    );
  }

  _buildRow(Habitation habitation, BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HabitationDetails(habitation)));
          },
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/locations/${habitation.image}',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              _buildDetails(habitation),
            ],
          ),
        ));
  }

  _buildDetails(Habitation habitation) {
    var format = NumberFormat("### €");
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text(habitation.libelle),
                  subtitle: Text(habitation.adresse),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  format.format(habitation.prixmois),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
          HabitationFeaturesWidget(habitation)
        ],
      ),
    );
  }
}
