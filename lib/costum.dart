import 'package:flutter/material.dart';

SnackBar successSnackbar(String text) {
  return SnackBar(
    elevation: 0 ,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.greenAccent.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8 , vertical: 15),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

SnackBar failedSnackbar(String text) {
   return SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.redAccent.withOpacity(0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8 , vertical: 15),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
