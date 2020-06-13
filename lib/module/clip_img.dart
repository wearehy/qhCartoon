import 'package:flutter/material.dart';

class ClipImg extends StatefulWidget {
  ///图片
  final String img;
  //宽高比
  final double aspectRatio;
  //高度
  final double height;
  ///展位图
  final String placeholder;
  ///圆角
  final double radius;


  ClipImg({Key key, this.img,this.aspectRatio,this.placeholder,this.radius,this.height}) : super(key: key);

  @override
  _ClipImg createState() => _ClipImg();
}

class _ClipImg extends State<ClipImg> {


  @override
  Widget build(BuildContext context) {

    FadeInImage hasPlaceholder(){
      return FadeInImage.assetNetwork(
        placeholder: widget.placeholder,
        image: widget.img,
        fit: BoxFit.cover,
        height: widget.height == null?  null : widget.height,
      );
    }

    Image noPlaceholder(){
      return Image.network(
        widget.img,
        fit: BoxFit.cover, //裁剪图片
      );
    }

    ClipRRect CRR(){
      return ClipRRect(
        borderRadius: widget.radius != null?BorderRadius.all(Radius.circular( widget.radius )):BorderRadius.all(Radius.circular( 0 )),
        child: widget.placeholder == null?noPlaceholder():hasPlaceholder(),
      );
    }

    if(widget.height == null){
      return AspectRatio(
        //设置组件(图片)宽高比例
          aspectRatio: widget.aspectRatio,
          /// 5/3
          child: CRR()
      );
    }else{
      return CRR();
    }

  }
}
