import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalificationWidget extends StatelessWidget {
  final double size;
  final int rating;
  const CalificationWidget({
    super.key,
    required this.size,
    required this.rating,
  });

  Color _getColor() {
    if (rating < 50) {
      return Colors.red;
    } else if (rating < 75) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Circular progress indicator, the color is based on the percetage of the rating, 0 to 50% red, 50 to 75% yellow, 75 to 100% green, with the value on the center
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: (rating / 100),
              valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
              //add more size
            ),
          ),
          Center(
            child: Text(
              rating.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24 * (size / 60),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
