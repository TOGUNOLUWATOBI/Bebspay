import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDetailsContainer extends StatelessWidget {
  final String header;
  final String value;
  const MyDetailsContainer(
      {super.key, required this.header, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Copied to clipboard !')));
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 10),
        //margin: EdgeInsets.symmetric(horizontal:  2),
        // decoration: BoxDecoration(
        //   border: Border(bottom: BorderSide(color: Color(0xffA9A5AF), width: 2)),
        // ),
        child: Row(
          children: [
            Text(
              header,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                  color: Color(0xffA9A5AF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
