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
    IBOutlet UIButton *tLButton;
    IBOutlet UIButton *tRButton;
    IBOutlet UIButton *bRButton;
    IBOutlet UIButton *bLButton;
    
}

-(void)goSong;
-(IBAction)topLeftButton;
-(IBAction)topRightButton;
-(IBAction)bottomLeftButton;
-(IBAction)bottomRightButton;

@end
