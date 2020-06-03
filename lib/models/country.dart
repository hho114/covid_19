import 'package:covid_19/services/location.dart';
import 'package:covid_19/services/networking.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

const trackCovidURL = 'https://www.trackcorona.live/api/countries';

class Country{

final String location;
final String country_code;
final double latitude;
final double longitude;
final int confirmed;
final int dead;
final int recovered;
final String updated;

  Country({
    this.location,
    this.country_code,
    this.latitude,
    this.longitude,
    this.confirmed,
    this.dead,
    this.recovered,
    this.updated

  });

   factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      location: json['location'],
      country_code: json['country_code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      confirmed: json['confirmed'],
      dead: json['dead'],
      recovered: json['recovered'],
      updated: json['updated']
    );
  }

}

Future <List<Country>> getListCountries() async {
  NetworkHelper networkHelper = NetworkHelper(
        '$trackCovidURL');
    var data = await networkHelper.getData();
    var dataList = data['data'];
  final parsed = dataList.cast<Map<String, dynamic>>();
  
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
}

Future <List<String>> getListNameCountries() async {
  List<Country> listCountries = await getListCountries();
  List<String> list = List();
  for (var item in listCountries) {
    list.add(item.location);
  }
  return list;
}

Future<dynamic> getListCodeCountries() async{
  List<Country> listCountries = await getListCountries();
  var list = List();
  for (var item in listCountries) {
    list.add(item.country_code);
  }
  return list;
}

Future<dynamic> getCountryByName(String nameCountry) async{
  List<Country> listCountries = await getListCountries();
  
  for (var item in listCountries) {
    if(item.location == nameCountry)
      return item;
  }

  return;
}

// Future<Country> getCurrentCountry() async{
//   List<Country> listCountries = await getListCountries();
//  Location location = Location();
//     await location.getCurrentLocation();
//   Country country = Country();
//   double smallestDistance = 40074275.0;//Earth's circumference in meter
//   for (var item in listCountries) {
//     double distanceInMeters = await Geolocator().distanceBetween(location.latitude, location.longitude, item.latitude, item.longitude);
//     if (distanceInMeters < smallestDistance) {
//       smallestDistance = distanceInMeters;
//       country = item;
//     }
//   }
//   // print(country.confirmed);
//   return country;
// }

Future<dynamic> getDefaultCountry() async {
    NetworkHelper networkHelper = NetworkHelper(
        '$trackCovidURL/us');//US

    var data = await networkHelper.getData();
    Country country = Country.fromJson(data['data'][0]);

    return country;
  }
