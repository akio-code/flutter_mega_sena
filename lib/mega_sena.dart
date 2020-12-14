import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/lucky_numbers.dart';
import 'package:flutter_mega_sena/lucky_numbers_controls.dart';
import 'package:flutter_mega_sena/lucky_numbers_notifier.dart';
import 'package:flutter_mega_sena/saved_lucky_numbers.dart';
import 'package:provider/provider.dart';

class MegaSenaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => LuckyNumbersNotifier(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.black12,
                  child: LuckyNumbers(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<LuckyNumbersNotifier>(
                      builder: (
                        BuildContext context,
                        LuckyNumbersNotifier notifier,
                        Widget child,
                      ) {
                        return Text('valor: ${notifier.gamePrice}');
                      },
                    ),
                    Container(
                      // height: 50,
                      child: LuckyNumbersControls(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 6,
                child: SavedLuckyNumbersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
