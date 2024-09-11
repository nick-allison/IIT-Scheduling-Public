import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          child: InkWell(
            highlightColor: Colors.blue.withOpacity(0.4),
            splashColor: Colors.green.withOpacity(0.5),
            onTap: () {
              // pushNewScreenWithRouteSettings(
              //   context,
              //   settings: const RouteSettings(name: '/home'),
              //   screen: const UIColorPalettePage(),
              //   pageTransitionAnimation: PageTransitionAnimation.scaleRotate,
              // );
            },
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: MediaQuery.of(context).size.width * 0.10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jane Doe",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .03,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "JaneDoe@test.com",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .03,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.1,
                    endIndent: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}