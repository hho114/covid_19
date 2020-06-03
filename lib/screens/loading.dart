import 'package:covid_19/models/country.dart';
import 'package:covid_19/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
      Country country = await getDefaultCountry();//US
      List<String> listCountries = await getListNameCountries(); 
    
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Home(country: country,listCountries: listCountries,)),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
