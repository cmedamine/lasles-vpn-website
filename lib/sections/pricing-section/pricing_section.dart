import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';
import '../../models/plan.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({Key? key}) : super(key: key);

  @override
  _PricingSectionState createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool hoveredButton = false;
  bool hoveredPlan = false;
  int selectedButtonIndex = 0;
  int selectedPlanIndex = 0;


  final List _platforms = [
    'assets/images/Netflix.svg',
    'assets/images/Reddit.svg',
    'assets/images/Amazon.svg',
    'assets/images/Discord.svg',
    'assets/images/Spotify.svg',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x1AD3D3D3),
            Color(0x0DD3D3D3),
            Color(0x00D3D3D3),
          ],
        ),
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: size.width * .8,
              minWidth: size.width * .6,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 90,
                ),

                const Text(
                  'Choose Your Plan',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: rubikMedium,
                    color: textColorDark,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Let\'s choose the package that is best for you and explore it happily and\ncheerfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 16,
                    color: textColorLight,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      plans.length,
                      (index) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (event) {
                          setState(() {
                            selectedPlanIndex = index;
                            hoveredPlan = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            selectedPlanIndex = index;
                            hoveredPlan = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 760,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 2.0,
                              color: selectedPlanIndex == index && hoveredPlan
                                  ? primary
                                  : borderColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: size.width / 4.1,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  SvgPicture.asset('assets/images/Premium.svg'),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    plans[index].title,
                                    style: const TextStyle(
                                      color: textColorDark,
                                      fontSize: 18,
                                      fontWeight: rubikMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ...plans[index].features.map(
                                        (feature) => Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/images/check mark 2.svg',
                                            ),
                                            const SizedBox(
                                              width: 20,
                                              height: 40,
                                            ),
                                            Text(
                                              feature,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: rubikRegular,
                                                color: textColorLight,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                ],
                              ),
                              Positioned(
                                bottom: 115,
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontFamily: 'Rubik'),
                                    children: [
                                      TextSpan(
                                        text: plans[index].price == null
                                            ? 'Free'
                                            : '\$${plans[index].price} ',
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: rubikMedium,
                                          color: textColorDark,
                                        ),
                                      ),
                                      TextSpan(
                                        text: plans[index].price == null
                                            ? ''
                                            : ' / mo',
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: rubikMedium,
                                          color: textColorLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 50,
                                child: MouseRegion(
                                  onEnter: (event) {
                                    setState(() {
                                      selectedButtonIndex = index;
                                      hoveredButton = true;
                                    });
                                  },
                                  onExit: (event) {
                                    setState(() {
                                      selectedButtonIndex = index;
                                      hoveredButton = false;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 100),
                                    width: 177.88,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: selectedButtonIndex == index &&
                                              hoveredButton
                                          ? primary
                                          : Colors.transparent,
                                      boxShadow: selectedButtonIndex == index &&
                                              hoveredButton
                                          ? [
                                              BoxShadow(
                                                color: signUpButtonColor
                                                    .withOpacity(0.4),
                                                spreadRadius: -12,
                                                blurRadius: 20,
                                                offset: const Offset(0.0, 20),
                                              )
                                            ]
                                          : [],
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        textButtonTheme: TextButtonThemeData(
                                          style: ButtonStyle(
                                            overlayColor:
                                                MaterialStateColor.resolveWith(
                                              (_) => Colors.transparent,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: Text(
                                          'Select',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: rubikBold,
                                            color:
                                                selectedButtonIndex == index &&
                                                        hoveredButton
                                                    ? const Color(0xFFFFFFFF)
                                                    : signUpButtonColor,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            side: const BorderSide(
                                              style: BorderStyle.solid,
                                              width: 2,
                                              color: primary,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //... Global
                const SizedBox(
                  height: 140,
                ),
                const Text(
                  'Huge Global Network\nof Fast VPN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: rubikMedium,
                    color: textColorDark,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      height: 2,
                      fontSize: 16,
                      color: textColorLight,
                      fontFamily: 'Rubik',
                    ),
                    children: [
                      TextSpan(text: 'See'),
                      TextSpan(
                        text: ' LaslesVPN ',
                        style: TextStyle(
                          fontWeight: rubikMedium,
                        ),
                      ),
                      TextSpan(
                        text:
                            'everywhere to make it easier for you when you move\nlocations.',
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                const SizedBox(
                  height: 80,
                ),

                SvgPicture.asset(
                  'assets/images/global.svg',
                ),

                const SizedBox(
                  height: 140,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ..._platforms.map(
                      (plt) => SvgPicture.asset(
                        plt,
                        width: 190,
                        color: const Color(0xFFDDE0E4),
                      ),
                    ),
                  ],
                )


              ],
            ),
          ),
        ],
      ),
    );
  }
}
