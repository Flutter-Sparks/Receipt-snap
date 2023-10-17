import 'package:flutter/material.dart';
import 'package:invoice_generator/res/colors.dart';
import 'package:invoice_generator/shared/decorated_container.dart';
import 'package:invoice_generator/shared/popup.dart';
import 'package:invoice_generator/shared/primary_button.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({
    Key? key,
    required this.businessName,
    required this.onNameSelect,
  }) : super(key: key);

  final String businessName;
  final Function(String) onNameSelect;

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      label: 'Business name',
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ChangeNamePopUp(
              onChange: (p0) {
                widget.onNameSelect(p0);
                Navigator.pop(context);
              },
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.businessName,
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class ChangeNamePopUp extends StatefulWidget {
  final Function(String) onChange;
  const ChangeNamePopUp({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<ChangeNamePopUp> createState() => _ChangeNamePopUpState();
}

class _ChangeNamePopUpState extends State<ChangeNamePopUp> {
  String text = "";
  @override
  Widget build(BuildContext context) {
    return ModalPopup(
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                text = value;
              });
            },
            decoration: const InputDecoration(hintText: 'Type business name'),
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'Save',
            onTap: () {
              if (text == '') {
                Navigator.pop(context);
                return;
              }
              widget.onChange(text);
            },
          )
        ],
      ),
    );
  }
}
