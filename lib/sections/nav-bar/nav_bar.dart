import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const navItems = [
      'About',
      'Features',
      'Pricing',
      'Testimonials',
      'Help',
    ];

    Widget _buildNavItems(int index) {
      return Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          minWidth: 100,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              // print(navItems[index]);
            },
            child: Text(
              navItems[index],
              style: const TextStyle(
                fontSize: 16,
                color: textColorLight,
              ),
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        constraints: BoxConstraints(
          maxWidth: size.width * .8,
          minWidth: size.width * .6,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 149,
              height: 36.23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                navItems.length,
                (index) => _buildNavItems(index),
              ),
            ),
            Row(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    textButtonTheme: TextButtonThemeData(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                          (_) => Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: rubikMedium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: hovered ? signUpButtonColor : Colors.transparent,
                      width: 150,
                      height: 45,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          textButtonTheme: TextButtonThemeData(
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                (_) => Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        child: TextButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: rubikMedium,
                              color: hovered
                                  ? const Color(0xFFFFFFFF)
                                  : signUpButtonColor,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                style: BorderStyle.solid,
                                width: 1,
                                color: signUpButtonColor,
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
            )
          ],
        ),
      ),
    );
  }
}
