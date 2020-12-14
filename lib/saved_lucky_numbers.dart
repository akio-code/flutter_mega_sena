import 'package:flutter/material.dart';
import 'package:flutter_mega_sena/lucky_numbers_notifier.dart';
import 'package:provider/provider.dart';

class SavedLuckyNumbersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        LuckyNumbersNotifier notifier,
        Widget child,
      ) {
        return ListView.builder(
          itemCount: notifier.savedLuckyNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            List<int> game = notifier.savedLuckyNumbers[index];
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 16.0,
              ),
              height: 50.0,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: game.length,
                      itemBuilder: (BuildContext context, int numberIndex) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: ShapeDecoration(
                            color: Colors.black12,
                            shape: CircleBorder(),
                          ),
                          child: Center(
                            child: Text(
                              game[numberIndex].toString().padLeft(2, '0'),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 5,
                          height: 5,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 45.0,
                    height: 45.0,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 20.0,
                        ),
                        color: Colors.grey,
                        padding: EdgeInsets.zero,
                        onPressed: () => notifier.removeSavedLuckyNumber(index),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(),
    );
  }
}
