import 'package:flutter/material.dart';

class UserAvatarPlaceholder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - 50,
      top: 30,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.black12,
                )),
          ),
          SizedBox(height: 10),
          Container(
            width: 100,
            height: 20,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
