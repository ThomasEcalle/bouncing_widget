# bouncing_widget

A widget that enables you to add a bouncing animation on a widget.

## Example

<p align="center">
<img src="https://raw.githubusercontent.com/ThomasEcalle/bouncing_widget/master/documentation/gif_bouncing.gif" width="180" height="360"/>
</p>

## How does it work ?

You just have to encapsulate the widget of your choice with a `BouncingWidget`.

You may also use a `scaleFactor` to customize the scaling effect as in the gif example.
Or even customize the animation's duration with the `duration` parameter (200 milliseconds by default).

```
BouncingWidget(
  duration: Duration(milliseconds: 100),
  scaleFactor: 1.5,
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
