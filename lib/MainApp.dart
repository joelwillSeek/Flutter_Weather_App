import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/SearchAndFilter.dart';
import 'package:flutter_weather_app/weather_api.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String query = "Addis Abeba";

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero, () => showDialog(context: context, builder: makeDialog));

    return ListView(
      children: [
        SearchAndFilter(
          textEditingController: textEditingController,
          searchClicked: searchClicked,
        ),
        Container(
          alignment: Alignment.center,
          child: FutureBuilder(
              future: getResponse(query, context), builder: buildTheCard),
        )
      ],
    );
  }

  Widget buildTheCard(BuildContext context, AsyncSnapshot<CityInfo?> snapshot) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Text(snapshot.data?.cityName ?? "no Data"),
            Text(snapshot.data?.temperature ?? "no Data"),
            Text(snapshot.data?.weatherCondition ?? "no Data"),
            Text(snapshot.data?.windSpeedInKph ?? "no Data"),
            Text(snapshot.data?.humidity ?? "no Data")
          ],
        ),
        if (snapshot.data?.icon != null)
          Image.network(snapshot.data!.icon ?? "")
        else
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: SvgPicture.asset(
              "assets/help.svg",
              width: 50,
            ),
          )
      ]),
    );
  }

  void searchClicked() {
    String getQuery = textEditingController.text;
    setState(() {
      query = getQuery;
    });
  }

  Widget makeDialog(BuildContext context) {
    return const SimpleDialog(
      backgroundColor: Colors.transparent,
      children: [
        SpinKitWave(
          color: Colors.blue,
        )
      ],
    );
  }
}
