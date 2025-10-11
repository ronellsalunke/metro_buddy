import 'package:flutter/material.dart';
import 'package:metro_buddy/data/data.dart';
import 'package:metro_buddy/modules/city/city_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metro Buddy'),
        centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: cities.map((city) => cityListTile(context, city)).toList(),
        ),
      ),
    );
  }
}


Widget cityListTile(BuildContext context, City city) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CityPage(city: city),
          ),
        );
      },
      child: ListTile(
        leading: const Icon(Icons.location_city, color: Colors.blue),
        title: Text(city.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    ),
  );
}