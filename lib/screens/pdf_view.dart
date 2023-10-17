import 'dart:io';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewScreen extends StatefulWidget {
  final File pdf;
  const PdfPreviewScreen({
    Key? key,
    required this.pdf,
  }) : super(key: key);

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreviewScreen> {
  void exportPDF() async {
    ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    try {
      scaffoldMessengerState
          .showSnackBar(const SnackBar(content: Text('Generating..')));
      DocumentFileSavePlus savePlus = DocumentFileSavePlus();
      await savePlus.saveFile(
          widget.pdf.readAsBytesSync(), "invoice.pdf", "application/pdf");
    } catch (e) {
      scaffoldMessengerState
          .showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Preview'), actions: [
        GestureDetector(
          onTap: () => exportPDF(),
          child: const Icon(
            Icons.download,
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ]),
      body: PDFView(
        filePath: widget.pdf.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {},
        onError: (error) {},
        onPageError: (page, error) {},
        onViewCreated: (PDFViewController pdfViewController) {},
      ),
    );
  }
}
