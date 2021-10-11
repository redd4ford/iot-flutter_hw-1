import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    var height =
        orientation == Orientation.portrait ? size.height / 8 : size.width / 10;
    var mainRowWidth = size.width / 10;
    var logoSize = orientation == Orientation.portrait
        ? size.width / 10
        : size.height / 10;
    var iconsSize =
        orientation == Orientation.portrait ? height / 4 : height / 2;

    return AppBar(
        toolbarHeight: height,
        titleSpacing: mainRowWidth,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: SvgPicture.network(
                'https://upload.wikimedia.org/wikipedia/commons/8/89/DiiaLogo.svg',
                height: logoSize,
                width: logoSize,
              ),
            ),
            Icon(
              Icons.qr_code_scanner_rounded,
              size: iconsSize,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0);
  }
}
