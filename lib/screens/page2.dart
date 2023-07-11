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
      home: Page2(),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => Page2State();
}

class Page2State extends State<Page2> {
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
                            'SAVINGS FREQUENCY',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "How frequently would you like to save for this plan?",
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
                      title: const Text('Daily'),
                      value: 'Daily',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Weekly'),
                      value: 'Weekly',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Monthly'),
                      value: 'Monthly',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Not sure'),
                      value: 'Not sure',
                      groupValue: _selectedFrequency,
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                 Padding(
                  padding:  const EdgeInsets.only(left: 18),
                  child:Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:const[Text(
                    'Amount to save ',
                    style: TextStyle(
                    fontSize: 16,
                    ),
                  ),
                    ]))),
         const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    controller: _planNameController,
                    decoration:const InputDecoration(
                      labelText: 'Amount',
                      border: InputBorder.none,
                    ),
                  ),
                ),
               
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/page3');
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
          ),
         
        ],
      ),
    );
  }
}
