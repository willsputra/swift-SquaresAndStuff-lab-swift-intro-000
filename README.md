# Space Profile
![](http://i.imgur.com/9UXK1hs.jpg?1)

> Existence is a series of footnotes to a vast, obscure, unfinished masterpiece. -[Vladimir Nabokov](https://en.wikipedia.org/wiki/Vladimir_Nabokov)

 
## Learning Objectives

* 



## Instructions

**1.** Locate the `Main.storyboard` file, change the Simulated Metrics "Size" option to iPhone 4.7-inch. That way we can layout our views as if we're working on an iPhone. 

![](https://s3.amazonaws.com/learn-verified/AutoLayoutSB.png)

**2** Drag an `Image View` onto the canvas and position it like so:

![](https://s3.amazonaws.com/learn-verified/AutoLayoutImageView.png)

**3** Lets add some constraints to this `Image View` object.

![](https://media.giphy.com/media/l0HlzZlkm2MIbFjQQ/giphy.gif)

![](https://s3.amazonaws.com/learn-verified/AutoLayoutImage.png)

After setting our constraints like this, we need to clean it up. Anytime you setup constraints like this, don't take it for granted. Don't assume the constraints you just set are where you want them to be. Lets step through each one and make sure they're set to the following:

* Image View.Top - Equal - Top Layout Guide.Bottom ; Constant = 0, Multiplier = 1

* Image View.Leading - Equal - Superview.Leading ; Constant = 0, Multiplier = 1

* Image View.Trailing - Equal - Superview.Trailing; Constant = 0, Multiplier = 1

* Image View.Height - Equal - Superview.Height; Constant = 0, Multiplier = 0.25



What if you see something like this?

![](https://s3.amazonaws.com/learn-verified/AutoLayoutBad.png)

It seems like everything is backwards, we don't want that. We want it read the other way around (although technically you don't have to do this). I prefer to fix this when I see it that way it reads like a sentence and I stay consistent with how every other one is setup.

Select the drop down menu to the right of `Superview.Trailing Margin` to be presented with the following:

![](https://s3.amazonaws.com/learn-verified/AutoLayoutReverse.png)

You will then want to select "Reverse First And Second Item", doing that will put things back in the correct order.

--- 

**4.** You just added constraints to this Image View object but it might not appear as if any changes were made in your canvas. Update The Frames so that way you can see what this might look like at run-time.

With your `View` selected, hit that triangle looking thing in the lower right of Xcode to be presented with this Menu:

![](https://s3.amazonaws.com/learn-verified/AutoLayoutTriangle.png)

Select "Update Frames" which should now have your Canvas looking like the following:

![](https://s3.amazonaws.com/learn-verified/AutoLayoutFrame.png)

**5.** When designing your views, you should work with some Dummy Data so that way you get a good sense as to what we're building here. 

We've included a `SpaceShip` image for you. With your Image View selected in Interface Builder:


* Set the `Image` of this Image View to be this `SpaceShip` Image. 
* Change the Mode (under the View category) to be Aspect Fill.
* Check off the "Clip Subviews" option under the View category

Lets run our application now, what does it look like?

![](https://s3.amazonaws.com/learn-verified/AutoLayoutSpace.png)

**5.** Drag another Image View onto the canvas.

We will want this new ImageView positioned similar to how Facebook does it. We want it positioned somewhat like this:

![](https://s3.amazonaws.com/learn-verified/AutolayoutTheStein.png)

**6.** Lets set these constraints up one at a time. The first will be centering it in our view.

We will want to select the option "Center Horizontally In Container" when dragging from our Image View to the View. Lets check out that constraint to make sure it reads correctly:

* Image View.Center X - Equal - Superview.Center X ; Constant = 0, Multiplier = 1

We want to now create a constraint from the Image View to the SpaceShip (which is itself an Image View). Drag from the Image View to the SpaceShip and then select "Vertical Spacing"

In looking into this new constraint, we want to make sure it reads as follows (you might have to adjust some things):

* Image View.Top - Equal - SpaceShip.Bottom ; Constant = 0, Multiplier = 0.75

Now drag from the Image View to the SpaceShip for a second time to create another constraint. Select Equal Heights. Inspecting this constraint, get it to read as follows:

* Image View.Height - Equal - SpaceShip.Height ; Constant = 0, Multiplier = 0.7

Last constraint we need to worry about is the Width of this Image View, since we want it to be a square and it's height is setting itself up relative to the height of the SpaceShip Image View which itself is setting up its height relative to the view of the iPhone, we can solve this problem easy!

Drag from the Image View to the Image View (itself!). Then select the "Aspect Ratio" option. Inspecting this constraint make sure it reads as follows:

* Image View.Width - Equal - Image View.Height ; Constant = 0, Multiplier = 1:1

**7.** We've included a profile image for you. Select the Image View and do the following:

* Set the Image to be `AlbertEinstein`
* Set the Mode under the View category to be "Aspect Fit"

Now, run your app! 

![](https://s3.amazonaws.com/learn-verified/AutoLayoutAlberto.png)

**8.** Head over to the `ViewController.swift` file, we want to add some borders around Mr. Einstein here. Drag over as outlets the two Image View objects we made here. Name that something that makes sense as to what they are. The space image view represents a cover photo and the other image view represents a profile image.

Add the following code to the `viewDidLoad()` method. I named the Albert Einstein image view `profileImageView` when I dragged it over as a property.

```swift
profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
profileImageView.layer.borderWidth = 3.0
profileImageView.layer.cornerRadius = 10.0
profileImageView.layer.masksToBounds = true
```

After doing this--run the app!

![](https://s3.amazonaws.com/learn-verified/AutoLayoutAlbertBorder.png)

Pretty!

**9.** Something seems a little off. I would prefer for the Spaceship image to not be constrained by those margins, lets fix that.

![](https://s3.amazonaws.com/learn-verified/AutoLayoutMarginGetOut.png)

The Leading and Trailing constraints we've created on our Cover Photo image view need to be changed. We want to uncheck the Relative To Margin option on both of them (like I did in the screenshot above).

You might notice that we don't have that option for the Top Constraint, hmm.

Delete the current Top Constraint we setup for this Cover Photo Image View, we're going to create a new one. When dragging over from the cover photo image view to the view, we're presented with that screen that gives us various options. While holding down the `option` key on your keyboard with this menu open, we're presented with some additional options. With the `option` key held down, select the Top Space To Container Margin option.

After doing so, select this newly made constraint and make sure it reads as follows (note, the name of this image view is now Cover Photo Image View because of how I created my outlet):

* Cover Photo Image View.Top - Equal - Superview.Top Margin ; Constant = 0, Multiplier = 1

Now, run the app!

![](https://s3.amazonaws.com/learn-verified/AutoLayoutFixOnTop.png)

We're beginning to make an app, looking good!

**10.** Drag onto the canvas a  Label. Position it below the Albert Einstein image.

Setup the following options on this Label:

* Font - Avenir Next, Regular,  26.0
* Alignment should be centered
* Make it read as "Albert Einstein"
* Select a light blue color as the "Shadow"
* Setup the Shadow Offset option as follows: Horizontal = 2, Vertical = 1

**11.** Label Constraints. Lets do these one at a time.

We should first make sure the center x is equal to the center x of the Albert Einstein Image.

Select the new label (the name of my label right now is Albert Einstein) and option drag over to the Profile Image View and select "Center Horizontally"

The constraint should read as follows:

* Albert Einstein.Center X - Equal - Profile Image View.Center X ; Constant = 0, Multiplier = 1

Dragging from the Albert Einstein Label to the Profile Image View (which is a photo of Mr. Einstein), select the option "Vertical Spacing". Digging into that new constraint, it should read like this (you might have to adjust some things around in those drop down menus to make it read like this (maybe not)... I woke up like this):

* Albert Einstein.Top - Equal - Profile Image View.Bottom ; Constant = 8, Multiplier = 1

We don't need to setup the Height or Width here. Why? A `UILabel` has what's referred to as an intrinsic content size. It's height and width is based upon the font you use. We've established what font we are using along with the font size. THAT will dictate its height and width. So if we were to write in a very long name here.. what would happen? It would go off screen and that's a bad thing so we probably _should_ constrain the width of this label here if we were to release this to the app store but for now.. we're cool with it--lets move forward.

Run the app!

![](https://s3.amazonaws.com/learn-verified/AutoLayoutAlbertName.png)




<a href='https://learn.co/lessons/AutoLayoutLab' data-visibility='hidden'>View this lesson on Learn.co</a>

