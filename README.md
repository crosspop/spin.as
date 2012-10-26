Spin.as
=======

Spin.as is a straightforward port of [Spin.js][].  It has completely
equivalent features to Spin.js, but for ActionScript 3. 

[Spin.js]: http://fgnass.github.com/spin.js/


Quickstart
----------

```actionscript
import spin.Spinner;
var spinner:Spinner = new Spinner;
addChild(spinner);
spinner.spin();
```


Advanced usage
--------------

The constructor of `spin.Spinner` takes optional parameters (although they have
their own default values).  The signature looks like:

```actionscript
Spinner(
    lineCount:uint = 12,
    length:Number = 7,
    thickness:Number = 5,
    radius:Number = 10,
    roundness:Number = 1,
    color:uint = 0x000000,
    speed:Number = 1,
    trail:Number = 1,
    opacity:Number = 0.25,
    shadow:Boolean = false
)
```

Or you simply set these values into the same name of properties e.g.:

```actionscript
var spinner:Spinner = new Spinner;
spinner.color = 0xABCDEF;
spinner.opacity = 0.5;
spinner.shadow = true;
```


Differences from Spin.js
------------------------

Although it's the almost same to Spin.js, there are several differences from it
because Flash/ActionScript itself differs from HTML/JavaScript.

For example, Spin.as lacks `rotate` that Spin.js has.  You can use `rotation`
property of `flash.display.DisplayObject` instead.  (Indeed `spin.Spinner` is
a subtype of `DisplayObject`.)

Also note that `trail` has the value of floating number which is 0.0 to 1.0,
though Spin.js takes 0 to 100 for this option.  We thought it's more natural.


Open source
-----------

Written by JongChan Choi <http://0xabcdef.com/> for [Crosspop][].

It's distributed under [MIT license][].  Feel free to contribute via GitHub
pull requests!

[Crosspop]: http://crosspop.in/
[MIT license]: http://crosspop.mit-license.org/


Changelog
---------

### Version 1.0

To be released.  Initial release.