import 'package:flutter/material.dart';
import 'package:mosquito_project/utils/colour.dart';

class DrawHeader extends StatelessWidget {
  const DrawHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whitePerl,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Mosquito Learning',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: greenPrimary,
                ),
          ),
        ],
      ),
    );
  }
}
