import 'package:flutter/material.dart';
import 'package:profile/ui/responsive_widget.dart';

import '../config/styles.dart';
import '../config/colors.dart';
import 'icon.dart';

class WorkingProcess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 100,
        ),
        child: Column(
          children: [
            Text('EDUCATION', style: AppStyles.title),
            Container(width: 100, height: 2, color: Colors.cyan),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: Colors.cyan),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: __buildProcess(
                      context,
                      '01.',
                      'icons/college.png',
                      'B Tech CSE',
                      'B.Tech Computer Science & Engineering 2020-Present College of Engineering Chengannur,CGPA 9.1'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildProcess(
                      context,
                      '02.',
                      'icons/college.png',
                      'HSE',
                      '12th board Computer Science 2018 - 2020 NSS Higher Secondary School, Kunnamthanam 88 % DHSE'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: __buildProcess(
                      context,
                      '03.',
                      'icons/coding.png',
                      'Code',
                      'Been coding on leetcode and hacker rank for a while now.completed 100+ codein both '),
                )
              ],
            ),
          ],
        ),
      ),
      mobileScreen: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'Education',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            __buildProcess(context, '01.', 'icons/college.png', 'B Tech CSE',
                'B.Tech Computer Science & Engineering 2020-Present College of Engineering Chengannur,CGPA 9.1'),
            const SizedBox(height: 10),
            __buildProcess(context, '02.', 'icons/college.png', 'HSE',
                '12th board Computer Science 2018 - 2020 NSS Higher Secondary School, Kunnamthanam 88 % DHSE'),
            const SizedBox(height: 10),
            __buildProcess(context, '03.', 'icons/coding.png', 'Code',
                'Been coding on leetcode and hacker rank for a while now.completed 100+ codein both '),
          ],
        ),
      ),
    );
  }

  Widget __buildProcess(BuildContext context, String index, String iconPath,
      String title, String description) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                index,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: AppColors.greyLight),
            const SizedBox(height: 10),
            AppIcon(iconPath, color: AppColors.black, size: 40),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
