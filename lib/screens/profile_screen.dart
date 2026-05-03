import 'package:flutter/material.dart';
import '../configs/size_config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(SizeConfig.blockWidth * 4),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: const Icon(Icons.person, size: 40, color: Colors.blue),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Pinitha Savidya",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    "pinitha@email.com",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            _menuItem(Icons.person_outline, "Edit Profile"),
            _menuItem(Icons.lock_outline, "Change Password"),
            _menuItem(Icons.notifications_none, "Notifications"),
            _menuItem(Icons.palette_outlined, "Theme"),

            SizedBox(height: 10),

            Container(
              height: 1,
              color: Colors.grey[300],
            ),

            SizedBox(height: 10),

            _menuItem(Icons.info_outline, "About App"),
            _menuItem(Icons.help_outline, "Help & Support"),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // logout logic
                },
                child: const Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}