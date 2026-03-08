import 'package:flutter/material.dart';
import 'package:metro_buddy/models/metro_data_model.dart';
import 'package:metro_buddy/modules/city/city_page.dart';
import 'package:metro_buddy/providers/metro_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metro Buddy'), centerTitle: true),
      body: Consumer<MetroProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text('Error: ${provider.errorMessage}'));
          }

          if (provider.metroDataList.isEmpty) {
            return const Center(child: Text('No data found.'));
          }

          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: provider.metroDataList.map((city) => cityListTile(context, city)).toList(),
          );
        },
      ),
    );
  }
}

Widget cityListTile(BuildContext context, MetroDataModel city) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CityPage(city: city)));
      },
      child: ListTile(
        leading: const Icon(Icons.location_city, color: Colors.blue),
        title: Text(city.city ?? 'Unknown City', style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    ),
  );
}
