import 'package:flutter/material.dart';
import 'package:metro_buddy/models/metro_data_model.dart';
import 'package:metro_buddy/utils/utilities.dart';

class CityPage extends StatefulWidget {
  final MetroDataModel city;

  const CityPage({super.key, required this.city});

  @override
  State<CityPage> createState() => _CityPageState();
}

Widget metroLineCard(BuildContext context, MetroLines metroLine) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        if (metroLine.whatsappNumber != null && metroLine.whatsappNumber!.isNotEmpty) {
          Utility.urlLauncher(context, Utility.generateWhatsAppUrl(metroLine.whatsappNumber!));
        }
      },
      child: ListTile(
        leading: const Icon(Icons.directions_subway, color: Colors.green),
        title: Text(metroLine.name ?? 'Unknown Line', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (metroLine.line != null && metroLine.line!.isNotEmpty) Text(metroLine.line!),
            if (metroLine.route != null && metroLine.route!.isNotEmpty) Text(metroLine.route!),
          ],
        ),
      ),
    ),
  );
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    final hasLines = widget.city.metroLines != null && widget.city.metroLines!.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(widget.city.city ?? 'City Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !hasLines
            ? const Center(child: Text("No metro lines available."))
            : ListView(children: widget.city.metroLines!.map((metroLine) => metroLineCard(context, metroLine)).toList()),
      ),
    );
  }
}
