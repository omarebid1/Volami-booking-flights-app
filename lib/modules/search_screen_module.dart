import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components/components.dart';
import '../shared/cubit/search_screen_cubit.dart';

class SearchScreenModule extends StatelessWidget {
  const SearchScreenModule({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchScreenCubit, SearchScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchScreenCubit cubit = SearchScreenCubit.get(context);
        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 30,
                  bottom: 120,
                ),
                color: const Color(0xFF161E36),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    const Text(
                      'Search Flight',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0, bottom: 0),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF2B3550),
                                child: Transform.rotate(
                                  angle: (pi / 4),
                                  child: const Icon(
                                    Icons.airplanemode_active,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Column(
                                children: List.generate(
                                  10, // Number of dots you want
                                  (index) => Container(
                                    margin: const EdgeInsets.only(bottom: 3),
                                    width: 2,
                                    height: 2,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF2B3550),
                                child: Transform.rotate(
                                  angle: 5 * (pi / 4),
                                  child: const Icon(
                                    Icons.airplanemode_active,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.white54), // Adjust as needed
                                  ),
                                  labelText: 'From',
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.3),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 200,
                              padding: const EdgeInsets.only(bottom: 30),
                              child: TextFormField(
                                cursorColor: Colors.white,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white54),
                                  ),
                                  labelText: 'To',
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.3),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height / 2) - 100,
              left: 30,
              right: 30,
              child: Container(
                height: (MediaQuery.of(context).size.height / 2) - 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 60,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (cubit.selectedFlightType == 1)
                                        ? const Color(0xFF161E36)
                                        : const Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'Round Trip',
                                      style: TextStyle(
                                        color: (cubit.selectedFlightType == 1)
                                            ? Colors.white
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  cubit.changeFlightType(selectedFlightType: 1);
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (cubit.selectedFlightType == 2)
                                        ? const Color(0xFF161E36)
                                        : const Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'One Way',
                                      style: TextStyle(
                                        color: (cubit.selectedFlightType == 2)
                                            ? Colors.white
                                            : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  cubit.changeFlightType(selectedFlightType: 2);
                                },
                              ),
                            ),
                          ],
                        ),
                      ), //(Round trip / one way)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: TextFormField(
                                readOnly: true,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now()
                                        .add(const Duration(days: 90)),
                                    initialDate: DateTime.now(),
                                  ).then((value) {
                                    cubit.departureController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Departure',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: cubit.departureController,
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: TextFormField(
                                readOnly: true,
                                enabled: cubit.selectedFlightType == 1,
                                onTap: () {
                                  if (cubit.selectedFlightType == 1) {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 90)),
                                      initialDate: DateTime.now(),
                                    ).then((value) {
                                      cubit.returnController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Return',
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: cubit.returnController,
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                          ],
                        ),
                      ), //(the date of departure and return)
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: DropdownButtonFormField<String>(
                          value: cubit.selectedClass,
                          items: cubit.items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            cubit.changeClassType(selectedClass: value!);
                          },
                          decoration: InputDecoration(
                            labelText: 'Class',
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey), // Customize border color
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .grey), // Customize enabled border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Colors
                                      .grey), // Customize focused border color
                            ),
                          ),
                        ),
                      ), // the class
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: defaultButton(
                            function: () {
                              Navigator.pushNamed(context, '/search_result');
                            },
                            text: 'Search',
                            background: const Color(0xFFFF8B3D),
                            radius: 10),
                      ) // the search button
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
