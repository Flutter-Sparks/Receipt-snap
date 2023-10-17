import 'package:flutter/material.dart';
import 'package:invoice_generator/res/colors.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  final String label;
  final VoidCallback onTap;
  final bool showActions;
  const DecoratedContainer({
    Key? key,
    required this.child,
    required this.label,
    required this.onTap,
    this.showActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 245, 245, 245),
                  offset: Offset(1, 1),
                  blurRadius: 7,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    child: showActions
                        ? GestureDetector(
                            onTap: onTap,
                            child: Text(
                              'Tap to change'.toUpperCase(),
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : null,
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 15),
              child,
            ],
          )),
    );
  }
}
