
import 'package:app/models/habitation.dart';
import 'package:app/models/habitations_data.dart';
import 'package:app/models/location.dart';
import 'package:app/models/locations_data.dart';

class LocationService {

    // ignore: prefer_typing_uninitialized_variables
    var _locationslist;
    // ignore: prefer_typing_uninitialized_variables
    var _locationhome;

    LocationService() {
      _locationslist = LocationsData.buildList();
      _locationhome = HabitationsData.buildList();
    }

    List<Location> getLocationsList() {
      return _locationslist;
    }

    List<Habitation> getLocationHome(int id) {
    return _locationhome
        .where((element) => element.id == id)
        .toList();
  }

}

