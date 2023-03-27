import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/data/models/airline.dart';
import 'package:flutter_template/ui/themes/text_styles.dart';

class AirlineItem extends StatelessWidget {
  final Airline airline;
  const AirlineItem({Key? key, required this.airline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.w,
      child: Row(children: [
        SizedBox(
          width: 60.w,
          child: Image.network(
            airline.logoUrl,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                airline.name,
                style: textH4,
              ),
              Text(
                "ICAO: ${airline.icao} - IATA: ${airline.iata}",
                style: textInput,
              )
            ])
      ]),
    );
  }
}
