import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/constants.dart';
import 'package:market_wiz_flutter/common/text_themes.dart';
import 'package:market_wiz_flutter/controllers/details_controller.dart';
import '../../../common/utils.dart';

class TradeDialog extends ConsumerWidget {
  final TextEditingController _textInputController = TextEditingController();
  final double lastPrice;
  final String symbol;

  TradeDialog({this.symbol, this.lastPrice, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tradeDialogController = watch(tradeDialogProvider);
    final numberOfSharesNotifier = watch(numberOfSharesNotifierProvider);
    final numOfShares = watch(numberOfSharesNotifierProvider.state);

    _textInputController.addListener(() {
      if (_textInputController.text.isNotEmpty) {
        String input = _textInputController.text;
        numberOfSharesNotifier.inputNumber(int.parse(input));
      } else {
        numberOfSharesNotifier.inputNumber(0);
      }
    });
    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Wrap(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'SYMBOL',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    child: TextField(
                      controller: _textInputController,
                      decoration: InputDecoration(hintText: 'number of shares'),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${roundDouble(lastPrice, 2)}\$',
                    style: TextThemes.dataSheetvaluesStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Total: ${roundDouble(lastPrice * numOfShares, 2)}\$',
                    style: TextThemes.dataSheetTitleStyle(context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        child: Text(
                          'Long',
                          style: TextThemes.primaryButtonStyle(context),
                        ),
                        onPressed: () {
                          if (numOfShares > 0) {
                            tradeDialogController.editData(
                                symbol,
                                symbol,
                                lastPrice,
                                lastPrice,
                                numOfShares,
                                POSITION_TYPE_LONG);
                            tradeDialogController.createPosition();
                            numberOfSharesNotifier.clear();
                            Navigator.pop(context);
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text(
                          'Short',
                          style: TextThemes.primaryButtonStyle(context),
                        ),
                        onPressed: () {
                          if (numOfShares > 0) {
                            tradeDialogController.editData(
                                symbol,
                                symbol,
                                lastPrice,
                                lastPrice,
                                numOfShares,
                                POSITION_TYPE_SHORT);
                            tradeDialogController.createPosition();
                            numberOfSharesNotifier.clear();
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
