import 'dart:async';

import 'package:flutter_riverpod/all.dart';
import 'package:market_wiz_flutter/common/utils.dart';
import 'package:market_wiz_flutter/data/database/database.dart';
import 'package:market_wiz_flutter/data/repository.dart';

final portfolioPositionsProvider =
    StateNotifierProvider<PortfolioProvider>((ref) {
  final _repository = ref.watch(repositoryProvider);
  final _portfolioController = ref.watch(portfolioController);
  return PortfolioProvider(_repository, _portfolioController);
});

class PortfolioProvider extends StateNotifier<AsyncValue<PositionItemData>> {
  PortfolioProvider(this._repository, this._portfolioController,
      [AsyncValue<PortfolioProvider> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;
  final PortfolioController _portfolioController;

  Stream<List<PositionItemData>> watchPositions() =>
      _repository.watchPortfolioPositions();

  void updatePositions() => _repository.updatePortfolioItems();

  void removePosition(PortfolioData portfolio, PositionItemData position) {
    print('remove position ${position.toString()}');
    _portfolioController.updatePLOnClosePosition(portfolio, position);
    _repository.removePosition(position);
  }
}

final portfolioController = StateNotifierProvider<PortfolioController>((ref) {
  final _repository = ref.watch(repositoryProvider);
  return PortfolioController(_repository);
});

class PortfolioController extends StateNotifier<AsyncValue<PortfolioData>> {
  PortfolioController(this._repository, [AsyncValue<PortfolioController> state])
      : super(state ?? AsyncValue.data(null));

  final MarketDataRepository _repository;

  Stream<PortfolioData> watchPortfolio() => _repository.watchPortfolio();

  void initPortfolio() => _repository.initPortfolio();

  void updatePLOnClosePosition(
      PortfolioData portfolio, PositionItemData position) async {
    final change = getNetPl(position);

    final double openChange =
        roundDouble((portfolio.openPositionsPL - change), 2);
    final double closeChange =
        roundDouble(portfolio.closedPositionsPL + change, 2);

    _repository.updatePortfolio(portfolio, openChange, closeChange);
  }
}
