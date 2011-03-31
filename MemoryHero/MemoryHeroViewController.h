//
//  MemoryHeroViewController.h
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoryHeroViewController : UIViewController {
    
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *topLeftButton;
    
}

-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;

@end
