import 'package:flutter/material.dart';
import 'package:spiderweb_task/constants/values.dart';

class ReportListItem extends StatefulWidget {
  List filteredList = [];
  int index;
  ReportListItem({
    required this.filteredList,
    required this.index,
  });

  @override
  _ReportListItemState createState() => _ReportListItemState();
}

class _ReportListItemState extends State<ReportListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Text(
                        widget.filteredList[widget.index].customerGroupName,
                        style: BaseStyles.blackBold16,
                      ),
                      SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.filteredList[widget.index].isFavorite =
                                !widget.filteredList[widget.index].isFavorite;
                          });
                        },
                        child: Icon(
                          widget.filteredList[widget.index].isFavorite
                              ? Icons.star
                              : Icons.star_border,
                          color: AppColors.blueColor,
                          size: 22,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.filteredList[widget.index].customerGroupId,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.filteredList[widget.index].rainmakerName,
                    style: BaseStyles.blackBold15,
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.filteredList[widget.index].rainmakerId,
                  ),
                ],
              ),
            ),
            Expanded(
              child: widget.filteredList[widget.index].status == null
                  ? Container()
                  : Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.filteredList[widget.index].status ==
                                status.Completed
                            ? Colors.green
                            : widget.filteredList[widget.index].status ==
                                    status.Pending
                                ? Colors.amber
                                : widget.filteredList[widget.index].status ==
                                        status.Incomplete
                                    ? Colors.red
                                    : Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
