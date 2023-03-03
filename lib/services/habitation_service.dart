import 'package:app/models/habitation.dart';
import 'package:app/models/habitations_data.dart';
import 'package:app/models/location.dart';
import 'package:app/models/typehabitat.dart';
import 'package:app/models/typehabitat_data.dart';
import 'package:app/models/locations_data.dart';

/* Cette classe va nous renvoyer les données souhaitées (top 10, liste des maisons, liste des appartements).  */
class HabitationService {
  // final _typehabitats = [TypeHabitat(1, "Maison"), TypeHabitat(2, "Appartements")];
  var _typehabitats;
  var _habitations;
  var _locations;

  HabitationService() {
    _typehabitats = TypeHabitatData.buildList();
    _habitations = HabitationsData.buildList();
    _locations = LocationsData.buildList();
  }

  // final _habitations = List.generate(30, (index){
  //   bool maison = index % 3 == 0;

  //   return Habitation(
  //     index,
  //     maison ? TypeHabitat(1, "Maison") : TypeHabitat(2, "Appartements"),
  //     maison ? "maison.png" : "appartement.png",
  //     "${maison ? 'maison' : 'Appartement'} ${index}", 
  //     "Rue ${index}",
  //     2 + index % 3, 
  //     2 + index % 2,
  //     (maison ? 100 : 50) + index, 
  //     ((maison ? 600 : 400) + index).toDouble()); 
  // });

  List<TypeHabitat> getTypeHabitats() {
    return _typehabitats;
  }

  List<Habitation> getHabitationsTop10() {
    return _habitations
      .where((element) => element.id%2 == 1)
      .take(10)
      .toList();
  }

  List<Habitation> getMaisons() {
    return _getHabitations(isHouse: true);
  }

  List<Habitation> getAppartements() {
    return _getHabitations(isHouse: true);
  }

  List<Habitation> _getHabitations({ bool isHouse = true }) {
    return _habitations
      .where((element) => element.typeHabitat.id == (isHouse ? 1 : 2))
      .toList();
  }

  List<Location> getLocations() {
    return _locations
      .where((element) => element.idutilisateur == 6)
      .toList();
  }



}

