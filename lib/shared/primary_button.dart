import 'package:flutter/material.dart';

import 'package:invoice_generator/res/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Widget? child;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primaryShade,
              ],
            ),
          ),
          child: Center(
            child: child ??
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
