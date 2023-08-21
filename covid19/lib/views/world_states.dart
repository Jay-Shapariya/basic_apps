
import 'package:covid19/views/countries_list_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19/models/world_state_model.dart';
import 'package:covid19/services/state_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 5), () {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const WorldStatesScreen(),
    //       ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    final colorList = <Color>[
      const Color(0xff4285F6),
      const Color(0xff1aa260),
      const Color(0xffde5246),
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            FutureBuilder(
              future: statesServices.fetchWorldStateRecord(),
              builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      flex: 1,
                      child: SpinKitCircle(
                        color: Colors.white,
                        controller: _controller,
                        size: 50,
                      ));
                } else {
                  return Column(
                    children: [
                      PieChart(
                        dataMap: {
                          "Total": double.parse(snapshot.data!.cases!.toString()),
                          "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                          "Deaths": double.parse(snapshot.data!.deaths!.toString()),
                        },
                        chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: true),
                        animationDuration: const Duration(microseconds: 1200),
                        chartType: ChartType.ring,
                        colorList: colorList,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .06),
                        child: Card(
                          child: Column(
                            children: [
                              ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                              ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                              ReusableRow(title: 'Recoverd', value: snapshot.data!.recovered.toString()),
                              ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                              ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                              ReusableRow(title: 'Today deathes', value: snapshot.data!.todayDeaths.toString()),
                              ReusableRow(title: 'Todat cases', value: snapshot.data!.todayCases.toString()),
                              ReusableRow(title: 'Today Recoverd', value: snapshot.data!.todayRecovered.toString()),

                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesListScreen(),));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}

// ignore: must_be_immutable
class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}
