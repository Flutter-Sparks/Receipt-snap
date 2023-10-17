import 'dart:io';

import 'package:intl/intl.dart';
import 'package:invoice_generator/models/cart_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFGenerator {
  static Future<File> generateInvoicePDF({
    required File? icon,
    required List<CartItem> cartItems,
    required String businessName,
    required double total,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                // image
                pw.SizedBox(
                  child: icon != null
                      ? pw.Image(pw.MemoryImage(icon.readAsBytesSync()),
                          height: 100)
                      : null,
                ),
                pw.SizedBox(height: 30),
                // heading
                pw.Text(
                  'Invoice | $businessName'.toUpperCase(),
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                    color: PdfColor.fromHex("#297373"),
                  ),
                ),
                pw.SizedBox(height: 30),
                pw.Divider(),
                pw.SizedBox(height: 30),
                // product
                pw.Table(
                    border:
                        pw.TableBorder.all(color: PdfColor.fromHex("#EEEEEE")),
                    children: [
                      pw.TableRow(
                        children: [
                          tableCell('Product', true),
                          tableCell('Qty', true),
                          tableCell('Price', true),
                          tableCell('Total', true),
                        ],
                      ),
                      ...cartItems
                          .map(
                            (e) => pw.TableRow(
                              children: [
                                tableCell(e.product.name.toString()),
                                tableCell(e.qty.toString()),
                                tableCell(e.product.price.toString()),
                                tableCell(
                                  (e.product.price * e.qty).toString(),
                                ),
                              ],
                            ),
                          )
                          .toList()
                    ]),
                pw.SizedBox(height: 30),
                pw.Divider(),
                pw.SizedBox(height: 30),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Total Amount',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "$total LKR",
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Date',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      DateFormat.yMMMEd().format(DateTime.now()),
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Text(
                  "Thank you!",
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex("#297373"),
                  ),
                ),
              ],
            ); // Center
          }),
    );
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    File pdfFile = await file.writeAsBytes(await pdf.save());
    return pdfFile;
  }
}

pw.Padding tableCell(String text, [bool bold = false]) {
  return pw.Padding(
    padding: const pw.EdgeInsets.all(8.0),
    child: pw.Text(
      bold ? text.toUpperCase() : text,
      style: pw.TextStyle(
          fontSize: 16, fontWeight: bold ? pw.FontWeight.bold : null),
    ),
  );
}
