import 'package:flutter/material.dart';

import '../../../size_config.dart';


import 'home_header.dart';
import 'popular_product.dart';
import 'top_banner.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            HomeHeader(),



            TopBanner(),
            SizedBox(height: 30),
            PopularProducts(),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
