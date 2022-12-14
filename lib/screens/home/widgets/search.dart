import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({required this.onSearch, Key? key}) : super(key: key);

  final Function onSearch;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final _controller = TextEditingController();
  final _isLoading = false;
  var _hasFocus = false;
  var _textIsEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade100
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          Focus(
            child: TextField(
              controller: _controller,

              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(8, 0, 36, 8),
              ),
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                if(value.isNotEmpty) {
                  widget.onSearch(value);
                }
              },
              onChanged: (value) {
                setState(() {
                  _textIsEmpty = value.isEmpty;
                });
              },
            ),
            onFocusChange: (value) {
              setState(() {_hasFocus = value;});
            },
          ),
          _isLoading
            ? Transform.scale(
              scale: 0.5,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
            : IconButton(
              onPressed: () {
                _controller.clear();
                setState(() {
                  _textIsEmpty = _controller.value.text.isEmpty;
                });
              },
              icon: _textIsEmpty
                ? Icon(
                  Icons.search,
                  color: _hasFocus ? Theme.of(context).colorScheme.onPrimary : Colors.grey,
                )
                : Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onPrimary,
                )
            ),
        ],
      ),
    );
  }
}
