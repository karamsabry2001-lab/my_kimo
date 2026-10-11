import 'package:flutter/material.dart';

void main() {
  runApp(const KimoApp());
}

class KimoApp extends StatelessWidget {
  const KimoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مساعد كرم الشامل',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    GamaeyaScreen(),
    MedicationScreen(),
    AppointmentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق كرم للجمعيات والأدوية'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'الجمعيات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'الأدوية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'المواعيد',
          ),
        ],
      ),
    );
  }
}

class GamaeyaScreen extends StatelessWidget {
  const GamaeyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      id: 'gamaeya_screen',
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.savings, color: Colors.indigo),
              title: Text('جمعية الشهر الحالي'),
              subtitle: Text('المبلغ: 5000 جنيه - الدور القادم: الأول'),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicationScreen extends StatelessWidget {
  const MedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.alarm, color: Colors.red),
              title: Text('ميعاد الدواء'),
              subtitle: Text('دواء الضغط - الساعة 8:00 مساءً'),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.green),
              title: Text('موعد الطبيب'),
              subtitle: Text('دكتور العيادة - الأربعاء القادم الساعة 5 مساءً'),
            ),
          ),
        ],
      ),
    );
  }
}
