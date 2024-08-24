import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Midline(label: 'Wallet', icon: Icons.wallet_outlined),
                Midline(label: 'Delivery', icon: Icons.local_shipping),
                Midline(label: 'Message', icon: Icons.message),
                Midline(label: 'Service', icon: Icons.support_agent),
              ],
            ),
            SizedBox(height: 8),
            Expanded(child: SettingsList()),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 120,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/aboo.jpg'),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aboo Obida',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'A trendsetter',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem(label: 'Collect', value: '846'),
                    _buildInfoItem(label: 'Attention', value: '51'),
                    _buildInfoItem(label: 'Track', value: '267'),
                    _buildInfoItem(label: 'Coupons', value: '39'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({required String label, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class Midline extends StatelessWidget {
  final String label;
  final IconData icon;

  const Midline({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          child: Icon(icon, size: 22, color: Colors.black),
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ],
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItem(
          label: 'Address',
          icon: Icons.location_on,
          description: 'Ensure your harvesting address',
        ),
        SettingsItem(
          label: 'Privacy',
          icon: Icons.lock,
          description: 'System permission change',
        ),
        SettingsItem(
          label: 'General',
          icon: Icons.settings,
          description: 'Basic functional settings',
        ),
        SettingsItem(
          label: 'Notification',
          icon: Icons.notifications,
          description: 'Take over the news in time',
        ),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String description;

  const SettingsItem({
    required this.label,
    required this.icon,
    required this.description,
  });

  Color _getIconBackgroundColor(String label) {
    switch (label.toLowerCase()) {
      case 'address':
        return Colors.red; // Red background for Address
      case 'privacy':
        return Colors.pink; // Pink background for Privacy
      case 'general':
        return Colors.yellow; // Yellow background for General
      case 'notification':
        return Colors.lightBlue; // Light blue background for Notification
      default:
        return Colors.grey; // Default grey background if no match
    }
  }

  Color _getIconColor(String label) {
    switch (label.toLowerCase()) {
      case 'address':
      case 'privacy':
      case 'general':
      case 'notification':
        return Colors.white; // White icon color for specified labels
      default:
        return Colors.blue; // Default icon color
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getIconBackgroundColor(label);
    Color iconColor = _getIconColor(label);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            SizedBox(width: 13),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
