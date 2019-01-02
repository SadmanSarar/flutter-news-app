import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/category/Category.dart';
import 'package:news_app_flutter/data/news/News.dart';
import 'package:news_app_flutter/view/page/CategoryDetailsPage.dart';
import 'package:news_app_flutter/view/page/ChangePasswordPage.dart';
import 'package:news_app_flutter/view/page/NewsDetailsPage.dart';
import 'package:news_app_flutter/view/page/PrivacyPolicyPage.dart';

enum Routes {
  HOME,
  LOGIN,
}

// ignore: non_constant_identifier_names
var ROUTE_PATH = {
  Routes.HOME: '/home',
  Routes.LOGIN: '/login',
};

class NavigateHelper {
  static navigateToNewsDetails(BuildContext context, News news) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsDetailsPage(news)),
    );
  }

  static navigateToCategoryPage(BuildContext context, Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryDetailsPage(category),
      ),
    );
  }

  static navigateToChangePasswordPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangePasswordPage(
              context: context,
            )));
  }

  static navigateToPrivacyPolicyPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PrivacyPolicyPage(),
      ),
    );
  }
}
