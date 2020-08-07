import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/pages/companies/companies_create_page.dart';
import 'package:getx_test_flutter/pages/companies/companies_edit_page.dart';
import 'package:getx_test_flutter/pages/companies/companies_page.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: ThemeData(primaryColor: Colors.black),
    defaultTransition: Transition.fade,
    getPages: [
      GetPage(name: '/', page: () => CompaniesPage()),
      GetPage(name: '/company/edit/:id', page: () => CompaniesEditPage()),
      GetPage(name: '/company/create/', page: () => CompaniesCreatePage()),
    ],
  ));
}
