//
//  AnotherViewController.m
//  FJSKeyedViewController
//
//  Created by Corey Floyd on 3/13/10.
//  Copyright 2010 Flying Jalapeño Software. All rights reserved.
//

#import "AnotherViewController.h"
#import "FJSTransitionController.h"


@implementation AnotherViewController


- (IBAction)pop{
	
	FJSAnimationType type = arc4random() % 9;
	FJSAnimationDirection direction = arc4random() % 4;
	
	self.transitionController.animationType = type;
	self.transitionController.animationDuration = 1.0;
	self.transitionController.animationDirection = direction;

	[[self transitionController] loadPreviousViewController];
	//[self.transitionController loadViewControllerForKey:@"Dummy"];
	
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
