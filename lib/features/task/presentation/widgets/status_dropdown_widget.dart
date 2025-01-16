import 'package:flutter/material.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/core/constants/app_style.dart';
import 'package:todo_bloc/core/utils/color_utils.dart';

class StatusDropdownWidget extends StatefulWidget {
  final String? initialStatus;
  final ValueChanged<String> onStatusChanged;
  const StatusDropdownWidget({
    super.key,
    this.initialStatus,
    required this.onStatusChanged,
  });

  @override
  State<StatusDropdownWidget> createState() => _StatusDropdownWidgetState();
}

class _StatusDropdownWidgetState extends State<StatusDropdownWidget> {
  late String _status;

  @override
  void initState() {
    super.initState();
    _status = widget.initialStatus ?? 'DONE';
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtils.getColorByStatus(_status),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: ColorUtils.getColorByStatus(_status),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtils.getColorByStatus(_status),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
      value: _status,
      hint: const Text('Status'),
      style: AppStyle.semibold14.copyWith(
        color: AppColor.backgroundColor,
      ),
      iconEnabledColor: ColorUtils.getColorByStatus(_status),
      iconDisabledColor: ColorUtils.getColorByStatus(_status),
      items: _buildStatusDropdownItems(),
      onChanged: (value) {
        setState(() {
          _status = value!;
        });
        if (value != null) {
          widget.onStatusChanged(value);
        }
      },
    );
  }

  List<DropdownMenuItem<String>> _buildStatusDropdownItems() {
    const statuses = ['PROCESSING', 'DONE', 'FAIL'];
    return statuses
        .map((status) => DropdownMenuItem(
              value: status,
              child: Text(
                status,
                style: AppStyle.semibold14
                    .copyWith(color: ColorUtils.getColorByStatus(status)),
              ),
            ))
        .toList();
  }
}
