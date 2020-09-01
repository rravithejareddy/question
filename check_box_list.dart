import 'package:cropmarket/models/crop_type_list.dart';
import 'package:cropmarket/models/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cropmarket/extensions/string_extenstion.dart';

class CheckBoxList extends StatefulWidget{
  CheckBoxList({Key key,
    @required this.onSelected,
    @required this.values,
    @required this.filter})
      : super(key: key);

  final Function onSelected;
  final Map<String, bool> values;
  final Filter filter;

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}
class _CheckBoxListState extends State<CheckBoxList> {
  List<String> cropType = ["pulses","oilAndSeeds","vegetables"];
  List<String> _selected= [];
  List<String> cropName = [];
  @override
  Widget build(BuildContext context) {
    Map<String, bool> values = {
      "Pulses": widget.filter.cropType.contains("pulses"),
      "Oil & Seeds": widget.filter.cropType.contains("oilandseeds"),
      "Vegetables": widget.filter.cropType.contains("vegetables"),
      "Fruits": widget.filter.cropType.contains("fruits"),
    };
    return new Scaffold(
      appBar: new AppBar(title: new Text('CheckboxListTile demo')),
      body: new ListView(
        children: cropType.map((String key) {
          return new CheckboxListTile(
            title: new Text(key.capitalize()),
            value: widget.filter.cropType.contains(key),
            onChanged: (value) {
              if (value) {
                _selected.add(key);
               // cropName.add("redGram");
               // cropName.add("greenGram");
                widget.filter.cropType = _selected;
               // widget.filter.cropName = cropName;
                widget.onSelected(widget.filter);
              }
              else{
                _selected.remove(key);
                widget.filter.cropType = _selected;
                widget.onSelected(widget.filter);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
