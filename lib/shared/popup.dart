import 'package:flutter/material.dart';

class ModalPopup extends StatelessWidget {
  final Widget child;
  const ModalPopup({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(20),
                child: Material(color: Colors.white, child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
