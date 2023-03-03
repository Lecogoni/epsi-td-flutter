import 'package:app/models/habitation.dart';
import 'package:app/share/location_style.dart';
import 'package:app/views/share/bottom_navigation_bar_widget.dart';
import 'package:app/views/share/date_widget.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../share/location_text_style.dart';

class ResaLocation extends StatefulWidget {
  final Habitation _habitation;
  final int x = 0;

  const ResaLocation(this._habitation, {Key? key}) : super(key: key);

  @override
  State<ResaLocation> createState() => _ResaLocationState();
}

class _ResaLocationState extends State<ResaLocation> {
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  int nbPersonnes = 1;
  //int prixTotal = 0;
  //List<OptionPayanteCheck> optionPayanteChecks = [];
  List<int> dropdownvalue = [1, 2, 3, 4, 5, 6, 7, 8];

  var format = NumberFormat("### €");

  @override
  Widget build(BuildContext context) {
    //_loadOptionPayantes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Réservation'),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          _buildResume(),
          _buildDates(),
          _buildNbPersonnes(),
          _buildOptionsPayantes(context),
          TotalWidget(),
          _buildRentButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(3), 
    );
  }

  _buildResume() {
    return Container(
      margin: EdgeInsets.all(2),
      child: Material(
        child: ListTile(
          leading: Icon(Icons.house_rounded),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget._habitation.libelle,
                style: LocationTextStyle.boldTextStyle,
              ),
              Text(
                widget._habitation.adresse,
                style: LocationTextStyle.baseTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildDates() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          dateTimeRangePicker();
        },
        child: DateWidget(dateDebut, dateFin),
      ),
    );
  }

  _buildNbPersonnes() {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Text('Nombre de personnes : '),
            DropdownButton<int>(
              value: nbPersonnes,
              items: List.generate(8, (index) => index + 1)
                  .map((nb) => DropdownMenuItem<int>(
                        value: nb,
                        child: Text('$nb'),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  nbPersonnes = newValue!;
                });
              },
            ),
          ],
        ));
  }

  /*List<OptionPayanteCheck> _loadOptionPayantes() {
    List<OptionPayanteCheck> options = [];
    for (OptionPayante option in widget._habitation.optionpayantes) {
     options.add(OptionPayanteCheck(option));
    }
    return options;
  }
*/
  _buildOptionsPayantes(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget._habitation.optionpayantes
            .map((option) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.add_shopping_cart_rounded),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  option.libelle + '',
                                  style: LocationTextStyle.regularTextStyle,
                                ),
                                Text(
                                  '(${format.format(option.prix)})',
                                  style: LocationTextStyle.regularTextStyle,
                                ),
                              ],
                            ),
                            if (option.description != null)
                              Text(
                                option.description!,
                                style: LocationTextStyle.regularGreyTextStyle,
                              ),
                          ],
                        ),
                      ),
                      Checkbox(value: false, onChanged: (bool? value) {})
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  dateTimeRangePicker() async {
    DateTimeRange? datePicked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: DateTimeRange(start: dateDebut, end: dateFin),
      cancelText: 'Annuler',
      confirmText: 'Valider',
      locale: const Locale("fr", "FR"),
    );
    if (datePicked != null) {
      setState(() {
        dateDebut = datePicked.start;
        dateFin = datePicked.end;
      });
    }
  }


  TotalWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: LocationStyle.backgroundColorPurple,
        width: 2, // épaisseur de la bordure
        ),
      ),
      // padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "TOTAL",
              style: TextStyle(
                color: LocationStyle.backgroundColorPurple,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "600.00€",
            style: TextStyle(
                color: LocationStyle.backgroundColorPurple,
                fontSize: 18,
              ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  _buildRentButton() {

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResaLocation(widget._habitation)));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: LocationStyle.backgroundColorPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Louer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
