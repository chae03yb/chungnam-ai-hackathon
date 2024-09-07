import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class graphPage extends StatelessWidget {
  const graphPage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(height : ScreenHeight*0.05),
          Container(child: Text("내 시간",style: TextStyle(fontSize: 30),),height: ScreenHeight*0.1),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: LineChart(mainData()),
            ),
          ),
          SizedBox(height: ScreenHeight*0.1,),
          Container(
            child: BtnShow(),
          ),
          SizedBox(height: ScreenHeight*0.1,)
        ],
      ),

    );
  }
}


LineChartData mainData() {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: Colors.grey,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 4,
    minY: 0,
    maxY: 17,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 4),
          FlSpot(1, 7),
          FlSpot(2, 5),
          FlSpot(3, 3),
          FlSpot(4, 1),
        ],
        isCurved: true,
        barWidth: 5,
        isStrokeCapRound: true,
        color: Colors.black,
        dotData: const FlDotData(
          show: true,

        ),
        belowBarData: BarAreaData(
          show: true,

        ),
      ),
    ],
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 3:
      text = const Text('어제', style: style);
      break;
    case 4:
      text = const Text('오늘', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;

  switch (value.toInt()) {
    case 0:
      text = '0h';
      break;
    case 5:
      text = '5h';
      break;
    case 10:
      text = '10h';
      break;
    case 15:
      text = '15h';
      break;
    default:
      return Container();
  }
  return Text(text, style: style, textAlign: TextAlign.left);
}

class BtnShow extends StatelessWidget {
  const BtnShow({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        child: Container(
          height: ScreenHeight*0.1,
          width: ScreenWidth-80,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          padding: EdgeInsets.only(top: ScreenHeight*0.1/4),
          child: Text("나쁜 자세 보기",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
        ),
        onTap: () {
          
        },
      ),
    );
  }
}
