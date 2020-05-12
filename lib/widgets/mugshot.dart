import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Mugshot extends StatefulWidget {
  Mugshot({Key key, this.mugshot}) : super(key: key);

  final String mugshot;

  @override
  _MugshotState createState() => _MugshotState();
}

class _MugshotState extends State<Mugshot> {

  @override
  void initState() {
    print(widget.mugshot);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: CachedNetworkImage(
         fit: BoxFit.contain,
        imageUrl: widget.mugshot,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
    );
  }
}