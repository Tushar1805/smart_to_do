import 'package:core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_to_do_app/resources/app_image.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ongoing = [
      {
        'priority': 1, // * 1 - high,  0 -  low
        'name': 'Vidfin App Wireframe',
        'startTime': '10:00 AM',
        'endTime': '06:00 PM',
        'due': 'August 25',
        'completion_percentage': 82,
      },
      {
        'priority': 0, // * 1 - high,  0 -  low
        'name': 'Marketing Website',
        'startTime': '10:00 AM',
        'endTime': '06:00 PM',
        'due': 'August 25',
        'completion_percentage': 82,
      },
      {
        'priority': 1, // * 1 - high,  0 -  low
        'name': 'Todo App',
        'startTime': '10:00 AM',
        'endTime': '06:00 PM',
        'due': 'August 25',
        'completion_percentage': 82,
      },
    ];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryFixedDim),
                children: [
                  TextSpan(
                    text: ' Tushar 👋',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w900, fontSize: 22),
                  ),
                ],
              ),
              textScaler: TextScaler.linear(1.1),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width * 0.8,
              child: Text(
                'Manage Your Daily Tasks',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 43,
                    ),
                // textScaler: TextScaler.linear(0.8),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: size.height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: mobileBackgroundOpacity,
                          blurRadius: 100,
                          spreadRadius: 1,
                          offset: Offset(15, 25),
                        ),
                      ],
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 30,
                      color: mobileBackground,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                mobilePic,
                                height: 90,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Spacer(),
                            Text(
                              'Mobile',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '6 Tasks',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black45),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height * 0.115,
                        width: size.width * 0.55,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 30,
                          color: wireframeBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    wireframePic,
                                    height: 70,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wireframe',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      '12 Tasks',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.115,
                        width: size.width * 0.55,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 30,
                          color: websiteBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    websitePic,
                                    height: 70,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Website',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      '5 Tasks',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            //* next section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongoing',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ongoing.length,
                itemBuilder: (final context, final index) {
                  final item = ongoing[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(25),
                      height: size.height * 0.23,
                      decoration: BoxDecoration(
                        color: primaryContainerColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: item['priority'] == 1 ? Colors.red : Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item['priority'] == 1 ? 'High' : 'Medium',
                                  style: Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                              Text(
                                '${item['completion_percentage']} %',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.white70),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            item['name'].toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule_rounded,
                                color: Colors.white70,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${item['startTime']} - ${item['endTime']}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Due Date: ',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              Text(
                                item['due'].toString(),
                                style: Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
