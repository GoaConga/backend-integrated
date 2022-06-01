import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:internsforyou/models/student/student.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';

class InternTile extends StatefulWidget {
  final Student intern;
  const InternTile({ Key? key, required this.intern, required this.onTap }) : super(key: key);
  final VoidCallback onTap;

  @override
  State<InternTile> createState() => _InternTileState();
}

class _InternTileState extends State<InternTile> {
  @override
  Widget build(BuildContext context) {
    widget.intern.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean dapibus aliquam dolor sed luctus. Donec placerat ligula quis nisi convallis, eget sollicitudin quam luctus. Quisque neque mi, posuere vel ex vitae, tempor congue mauris. Vestibulum aliquet tincidunt aliquam. Aliquam at diam id leo molestie efficitur ut in enim. Vestibulum arcu nisi, posuere dictum ex vitae, finibus porttitor nulla. Cras velit sapien, iaculis sit amet nisi non, tempus commodo diam. Vivamus nec tellus in nibh vestibulum varius. Aenean felis leo, auctor at ipsum tempus, interdum scelerisque turpis. Nam libero odio, euismod non luctus ac, pretium eu purus. Integer ultrices quis felis eu porttitor. Phasellus eu aliquam urna. Sed metus arcu, dignissim vehicula lacinia et, posuere mattis nunc. Fusce sodales nulla vel iaculis aliquam. In in dignissim massa. Nam et sapien quis odio aliquet ullamcorper malesuada id odio.";
    return Card(
      child: ListTile(
        onTap: widget.onTap,
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(255, 196, 196, 196),
                color: IFYColors.accentRed,
                strokeWidth: 5,
                value: widget.intern.score/100,
              ),
              Center(
                child: Text(widget.intern.score.toString(),
                  style: IFYFonts.scoreButtonText),
              ),
            ]
          ),
        ),
        title: Text(widget.intern.firstName + ' ' + widget.intern.lastName,
          style: IFYFonts.internListNameText
        ),
        subtitle: Text(widget.intern.bio,
          maxLines: 2,
          style: IFYFonts.internListDescriptionText,
        ),
        isThreeLine: true,
        tileColor: IFYColors.buttonGray,
      ),
    );
  }
}