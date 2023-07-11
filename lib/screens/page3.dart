import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page3(),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => Page3State();
}

class Page3State extends State<Page3> {
  late TextEditingController _planNameController;
  String _selectedFrequency = '';

  @override
  void initState() {
    super.initState();
    _planNameController = TextEditingController();
  }

  @override
  void dispose() {
    _planNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
         
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              color: Colors.blue,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children:const  [
                          Text(
                            'LOCK STATUS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Do you want to lock this savings account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size:50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           const SizedBox(height: 16),
            Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text('Lock with Interest'),
                      value: 'Lock with Interest',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Lock without interest'),
                      value: 'Lock without interest',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("Don't Lock"),
                      value: "Don't Lock",
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    
                  ],
                ),
                
       
               
                const SizedBox(height: 250),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.pushNamed(context, '/page4');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child:const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
             
    );
  }
}
