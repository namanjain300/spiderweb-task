import 'package:flutter/material.dart';
import 'package:spiderweb_task/constants/values.dart';
import 'package:spiderweb_task/widgets/report_list_item.dart';

class GlobalReportsScreen extends StatefulWidget {
  @override
  _GlobalReportsScreenState createState() => _GlobalReportsScreenState();
}

class _GlobalReportsScreenState extends State<GlobalReportsScreen> {
  String selectedFilter = status.All;
  List filteredList = [];
  List dropDownItems = [
    status.All,
    status.NoStatus,
    status.Completed,
    status.Pending,
    status.Incomplete,
  ];

  @override
  void initState() {
    filteredList = Constants.reportModels;
    super.initState();
  }

  void filterList(selectedStatus) {
    if (selectedStatus == status.All) {
      filteredList = Constants.reportModels;
    } else {
      filteredList = Constants.reportModels
          .where((report) =>
              report.status.toLowerCase() == selectedStatus.toLowerCase())
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Reports'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter By',
                      style: BaseStyles.blackMedium16,
                    ),
                    Container(
                      width: context.widthPx * 0.4,
                      child: DropdownButtonFormField(
                        onTap: () {},
                        onChanged: (selectedStatus) {
                          selectedFilter = selectedStatus.toString();
                          filterList(selectedStatus);
                        },
                        value: selectedFilter,
                        items: dropDownItems.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                // Spacer(),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text('Customer Group')),
                      Expanded(flex: 2, child: Text('Rainmaker')),
                      Expanded(child: Text('Status')),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return ReportListItem(
                      index: index,
                      filteredList: filteredList,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
