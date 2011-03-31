//
//  MemoryHeroViewController.m
//  MemoryHero
//
//  Created by Dan Cerutti on 3/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MemoryHeroViewController.h"
#import "Song.h"
#import "Note.h"

@implementation MemoryHeroViewController

-(IBAction)topLeftButton{
    
    NSLog(@"topLEFT");
}

-(IBAction)topRightButton{
    
    NSLog(@"topRight");
    
    
}
-(IBAction)bottomLeftButton{
    
    NSLog(@"bottomLeft");
    
    
}

-(IBAction)bottomRightButton{
    
    NSLog(@"bottomRight");
    
    
}

- (void)dealloc
{
    [super dealloc];
}

-(void)viewDidLoad{
    scoreLabel.text = @"9000";
    
    Song *songTest = [[Song  alloc] init];

    for(int i = 0; i < 4; i++){
        
        Note *note = [[Note alloc] set:@"topLeft"];
        
        [songTest addNote:note];
    }
    
    
    [songTest printNotes];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
