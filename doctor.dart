import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor List',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const DoctorHomepage(title: 'Doctor List'),
    );
  }
}

// ==================== DOCTOR LIST SCREEN ====================

class DoctorHomepage extends StatelessWidget {
  const DoctorHomepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(title),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 15),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const SizedBox(height: 10),

          // Heading
          const Center(
            child: Column(
              children: [
                Text(
                  "Doctor List 🐼",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Choose a doctor to see details",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Doctor list
          ...List.generate(
            20,
                (index) {
              return DoctorItem(
                doctorName: 'Dr. Doctor ${index + 1}',
                specialization: 'General Physician',
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

// ==================== DOCTOR ITEM ====================

class DoctorItem extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final int index;

  const DoctorItem({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),

        // Doctor image/icon
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orange.shade100,
          child: const Icon(
            Icons.person,
            size: 35,
            color: Colors.orange,
          ),
        ),

        // Doctor name
        title: Text(
          doctorName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Specialization
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(specialization),
        ),

        // Arrow
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.orange,
        ),

        // When doctor is clicked
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DoctorDetails(
                  doctorName: doctorName,
                  specialization: specialization,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ==================== DOCTOR DETAILS SCREEN ====================

class DoctorDetails extends StatelessWidget {
  final String doctorName;
  final String specialization;

  const DoctorDetails({
    super.key,
    required this.doctorName,
    required this.specialization,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Doctor Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            // Doctor icon
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.orange.shade100,
              child: const Icon(
                Icons.person,
                size: 70,
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 25),

            // Doctor name
            Text(
              doctorName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Specialization
            Text(
              specialization,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // Details card
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const DetailRow(
                      icon: Icons.medical_services,
                      title: 'Specialization',
                      value: 'General Physician',
                    ),

                    const Divider(),

                    const DetailRow(
                      icon: Icons.work,
                      title: 'Experience',
                      value: '10 Years',
                    ),

                    const Divider(),

                    const DetailRow(
                      icon: Icons.location_on,
                      title: 'Location',
                      value: 'Pune, Maharashtra',
                    ),

                    const Divider(),

                    const DetailRow(
                      icon: Icons.access_time,
                      title: 'Available',
                      value: '10:00 AM - 5:00 PM',
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Book appointment button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Appointment button clicked'),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),

                child: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== DETAIL ROW ====================

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 28,
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
