import 'package:flutter/material.dart';
import 'package:lasles_vpn_website/sections/help-section/help_section.dart';
import 'sections/nav-bar/nav_bar.dart';
import 'sections/pricing-section/pricing_section.dart';
import 'sections/testimonials-section/testimonials_section.dart';

import 'sections/about-section/about_section.dart';
import 'sections/features-section/features_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: const [
              NavBar(),
              SizedBox(height: 110),
              AboutSection(),
              SizedBox(height: 110),
              FeaturesSection(),
              SizedBox(height: 110),
              PricingSection(),
              SizedBox(height: 110),
              TestimonialsSection(),
              SizedBox(height: 110),
              HelpSection(),
            ],
          ),
        ],
      ),
    );
  }
}
