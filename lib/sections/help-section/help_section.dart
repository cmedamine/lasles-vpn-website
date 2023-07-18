import 'package:flutter/material.dart';

import '../../constants.dart';

class HelpSection extends StatefulWidget {
  const HelpSection({Key? key}) : super(key: key);

  @override
  State<HelpSection> createState() => _HelpSectionState();
}

class _HelpSectionState extends State<HelpSection> {
  var hovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 233 / 3),
      height: 563.12,
      width: double.infinity,
      color: helpSectionColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: helpSectionColor,
            constraints: BoxConstraints(
              maxWidth: size.width * .8,
              minWidth: size.width * .6,
            ),
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, -233 / 2),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 65),
                      height: 233,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: blurColor.withOpacity(0.05),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: const Offset(0, 0),
                          ),

                          
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Subscribe Now for\nGet Special Features!',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: rubikMedium,
                                  color: textColorDark,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Let\'s subscribe with us and find the fun.',
                                style: TextStyle(
                                  height: 1.8,
                                  fontSize: 16,
                                  color: textColorLight,
                                ),
                              ),
                            ],
                          ),
                          MouseRegion(
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
                                          color: signUpButtonColor
                                              .withOpacity(0.4),
                                          spreadRadius: -12,
                                          blurRadius: 20,
                                          offset: const Offset(0, 30),
                                        )
                                      ]
                                    : [],
                              ),
                              child: TextButton(
                                child: const Text(
                                  'Subscribe Now',
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
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
