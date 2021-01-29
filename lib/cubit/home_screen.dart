import 'package:flutter/material.dart';
class HomeScreen extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(

          decoration: BoxDecoration(
            border: Border.all(
              width: 12,
            ),
            shape: BoxShape.circle,
                color: Colors.grey.shade800,
          ),
            child: Icon(Icons.person)),
        title: Text('Signal'),
        centerTitle: true,
        actions: [
          Icon(Icons.camera_alt),
          SizedBox(width: 15,),
          Icon(Icons.edit_outlined),

        ],

      ),
    );
  }
}
