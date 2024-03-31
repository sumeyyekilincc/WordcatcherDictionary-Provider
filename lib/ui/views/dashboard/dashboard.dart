import 'package:dictionary/ui/views/dashboard/vm_dashboard.dart';
import 'package:dictionary/ui/widgets/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/core/resources/r.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DashboardPage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vmDashboard = Provider.of<VMDashboard>(context);

    return Consumer<VMDashboard>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          backgroundColor: R.appColor.clr.indigo,
          appBar: AppBar(
            backgroundColor: R.appColor.clr.mediumpurple,
            title: Text("Wordcatcher Dictionary",
                style: R.textStyles.searchTextStyle),
          ),
          body: _getBody(vmDashboard, context),
        ),
      ),
    );
  }

  SingleChildScrollView _getBody(
      VMDashboard vmDashboard, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchArea(vmDashboard, context),
            const SizedBox(
              height: 40,
            ),
            _subData(context, vmDashboard)
          ],
        ),
      ),
    );
  }

  ClipRRect _subData(BuildContext context, VMDashboard vmDashboard) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: R.appColor.clr.white,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: vmDashboard.isBusy == true
            ? const CircularIndicator()
            : Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    vmDashboard.dictionaryApiModel?.word == null
                        ? _whenSearchedNothing()
                        : _searchedData(vmDashboard),
                  ],
                ),
              ),
      ),
    );
  }

  Column _searchedData(VMDashboard vmDashboard) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vmDashboard.dictionaryApiModel?.word?.toString() ?? "",
          style: R.textStyles.defaultTxtStyle,
        ),
        Text(
          vmDashboard.dictionaryApiModel?.phonetics?[0].text ?? "",
          style: R.textStyles.defaultTxtStyle,
        ),
        Text(
          vmDashboard
                  .dictionaryApiModel?.meanings?[0].definitions?[0].definition
                  ?.toString() ??
              "",
          style: R.textStyles.defaultTxtStyle,
        ),
      ],
    );
  }

  Text _whenSearchedNothing() {
    return Text(
        textAlign: TextAlign.center,
        "Search a word",
        style: R.textStyles.whenSearchedNothingStyle);
  }

  TextField _searchArea(VMDashboard vmDashboard, BuildContext context) {
    return TextField(
      autofocus: true,
      controller: searchController,
      onSubmitted: (value) async {
        vmDashboard.fetchResponse(context, value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: R.appColor.clr.black,
        fillColor: R.appColor.clr.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: "Search a word",
        hintStyle: TextStyle(
          color: R.appColor.clr.black,
          fontSize: R.dimens.dmn.searchHint,
        ),
      ),
    );
  }
}
