import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompaniesEditPage extends StatelessWidget {
  get companyId => Get.parameters["id"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar empresa'),
      ),
      body: Container(
        child: Text('Id recebido $companyId'),
      ),
    );
  }
}
