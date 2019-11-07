# bouncing_widget

A widget that enables you to add a bouncing animation on a widget.

## Example

<p align="center">
<img src="https://raw.githubusercontent.com/ThomasEcalle/bouncing_widget/master/documentation/ezgif.com-video-to-gif.gif" width="180" height="360"/>
</p>

## How does it work ?

You just have to encapsulate the widget of your choice with a `BouncingWidget`.

```
BouncingWidget(
  onPressed: () {
    print("onPressed");
  },
  child: Text(
    "Hello !",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    ),
  ),
),
```
