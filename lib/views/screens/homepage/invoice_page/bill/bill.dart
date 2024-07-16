import 'package:flutter/widgets.dart';
import 'package:invoice_genetator/header_files.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  Future<Uint8List> getpdf() async {
    pw.Document pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Text(
                  "INVOICE",
                  style: const pw.TextStyle(
                    fontSize: 40,
                  ),
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      "INVOICE #",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "\t\t\t\t\t\t\t\t\t CREATION DATE",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "DUE DATE",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(
                  width: 50,
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      "INV00001",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "14/05/2024",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    pw.Text(
                      "18/05/2024",
                      style: const pw.TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(
              height: 50,
            ),
            pw.Container(
              height: 50,
              width: 2050,
              decoration: pw.BoxDecoration(
                // color: PdfColors.black,
                border: pw.Border.all(),
                borderRadius: pw.BorderRadius.circular(8),
              ),
              child: pw.Row(
                children: [
                  pw.SizedBox(
                    width: 20,
                  ),
                  pw.Text(
                    "ITEMS NAME",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(
                    width: 100,
                  ),
                  pw.Text(
                    "QTY ",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(
                    width: 40,
                  ),
                  pw.Text(
                    "PRICE",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  pw.SizedBox(
                    width: 40,
                  ),
                  pw.Text(
                    "AMOUNT",
                    style: const pw.TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ...favorite
                .map(
                  (e) => pw.Text(
                    e[PersonalGlobal.name],
                    style: const pw.TextStyle(
                      fontSize: 30,
                    ),
                  ),
                )
                .toList(),
            // pw.Container(
            //   height: 200,
            //   child: pw.Align(
            //     alignment: const pw.Alignment(1.8, -9.6),
            //     child: bytes != null
            //         ? pw.Container(
            //             width: 200,
            //             height: 100,
            //             decoration: pw.BoxDecoration(
            //               image: pw.DecorationImage(
            //                 image: pw.MemoryImage(bytes!),
            //               ),
            //             ),
            //           )
            //         : pw.Container(),
            //   ),
            // ),
            (bytes != null)
                ? pw.Image(
                    pw.MemoryImage(bytes!),
                  )
                : pw.Container(),
          ],
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pdf Page"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              pdfsave = await getpdf();
            },
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => getpdf(),
      ),
    );
  }
}
/*                  // bytes != null
                    //     ? pw.Container(
                    //         width: 200,
                    //         height: 200,
                    //         decoration: pw.BoxDecoration(
                    //           image: pw.DecorationImage(
                    //             image: pw.MemoryImage(bytes!),
                    //           ),
                    //         ),
                    //       )
                    //     : pw.Container(),

 */
