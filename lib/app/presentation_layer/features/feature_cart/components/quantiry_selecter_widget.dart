// Reusable widget for quantity selection.
import 'package:flutter/material.dart';

import '../../../../../constant/theme/styles.dart';

class QuantitySelector extends StatefulWidget {
  final double? height;
  final double? width;

  final int initialQuantity;
  final Function(int) onChanged;

  const QuantitySelector({
    super.key,
    this.height,
    this.width,

    required this.initialQuantity,
    required this.onChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.onChanged(_quantity);
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onChanged(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 115,
      height: widget.height ?? 45,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: customColors().grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: customColors().fontPrimary),
            onPressed: _decrement,
          ),

          Text(
            '$_quantity',
            style: customTextStyle(fontStyle: FontStyle.BodyL_SemiBold),
          ),

          IconButton(
            icon: Icon(Icons.add, color: customColors().fontPrimary),
            onPressed: _increment,
            splashRadius: 10,
          ),
        ],
      ),
    );
  }
}
