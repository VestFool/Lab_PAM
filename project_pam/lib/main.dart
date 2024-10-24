import 'package:flutter/material.dart';

void main() {
  runApp(DoctorFinderApp());
}

class DoctorFinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorFinderHomePage(),
    );
  }
}

class DoctorFinderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8),
            Text('London, UK'),
            Spacer(),
            Icon(Icons.notifications_none),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 16),
            CategoriesSection(),
            SizedBox(height: 16),
            NearbyMedicalCentersSection(),
            SizedBox(height: 16),
            DoctorListSection(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search specialist doctors...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CategoryIcon(icon: Icons.local_hospital, label: 'Cardiology'),
            CategoryIcon(icon: Icons.visibility, label: 'Ophthalmology'),
            CategoryIcon(icon: Icons.child_care, label: 'Pediatrics'),
            CategoryIcon(icon: Icons.directions_run, label: 'Orthopedics'),
            CategoryIcon(icon: Icons.local_pharmacy, label: 'Pharmacy'),
            CategoryIcon(icon: Icons.healing, label: 'Dermatology'),
            CategoryIcon(icon: Icons.masks, label: 'Dentistry'),
            CategoryIcon(icon: Icons.psychology, label: 'Psychiatry'),
          ],
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          child: Icon(icon, size: 28),
        ),
        SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class NearbyMedicalCentersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nearby Medical Centers',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              NearbyMedicalCenterCard(
                location: 'St Thomas\' Hospital',
                imagePath: 'assets/images/st-thomas-hospital.jpg',
              ),
              NearbyMedicalCenterCard(
                location: 'Royal London Hospital',
                imagePath: 'assets/images/Royal_London_Hospital.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NearbyMedicalCenterCard extends StatelessWidget {
  final String location;
  final String imagePath;

  NearbyMedicalCenterCard({required this.location, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        width: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(location, style: TextStyle(fontWeight: FontWeight.bold)),
            Text('London, UK'),
          ],
        ),
      ),
    );
  }
}

class DoctorListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Doctors',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return DoctorListTile(doctorName: doctorNames[index], specialty: doctorSpecialties[index]);
          },
        ),
      ],
    );
  }
}

class DoctorListTile extends StatelessWidget {
  final String doctorName;
  final String specialty;

  DoctorListTile({required this.doctorName, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.health_and_safety, color: Colors.blue), // Icon pentru doctor
      ),
      title: Text(doctorName),
      subtitle: Text(specialty),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text('Book'),
      ),
    );
  }
}

final List<String> doctorNames = [
  'Dr. Emily Carter',
  'Dr. James Wilson',
  'Dr. Olivia Smith',
  'Dr. William Johnson',
  'Dr. Ava Brown'
];

final List<String> doctorSpecialties = [
  'Cardiologist',
  'Pediatrician',
  'Dermatologist',
  'Orthopedic Surgeon',
  'Psychiatrist'
];
