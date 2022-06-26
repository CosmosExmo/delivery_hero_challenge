
import 'package:delivery_hero_challenge/app/themes/light_theme.dart';
import 'package:delivery_hero_challenge/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

class DeliveryHeroChallenge extends StatelessWidget {
  const DeliveryHeroChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Hero Challenge',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}