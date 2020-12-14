import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/lucky_numbers_notifier.dart';
import 'package:provider/provider.dart';

class LuckyNumbers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LuckyNumbersNotifier>(
      builder: (
        BuildContext context,
        LuckyNumbersNotifier notifier,
        Widget child,
      ) {
        const double numberFontSize = 25.0;
        const double btnSize = 18.0;

        return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: notifier.luckyNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: btnSize / 2,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Text(
                    notifier.luckyNumbers[index].toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: numberFontSize,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: btnSize * 2),
                  child: SizedBox(
                    height: btnSize,
                    width: btnSize,
                    child: Ink(
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: btnSize,
                        ),
                        color: Colors.grey,
                        padding: EdgeInsets.zero,
                        onPressed: () => notifier.removeLuckyNumber(index),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 5,
              height: 5,
              // color: Colors.black12,
            );
          },
        );
      },
    );
  }
}
