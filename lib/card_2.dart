import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardWidget extends StatelessWidget {
  final Color bcolor;
  final Color tcolor;
  final String topText;
  final List<String> lines;
  final String buttonText;

  const CustomCardWidget({
    super.key,
    required this.bcolor,
    required this.tcolor,
    required this.topText,
    required this.lines,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        color: const Color(0xFF482F82),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  // ignore: use_full_hex_values_for_flutter_colors
                  colors: [Color(0xFF482F82), Color(0xff2418415c)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          height: 247,
          width: 340,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://seeklogo.com/images/S/stc-logo-D915166FCB-seeklogo.com.png',
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "STC eSIM",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 126),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD6D6D6),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              topText,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Center(
                child: Container(
                  color: Colors.white.withOpacity(0.3),
                  height: 0.3,
                  width: 340,
                ),
              ),
              const SizedBox(height: 6),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "coverage".tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                "data".tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                "validity".tr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: lines
                              .map((line) => Text(
                                    line,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 12),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: bcolor,
                    fixedSize: const Size(380, 50),
                  ),
                  child: Text(
                    buttonText.tr,
                    style: TextStyle(
                        color: tcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
