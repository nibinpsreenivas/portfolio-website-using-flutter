import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/skills.dart';
import '../config/constants.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class About extends StatelessWidget {
  final String _avatar = 'images/icon.jpg';
  final String _description =
      "I am developer with interest in  developing mobile and web applications, using flutter.";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1510519138101-570d1dca3d66?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2047&q=80"),
              fit: BoxFit.cover,
            ),
          ),
          //color: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 100,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: AppColors.greyLight,
                      child: Image.asset(
                        _avatar,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT ME',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _description,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('HIRE ME NOW'),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: _downloadCV,
                              child: Text('VIEW RESUME'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 100, height: 2, color: AppColors.yellow),
              const SizedBox(height: 3),
              Container(width: 75, height: 2, color: AppColors.yellow),
              const SizedBox(height: 50),
              Wrap(
                spacing: 25,
                runSpacing: 25,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
        mobileScreen: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
            vertical: 50,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                  color: AppColors.greyLight,
                  child: Image.asset(
                    _avatar,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'ABOUT ME',
                style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _description,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 13,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: Text('HIRE ME NOW'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  primary: Colors
                      .cyan, // Change this color to your desired background color
                  onPrimary: Colors
                      .white, // Change this color to your desired text color
                  // You can customize other visual properties here as well
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _downloadCV,
                child: Text('VIEW RESUME'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  primary: Colors
                      .cyan, // Change this color to your desired background color
                  onPrimary: Colors
                      .white, // Change this color to your desired text color
                  // You can customize other visual properties here as well
                ),
              ),
              const SizedBox(height: 50),
              Text('MY SKILLS', style: AppStyles.title),
              Container(width: 75, height: 2, color: Colors.cyan),
              const SizedBox(height: 3),
              Container(width: 50, height: 2, color: Colors.cyan),
              const SizedBox(height: 25),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: SKILLS.map(_buildSkill).toList(),
              ),
            ],
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }

  Widget _buildSkill(Skill skill) => Chip(label: Text(skill.name!));
}
