import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../size_config.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.ticketDescription,
    required this.amount,
    this.timeCreated,
    this.dateCreated,
    required this.isDebit,
  });

  final String? ticketDescription;
  final int? amount;
  final String? timeCreated;
  final String? dateCreated;
  final bool? isDebit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: add navigation to transaction details page
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isDebit! ? Color(0xffFF2A52) : Color(0xff17B899))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(isDebit! ? "assets/images/DebitIcon.svg" : "assets/images/CreditIcon.svg"),
            Column(
             // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text(
                    ticketDescription!,
                    style: TextStyle(
                            color: Color(0xffA9A5AF),
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/clock.svg",
                      height: getProportionateScreenHeight(30),
                      width: getProportionateScreenWidth(30),),
                      SizedBox(width: getProportionateScreenWidth(7)),
                      Text(
                        '$dateCreated,',
                        style: TextStyle(
                          color: Color(0xffA9A5AF),
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                      ),
                      Text(' $timeCreated',
                          style: TextStyle(
                          color: Color(0xffA9A5AF),
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text(
              isDebit! ? '- $amount' : '+ $amount',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: isDebit! ? Color(0xffFF2A52) : Color(0xff17B899), fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}