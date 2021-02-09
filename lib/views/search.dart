import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfff5f8fd), borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: "search wallpapers", border: InputBorder.none),
            ),
          ),
          InkWell(
            child: Container(child:Icon(Icons.search)),
            onTap: (){
              if(_controller.text!=""){
                Navigator.of(context).push(MaterialPageRoute(builder: 
                  null
                ));
              }
            },
          )
        ],
      ),
    );
  }
}
