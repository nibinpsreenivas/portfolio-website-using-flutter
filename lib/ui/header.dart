import 'package:flutter/material.dart';
import 'package:profile/ui/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/constants.dart';
import '../config/colors.dart';

class Header extends StatelessWidget {
  final String _name = "  Nibin P Sreenivas";
  final String _job = "Flutter Developer";
  final String _description =
      "I am developer with interest in  developing mobile and web applications, using flutter.";

  @override
  Widget build(BuildContext context) => ResponsiveWidget(
        desktopScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I’m $_name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                _job,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  _description,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey[100],
                        fontSize: 17,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _downloadCV,
                child: Text('Download Resume'),
                style: ElevatedButton.styleFrom(
                  primary: Colors
                      .cyan, // Change this color to your desired background color
                  onPrimary: Colors
                      .white, // Change this color to your desired text color
                  // You can customize other visual properties here as well
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        mobileScreen: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15,
          ),
          child: FittedBox(
            child: Column(
              children: [
                Text(
                  'I’m $_name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  _job,
                  style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    _description,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.grey[100],
                          fontSize: 15,
                          height: 1.8,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _downloadCV,
                  child: Text('Download resume'),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      );

  void _downloadCV() {
    launch(AppConstants.cv);
  }
}
