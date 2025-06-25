import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StationScreen  extends StatefulWidget {
  const StationScreen ({super.key});

  @override
  State<StationScreen > createState() =>  _StationScreenState();
}

class _StationScreenState extends State<StationScreen > {


  @override
  void initState() {
    super.initState();

    // BottomSheet ko automatically show karo jab screen khule
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showChargerBottomSheet(context);
    });
  }

  void _showChargerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // full height k liye agar chahiye
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: _buildBottomSheetContent(),
        );
      },
    );
  }

  Widget _buildBottomSheetContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 40,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/charger.jpg', // Apni image lagao yaha
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HP Station", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("567 SG Highway, New York", style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.green),
                    SizedBox(width: 4),
                    Text("450 m/5min", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.shade100),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoColumn("Type 3", "Connection"),
              _infoColumn("\$0.5", "Per kwh"),
              _infoColumn("\$0.1", "Parking Fee"),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _timeSelector("Arrive", "Today 12:15")),
            SizedBox(width: 8),
            Expanded(child: _timeSelector("Depart", "Today 13:15")),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text("BOOK CHARGER"),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _infoColumn(String title, String subtitle) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        SizedBox(height: 4),
        Text(subtitle, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _timeSelector(String label, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
