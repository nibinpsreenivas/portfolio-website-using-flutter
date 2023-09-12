import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'responsive_widget.dart';
import '../data/projects.dart';
import '../config/styles.dart';
import '../config/colors.dart';

class MyProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      desktopScreen: Container(
        // color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            Text(
              'MY PROJECTS',
              style: AppStyles.title,
              selectionColor: Colors.cyan,
            ),
            Container(width: 100, height: 2, color: Colors.cyan),
            const SizedBox(height: 3),
            Container(width: 75, height: 2, color: Colors.cyan),
            const SizedBox(height: 50),
            ...PROJECTS.map((p) => _buildProject(context, p)).toList(),
          ],
        ),
      ),
      mobileScreen: Container(
        //color: AppColors.greyLight,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .15,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              'MY PROJECTS',
              style: AppStyles.title,
              textAlign: TextAlign.center,
            ),
            Container(width: 75, height: 2, color: AppColors.yellow),
            const SizedBox(height: 3),
            Container(width: 50, height: 2, color: AppColors.yellow),
            const SizedBox(height: 50),
            Wrap(
              children: PROJECTS.map((p) => _buildProject(context, p)).toList(),
              spacing: 5,
              runSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProject(BuildContext context, Project project) =>
      ResponsiveWidget(
        desktopScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .3,
                    child: Image.asset(project.image!),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .075),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(project.name!, style: AppStyles.title),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .01,
                        ),
                        Text(
                          project.description!,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        Wrap(
                          spacing: 10,
                          children: project.skills!
                              .map((s) => Chip(label: Text(s)))
                              .toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .025,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            launch(project.url!);
                          },
                          child: Text('Visit'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            primary: Colors
                                .cyan, // Change this color to your desired background color
                            onPrimary: Colors
                                .white, // Change this color to your desired text color
                            // You can customize other visual properties here as well
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
        mobileScreen: SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * .75,
                child: Image.asset(project.image!),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * .075),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(project.name!, style: AppStyles.title),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Text(
                project.description!,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children:
                    project.skills!.map((s) => Chip(label: Text(s))).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .025,
              ),
              ElevatedButton(
                onPressed: () {
                  launch(project.url!);
                },
                child: Text('Visit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  primary: Colors
                      .cyan, // Change this color to your desired background color
                  onPrimary: Colors
                      .white, // Change this color to your desired text color
                  // You can customize other visual properties here as well
                ),
              ),
              Divider(
                color: Colors.white,
                height: 50,
                thickness: 1,
              ),
            ],
          ),
        ),
      );
}
