import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator/shared/decorated_container.dart';

class LogoSelect extends StatefulWidget {
  final Function(File?) onSelect;
  const LogoSelect({
    Key? key,
    required this.onSelect,
    required this.selectedLogo,
  }) : super(key: key);

  final File? selectedLogo;

  @override
  State<LogoSelect> createState() => _LogoSelectState();
}

class _LogoSelectState extends State<LogoSelect> {
  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? response = await picker.pickImage(source: ImageSource.gallery);

    if (response == null) {
      return;
    }
    widget.onSelect(File(response.path));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      label: 'Business logo',
      onTap: () {
        getImage();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 243, 243, 243),
              ),
            ),
            height: 80,
            width: 80,
            child: widget.selectedLogo != null
                ? Image.file(widget.selectedLogo!)
                : const Icon(
                    Icons.image_outlined,
                    color: Color.fromARGB(255, 217, 217, 217),
                  ),
          ),
        ],
      ),
    );
  }
}
