import 'package:flutter/material.dart';
import 'package:invoice_generator/res/colors.dart';
import 'package:invoice_generator/shared/decorated_container.dart';

class Summery extends StatelessWidget {
  const Summery({
    Key? key,
    required this.appCharges,
    required this.total,
  }) : super(key: key);

  final double appCharges;
  final double total;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      showActions: false,
      label: 'Summery',
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total'),
              Text(
                '$total LKR',
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('App charges'),
              Text(
                '$appCharges LKR',
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sub total'),
              Text(
                '${appCharges + total} LKR',
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
