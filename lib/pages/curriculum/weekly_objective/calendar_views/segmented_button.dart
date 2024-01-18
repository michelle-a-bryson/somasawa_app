import 'package:flutter/material.dart';


//component for the segmented button
class segmentedButton extends StatelessWidget {
  const segmentedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 48,
          padding: const EdgeInsets.all(2),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFFE6EBEB),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 108,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: ShapeDecoration(
                  color: Color(0xFFEAEDFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 92,
                      height: 16,
                      child: Text(
                        'Monthly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF202A56),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 108,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 92,
                      height: 16,
                      child: Text(
                        'Weekly',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3D4DA1),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 108,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 92,
                      height: 16,
                      child: Text(
                        'Daily',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3D4DA1),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          height: 0.10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}