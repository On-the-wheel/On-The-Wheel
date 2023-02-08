import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage_FAQ extends StatelessWidget {
  const MyPage_FAQ({Key? key}) : super(key: key);
  final imageUrl1 = 'https://s3-alpha-sig.figma.com/img/7e62/21e6/b66f076abc8c42787d3343a22987d8be?Expires=1676246400&Signature=UDEA3OVmYCYzhlV2QFwfb4HIA2DUI~8byJ2YtkSdYXsMDDxzv9zyaVjtDgspv0HS8H0bKq52aLSu23dQ1JCTJ0y7vioLlWuDPBIlrxMKY55rax-p-dZrI6M8au5clCPzeqFTcCd4217pPIo7C-tK61eBdkgKuyKCdh7q5yetV7AKuc2Jn85MqjoC-2tB4nMsStGqAAwUYvTUnyt56DfExgLtxGZI0~EAiBCY44BzQmdh6M6o0ZDmKr5UPoRzfQpCPuvjks9YBTTOijmFNQ36D7Ypeu9-PnuB3nhsSu8cEcY28JTIEQIq6qZ~IsiVi4bKLViz3tYOJHt54kzpFP5fxA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 49,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius:40,
                  backgroundImage: NetworkImage(imageUrl1),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [

                    Text(
                        '온더휠 님',
                        style: TextStyle(
                            fontSize: 15
                        )
                    ),
                    Text(
                        'Lv.3',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF968686)
                        )
                    ),
                    Text(
                        '회원정보수정',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF968686)
                        )
                    )

                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black,
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
                child:
                Row(
                  children: [
                    Text('FAQ', style: TextStyle(fontSize: 13),)
                  ],
                )
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              'F1. 장소 정보가 변경 됐어요',
              style: TextStyle(
                  fontSize: 23
              ),
            ),

            Divider(
                color: Colors.grey,
                indent: 15,
                endIndent: 15
            ),
            Text(
              'Q1. 정보 수정으로 정보를 변경해주세요.',
              style: TextStyle(
                  fontSize: 23
              ),
            ),

          ],
        )
    );
  }
}