import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {


  var hovered = false;

  var featureIndex = 0;

  List<Map<String, String>>? features = [
    {
      'icon': 'assets/images/user.svg',
      'num': '90+',
      'text': 'Users',
    },
    {
      'icon': 'assets/images/location.svg',
      'num': '30+',
      'text': 'Locations',
    },
    {
      'icon': 'assets/images/server.svg',
      'num': '50+',
      'text': 'Servers',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * .8,
        minWidth: size.width * .6,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildHeading(),
                    const SizedBox(height: 40),
                    _buildSubHeading(),
                    const SizedBox(height: 50),
                    _buildGetStartedBtn(),
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/Illustration 1.svg',
                  width: 611.24,
                  height: 382.44,
                ),

                
              ),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: blurColor.withOpacity(0.05),
                  spreadRadius: -40,
                  blurRadius: 50,
                  offset: const Offset(0, 90),
                )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 2,
                      height: 125.57,
                      color: lineColor,
                    ),
                    Container(
                      width: 2,
                      height: 125.57,
                      color: lineColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      features!.length,
                      (index) {
                        return _buildFeatures(
                          features![index]['icon'],
                          features![index]['num'],
                          features![index]['text'],
                          index,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatures(String? icon, String? num, String? text, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon!,
          width: 55,
          height: 55,
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              num!,
              style: const TextStyle(
                  fontSize: 25, fontWeight: rubikBold, color: textColorDark),
            ),
            Text(
              text!,
              style: const TextStyle(fontSize: 20, color: textColorLight),
            ),
          ],
        ),

        //col of num
      ],
    );
  }

  Widget _buildGetStartedBtn() => MouseRegion(
        onEnter: (event) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            hovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: signUpButtonColor.withOpacity(0.4),
                      spreadRadius: -12,
                      blurRadius: 20,
                      offset: const Offset(0, 30),
                    )
                  ]
                : [],
          ),
          child: TextButton(
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 16,
                fontWeight: rubikBold,
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
          ),
        ),
      );

  Widget _buildSubHeading() => RichText(
        text: const TextSpan(
          style: TextStyle(
            color: textColorLight,
            fontFamily: 'Rubik',
            height: 1.8,
          ),
          children: [
            TextSpan(
              text:
                  'Provide a network for all your needs with ease and fun using ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: 'LaslesVPN',
              style: TextStyle(
                fontWeight: rubikMedium,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: ' discover interesting features from us.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );

  Widget _buildHeading() => RichText(
        text: const TextSpan(
          style:
              TextStyle(color: textColorDark, fontFamily: 'Rubik', height: 1.2),
          children: [
            TextSpan(
              text: 'Want anything to be easy with ',
              style: TextStyle(
                  fontWeight: rubikMedium, fontSize: 50, color: textColorDark
                  // height: 1
                  ),
            ),
            TextSpan(
              text: 'laslesVPN.',
              style: TextStyle(
                fontWeight: rubikBold,
                fontSize: 50,
              ),
            )
          ],
        ),
      );
}
