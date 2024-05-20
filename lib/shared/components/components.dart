import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blueAccent,
  required Function() function,
  required String text,
  double radius = 0,
  double textSize = 15,
}) =>
    Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: textSize),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String? Function(String? value)? validator,
  double? width,
  IconButton? suffixIconButton,
  bool isPassword = false,
  double borderRadiusCircular = 15,
  String? label,
  Color labelTextColor = Colors.grey,
  Color backGroundColor = Colors.white, // corrected typo in parameter name
  double fontSize = 15,
  void Function(String)? onSubmitted,
  void Function()? onTap, // corrected return type
  Icon? prefixIcon,
}) =>
    Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 0), // Offset
          ),
        ],
      ),
      width: width,
      child: TextFormField(
        onTap: onTap,
        obscureText: isPassword,
        controller: controller,
        keyboardType: textInputType,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: labelTextColor,
              fontSize: fontSize,
            ),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIconButton),
        validator: validator,
      ),
    );

Widget ticketBuilder() => Stack(
      children: [
        Container(
          width: 355,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Egypt Air',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Depart',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '12:30AM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('lib/images/egAirline.png'),
                      height: 60,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 20,
                      width: 130,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            child: Container(
                              height: 1,
                              width: 130,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 32.5,
                            child: Container(
                              height: 20,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text(
                                  '1H,30M',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[300]),
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  right: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$200',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Return',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '02:00PM',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 345,
          top: 80,
          child: Container(
            width: 10,
            height: 20,
            decoration: const BoxDecoration(
                color: Color(0xFFD9D7D7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
        ),
        Positioned(
          top: 80,
          child: Container(
            width: 10,
            height: 20,
            decoration: const BoxDecoration(
                color: Color(0xFFD9D7D7),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          ),
        ),
      ],
    );
