import 'package:flutter/material.dart';

import 'common/responsive/desktop_body.dart';
import 'common/responsive/mobile_body.dart';
import 'common/responsive/responsive_layout.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileBody(),
      desktopBody: DesktopBody(),
    );
  }
}
