
##Important Submodule Note:
This applies to users prior to commit d98b1588e44d93f9589c3ff9ddd2c9a51f25f210

A new fork of FTUtils is being used to address some animation issues.     
You must delete the FTUtils folder after pulling. Then perform a "submodule init/update".   



#FJSTransitionController

This class allows you to load arbitrary view controllers and animate transitions between the views.

View controllers are keyed with strings that you provide. 

It is a *FULL* replacement for UINavigationController and/or UITabBarController.

Currently FJSTransitionController supports 8 types of animations which were created using the excellent FTUtils.

##Use
To set associate a view controller with a key:

FJSTransitionControler* myTransitionController;  
[myTransitionController setViewControllerClass:[MyVC class] forKey:@"myKey"];

To use a nib:  
[myTransitionController setViewControllerClass:[MyVC class] nib:@"myVC" bundle:nil forKey:@"myKey"];

To load a VC:  
[myTransitionController loadViewControllerForKey:@"myKey"];

Just like the UITabBarController and UINavigationCOntroller, every UIViewController has a convenience property to access the FJSTransitionController instance it has been added to:

@property(nonatomic, readonly) FJSTransitionController* transitionController;



##Animations
You do not have to use animations, but if you want:

myTransitionController.animationType = FJSAnimationTypeSlide;  
myTransitionController.animationDirection = FJSAmimationDirectionTop;  
myTransitionController.animationDuration = 1.0;

##UINavigationController support

For many View Controllers, an instance of UINavigationController is required for drill down functionality, etc…  
Unfortunately, providing a fully instantiated view controller and navigation controller mitigates some of the memory saving functionality of the FJSTC.  
To alleviate this, a new delegate method has been added:

<code>
- (BOOL)shouldWrapNavigationControllerAroundViewControllerForKey:(NSString*)key;
</code>

Now the FJSTransitionController will automatically "wrap" your VC in a UINavigationController instance, wheee!



##Behavior
FJSTC sends your VCs all proper viewDid/WillAppear and viewDid/WillDissapear messages WITH proper timing (Just the way that Tab bars and Nav Controllers Work).

Your VC's view have the userInteractionEnabled flag set to NO during animations. Only 1 VC can be loaded at a time. Trying to load another VC while a transition is occurring results in an Nonop.

FJSTransitionController also forwards DidRecieveMememoryWarning messages to your VCs. Additionally, it cleans up off screen VCs in low memory situations.  
If you have provided the class and nib of a VC, it will also reinstantiate and VCs automatically. (It will be up to you to save any individual state in VWD/VDD/VDU and dealloc)


It depends on 2 other open source projects: 

####SDNextRunLoopProxy

A nice NSObject category that allows you to easi send messages to objects on the next run loop.  

####FTUtils

FTUtils is added as a git submodule, to add it to this project enter the following commands in the Terminal:  
 
git submodule init
git submodule update

Then you will be able to compile. (You can also just download the source directly)  

This project is still very much beta (as of mid-Mar 2010), but I am developing it for use in 2 other projects. So expect it to become production ready sooner than later.

