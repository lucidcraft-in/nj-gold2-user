import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nj_gold_user/screens/homeNavigation.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'providers/banner.dart';
import 'providers/category.dart';
import 'providers/goldrate.dart';
import 'providers/payment.dart';
import 'providers/paymentBill.dart';
import 'providers/paymentConfi.dart';
import 'providers/phonePe_payment.dart';
import 'providers/product.dart';
import 'providers/staff.dart';
import 'providers/transaction.dart';
import 'providers/user.dart';
import 'screens/newHomeScreen.dart';

class GoldJewelryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => User(),
        ),
        ChangeNotifierProvider(
          create: (_) => Transaction(),
        ),
        ChangeNotifierProvider(
          create: (_) => Goldrate(),
        ),
        ChangeNotifierProvider(
          create: (_) => Product(),
        ),
        ChangeNotifierProvider(
          create: (_) => Payment(),
        ),
        ChangeNotifierProvider(
          create: (_) => Staff(),
        ),
        ChangeNotifierProvider(
          create: (_) => BannerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => phonePe_Payment(),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentBillProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Category(),
        ),
        ChangeNotifierProvider(create: (_) => PaymentDetails())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gold Jewelry Store',
        theme: ThemeData(
          primaryColor: Color(0xFF6a1b1e),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF9f0005)),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.light(
            primary: Color(0xFF9f0005),
            secondary: Color(0xFF81C784),
          ),
        ),
        // home: HomePage(),
        home: HomeNavigation(),
      ),
    );
  }
}
