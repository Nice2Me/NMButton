# 724Button


##This is **custom button** that easies to layout for title and image.


#Methods
* init instance

We can use two kinds of methos to instance object; `buttonWithTitle` use default type to instance object.

    UITextImageButton *aButton = [UITextImageButton buttonWithTitle:titleString image:image];
  
or

    UITextImageButton *aButton = [UITextImageButton buttonWithType:aType title:titleString image:image];

* change type

If we instance button with `buttonWithTitle`, but we want to chang type later. we can call method `setTextImageButton`

    [aButton setTextImageButtonType:aType];

* change spacing between title and image

When instance object, we define default spacing between title and image. If it can't meet to your demands, you can call method `setSpacing` to change it later.

    [aButton setSpacing:aSpacing]
    
