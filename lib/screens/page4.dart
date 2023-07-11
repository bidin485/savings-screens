import 'package:create_saving_plan_screen/screens/page3.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page4(),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => Page4State();
}

class Page4State extends State<Page4> {
  final _dateFormat = DateFormat("yyyy-MM-dd");
  late TextEditingController _startDateController;
  late TextEditingController _withdrawDateController;

  DateTime? _selectedStartDate;
  DateTime? _selectedWithdrawDate;

  @override
  void initState() {
    super.initState();
    _startDateController = TextEditingController();
    _withdrawDateController = TextEditingController();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _withdrawDateController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedStartDate = pickedDate;
        _startDateController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  Future<void> _selectWithdrawDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedWithdrawDate = pickedDate;
        _withdrawDateController.text = _dateFormat.format(pickedDate);
      });
    }
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
                        children: const [
                          Text(
                            'SAVING DURATION',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "When would you like to start and stop saving?",
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
                      
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Start date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _startDateController,
                  onTap: () => _selectStartDate(context),
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Select start date',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Withdraw date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _withdrawDateController,
                  onTap: () => _selectWithdrawDate(context),
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: 'Select withdraw date',
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
