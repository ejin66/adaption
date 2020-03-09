# adaption

flutter logic pixels adaption

### First, init adaption.

```dart
Adaption.design(context, 1080, 1920);
```

`1080, 1920` is the size of your design draft.

> It must be called under WidgetsApp or MaterialApp widget.

example:

```dart
MaterialApp(
      title: 'Flutter Adaption Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {

      	Adaption.design(context, 1080, 1920);
        
        return some_widget;
      }
);
```

### Second, use it.

the logic pixels by ratio in horizontal:

```dart
0.2.ratio();
```


the logic pixels by ratio in vertical:

```dart
0.4.ratioHeight();
```

convert the pixels in the design draft to logic pixels in horizontal:

```dart
40.adaptionPixels();
```

convert the pixels in the design draft to logic pixels in vertical:

```dart
80.adaptionHeightPixels();
```


