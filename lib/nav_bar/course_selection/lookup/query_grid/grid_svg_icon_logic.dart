import 'package:flutter_svg/flutter_svg.dart';

class GridSvgIconLogic {
  SvgPicture getStatusIcon(num numeric, int totalNumeric, int cautionRatio,
      bool isRMP, isSmallWidget) {
    String iconName = '';
    switch (isRMP) {
      case true:
        if (numeric >
                totalNumeric - (totalNumeric / (cautionRatio * cautionRatio)) &&
            numeric < totalNumeric) {
          iconName = 'checkmark_circle_outline';
        } else if (numeric >= totalNumeric / cautionRatio &&
            numeric <
                totalNumeric - (totalNumeric / (cautionRatio * cautionRatio))) {
          iconName = 'caution_rounded_triangle_outline';
        } else {
          iconName = 'error_circle_outline';
        }
        break;
      case false:
        if (numeric > 0 && numeric < totalNumeric / cautionRatio) {
          iconName = 'checkmark_circle_outline';
        } else if (numeric >= totalNumeric / cautionRatio &&
            numeric < totalNumeric) {
          iconName = 'caution_rounded_triangle_outline';
        } else {
          iconName = 'error_circle_outline';
        }
        break;
    }

    return SvgPicture.asset(
      'svgs/$iconName.svg',
      height: isSmallWidget ? 12 : 14,
      width: isSmallWidget ? 12 : 14,
    );
  }
}