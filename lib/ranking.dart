import 'package:flutter/material.dart';


class rankingPage extends StatelessWidget {
  const rankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RankingSystem(),
    );
  }
}


class RankingSystem extends StatelessWidget {
  const RankingSystem({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,double>> rank = [
      {"김O박" : 10.3},{"이O조" : 10.2},{"조O준" : 9.8},
      {"김O주" : 9.5},{"서O성" : 9.1},{"허O보" : 8.4},
    ];
    return ListView.builder(
      itemCount: rank.length,
      itemBuilder: (BuildContext cxt, int idx) {
          return Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rank[idx].keys.toString()),
                Text(rank[idx].values.toString()),
              ],
            ),
            color: idx == 0 ? Colors.yellow : idx == 1 ? Colors.grey : idx == 2 ? Colors.brown : Colors.lightBlueAccent
          );
      },
    );
  }
}

