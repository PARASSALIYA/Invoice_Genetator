import 'header_files.dart';

void main() {
  runApp(
    const InvoiceBillApp(),
  );
}

class InvoiceBillApp extends StatelessWidget {
  const InvoiceBillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TimerHomePage(),
      // home: HomePage(),
      routes: {
        Routes.homepage: (context) => const HomePage(),
        Routes.invoice: (context) => const InvoicePage(),
        Routes.buildoption[0]['route']: (context) => const PersonalinfoPage(),
        Routes.buildoption[1]['route']: (context) => const ItemPage(),
        Routes.buildoption[2]['route']: (context) => const SignaturePage(),
        Routes.buildoption[3]['route']: (context) => const BillPage(),
      },
    );
  }
}
