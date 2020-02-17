import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weddy/app/shared/styles/app_styles.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2, left: 2),
              width: double.infinity,
              height: 180,
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Modular.to.pop(),
                    color: AppStyles.primaryColor,
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    top: 10,
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: AppStyles.primaryColor, width: 3),
                            image: DecorationImage(
                              image: AssetImage("assets/img/wedding-image.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Felipe Nobre",
                          style: AppStyles.body_text,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemBuilder: (BuildContext context, int index) {
                  //** POST ITEMS **/
                  return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Colors.black54, width: 0.2, ),
                          image: DecorationImage(
                            image: AssetImage("assets/img/wedding-image.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () => Modular.to.pushNamed("/post"),
                    
                  );
                },
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
