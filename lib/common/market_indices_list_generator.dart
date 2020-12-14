// const SP = "ES";
// const NASDAQ = "NQ";
// const DOWJ = "YM";
// const RUSS = "QR";

abstract class IndicesGenerator {
  static const _indicesBase = ["ES", "NQ", "YM", "QR"];
  static generateList() {
    DateTime date = DateTime.now();

    final month = date.month;
    final year = date.year - 2000;

    var quarter;

    switch (month) {
      case 1:
      case 2:
      case 3:
        quarter = "H";
        break;
      case 4:
      case 5:
      case 6:
        quarter = "M";
        break;
      case 7:
      case 8:
      case 9:
        quarter = "U";
        break;
      default:
        quarter = "Z";
        break;
    }

    String indicesQuery = '';
    for (String i in _indicesBase) {
      indicesQuery += '$i$quarter$year,';
    }
    print(indicesQuery);

    return indicesQuery;
  }
}
