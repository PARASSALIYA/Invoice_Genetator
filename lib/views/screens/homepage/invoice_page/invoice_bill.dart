import 'package:invoice_genetator/header_files.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...Routes.buildoption.map(
              (e) => Card(
                margin: const EdgeInsets.all(5),
                surfaceTintColor: Colors.black,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      e['route'],
                    );
                  },
                  child: ListTile(
                    title: Text(
                      e['name'],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
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
