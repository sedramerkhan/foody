import 'package:intl/intl.dart';

extension NumberFormatExtension on double {
  String get priceFormatWithCurrency {
    return "SYP ${NumberFormat("#,###.##").format(this)}";
  }
  String get priceFormat {
    return NumberFormat("#,###.##").format(this);
  }
}

extension NumberToList on int {
  List<int> generateList() {
    return List.generate(this, (index) => index);
  }
}


extension TwoDigitFormatting on int {
  String toTwoDigits() {
    return this < 10 ? '0$this' : '$this';
  }
}