import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class FeaturesSection extends StatelessWidget {
  static const _features = [
    'Powerfull online protection.',
    'Internet without borders.',
    'Supercharged VPN',
    'No specific time limits.'
  ];

  const FeaturesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * .8,
        minWidth: size.width * .6,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/images/Illustration 2.svg',
            width: 450,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'We Provide Many\nFeatures You Can Use',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: rubikMedium,
                  height: 1.3
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'You can explore the features that we provide with fun\nand have their own functions each feature.',
                style: TextStyle(
                  fontSize: 16,
                  color: textColorLight,
                  height: 2
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ..._features.map(
                (feature) {
                  return Container(
                    constraints: const BoxConstraints(minHeight: 45),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/check mark 1.svg',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 14,
                            color: textColorLight,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()
            ],
          )
        ],
      ),
    );
  }
}
