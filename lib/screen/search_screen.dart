import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchScreen> {
  final TextEditingController _searchTc = TextEditingController();
  FocusNode focusNode = FocusNode();
  String searchText = "";

  _SearchState() {
    _searchTc.addListener(() {
      // 상태변화를 감지해 텍스트 변
      setState(() {
        searchText = _searchTc.text;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody(BuildContext context){
    return Container();
  }

  /* 검색 텍스트필드 Widget */
  Widget searchTextField() {
    return TextField(
      controller: _searchTc,
      focusNode: focusNode,
      style: TextStyle(
        fontSize: 15.0,
      ),
      autofocus: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white12,
        prefixIcon: searchIcon(),
        suffixIcon: searchCancelBtn(),
        hintText: '검색',
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: outlineInputBorderStyle(),
        enabledBorder: outlineInputBorderStyle(),
        border: outlineInputBorderStyle(),
      ),
    );
  }

  /* searchIcon Image */
  Widget searchIcon() {
    return Icon(
      Icons.search,
      color: Colors.white60,
      size: 20.0,
    );
  }

  /* OutlineInputBorder style */
  OutlineInputBorder outlineInputBorderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  /* 검색데이터 reset */
  void resetSearchData(){
    setState(() {
      _searchTc.clear();
      searchText = "";
    });
  }

  /* 검색단어 취소 Btn */
  Widget searchCancelBtn() {
    return focusNode.hasFocus
        ? IconButton(
        icon: Icon(
          Icons.cancel,
          size: 20.0,
        ),
        onPressed: () {
          resetSearchData();
        })
        : Container();
  }

  /* 검색 취소 Btn */
  Widget cancelBtn() {
    return focusNode.hasFocus
        ? Expanded(
        child: TextButton(
          child: Text('취소'),
          onPressed: () {
            resetSearchData();
          },
        ))
        : Expanded(flex: 0, child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: searchTextField(),
                    ),
                    cancelBtn(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
