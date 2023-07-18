import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:lasles_vpn_website/models/customer.dart';
// import 'package:lasles_vpn_website/sections/testimonials-section/widgets/slide_indicator.dart';

import '../../constants.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  static const arrowLeft = 'assets/images/arrow_left.svg';
  static const arrowRight = 'assets/images/arrow_right.svg';

  bool hoveredTestmonial = false;
  int selectedTestmonialIndex = 0;

  late InfiniteScrollController _scrollController;
  int _selectedIndex = 0;
  int currentCard = 0;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    _scrollController = InfiniteScrollController(initialItem: _selectedIndex);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Trusted by Thousands of\nHappy Customer',
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
        const Text(
          'These are the stories of our customers who have joined us with great\npleasure when using this crazy feature.',
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.8,
            fontSize: 16,
            color: textColorLight,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 230,
          child: InfiniteCarousel.builder(
            itemCount: customers.length,
            itemExtent: 460,
            controller: _scrollController,
            onIndexChanged: (index) {
              if (_selectedIndex != index) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            itemBuilder: (context, itemIndex, realIndex) {
              return _buildCard(itemIndex);
            },
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
          constraints: BoxConstraints(
            maxWidth: size.width * .8,
            minWidth: size.width * .6,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ...List.generate(
                    customers.length,
                    (index) => _buildDot(index),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildArrowButton(
                    context: context,
                    arrow: arrowLeft,
                    backgroundColor: Colors.transparent,
                    arrowColor: primary,
                    borderColor: primary,
                    controllerNavFunction: () async =>
                        await _scrollController.previousItem(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  _buildArrowButton(
                    context: context,
                    arrow: arrowRight,
                    backgroundColor: primary,
                    arrowColor: Colors.white,
                    borderColor: Colors.transparent,
                    controllerNavFunction: () async =>
                        await _scrollController.nextItem(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      duration: const Duration(milliseconds: 200),
      width: _selectedIndex == index ? 45 : 15,
      height: 15,
      decoration: BoxDecoration(
        color: _selectedIndex == index ? primary : dotIndicatorColor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget _buildArrowButton({
    required BuildContext context,
    required String arrow,
    required Color backgroundColor,
    required Color arrowColor,
    required Color borderColor,
    required Function controllerNavFunction,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      width: 60,
      height: 60,
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
          child: SvgPicture.asset(
            arrow,
            color: arrowColor,
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: borderColor,
              ),
            ),
          ),
          onPressed: () {
            controllerNavFunction();
          },
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          selectedTestmonialIndex = index;
          hoveredTestmonial = true;
        });
      },
      onExit: (event) {
        setState(() {
          selectedTestmonialIndex = index;
          hoveredTestmonial = false;
        });
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        duration: const Duration(milliseconds: 200),
        height: 230,
        width: 400,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.0,
            color: selectedTestmonialIndex == index && hoveredTestmonial
                ? primary
                : borderColor,
          ),
          boxShadow: selectedTestmonialIndex == index && hoveredTestmonial
              ? [
                  BoxShadow(
                    color: const Color(0xFF0D1025).withOpacity(0.02),
                    spreadRadius: -40,
                    blurRadius: 90,
                    offset: const Offset(0.0, 120),
                  )
                ]
              : [],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        
                        customers[index].image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customers[index].name,
                          style: const TextStyle(
                            fontWeight: rubikMedium,
                            fontSize: 18,
                            color: textColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          customers[index].city,
                          style: const TextStyle(
                            fontSize: 14,
                            color: textColorLight,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${customers[index].rate}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColorLight,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset('assets/images/star.svg')
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              customers[index].desc,
              style: const TextStyle(
                height: 1.8,
                fontSize: 16,
                color: textColorDark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
