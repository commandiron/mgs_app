import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search(this.onSearch, {Key? key}) : super(key: key);

  final Function onSearch;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final _controller = TextEditingController();
  final _isLoading = false;
  final _focusNode = FocusNode();
  var _hasFocus = false;
  var _textIsEmpty = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
      height: 40,
      width: _hasFocus || !_textIsEmpty
          ? MediaQuery.of(context).size.width / 2
          : 42,
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
              focusNode: _focusNode,
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
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if(_textIsEmpty) {
                    _focusNode.requestFocus();
                  } else {
                    _controller.clear();
                  }
                  setState(() {
                    _textIsEmpty = _controller.value.text.isEmpty;
                  });
                },
                child: _textIsEmpty
                    ? Icon(
                  Icons.search,
                  color: _hasFocus ? Theme.of(context).colorScheme.onPrimary : Colors.grey,
                )
                    : Icon(
                  Icons.clear,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
        ],
      ),
    );
  }
}
