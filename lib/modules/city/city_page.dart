import 'package:flutter/material.dart';
import 'package:metro_buddy/data/data.dart';
import 'package:metro_buddy/utils/utilities.dart';

class CityPage extends StatefulWidget {
  final City city;

  const CityPage({super.key, required this.city});

  @override
  State<CityPage> createState() => _CityPageState();
}

Widget metroLineCard(BuildContext context, MetroLine metroLine) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){
        Utility.urlLauncher(context, Utility.generateWhatsAppUrl(metroLine.whatsappNumber));
      },
      child: ListTile(
        leading: const Icon(Icons.directions_subway, color: Colors.green),
        title: Text(metroLine.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(metroLine.line),
            Text(metroLine.route)
          ]
        ),
      ),
    ),
  );
}


class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: widget.city.metroLines.map((metroLine) => metroLineCard(context, metroLine)).toList(),
        ),
      )
    );
  }
}

