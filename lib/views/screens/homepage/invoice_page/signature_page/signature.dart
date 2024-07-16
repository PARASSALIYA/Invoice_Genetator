import 'package:invoice_genetator/header_files.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

final SignatureController _controller = SignatureController(
  penStrokeWidth: 5,
  penColor: Colors.black,
);

class _SignaturePageState extends State<SignaturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Draw Signature"),
        actions: [
          ElevatedButton(
            onPressed: () {
              _controller.clear();
              setState(() {});
            },
            child: const Icon(Icons.close),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              bytes = await _controller.toPngBytes(
                height: 200,
                width: 200,
              );
              setState(() {});
            },
            child: const Icon(Icons.check),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Signature(
        controller: _controller,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        backgroundColor: Colors.white,
      ),
    );
  }
}
