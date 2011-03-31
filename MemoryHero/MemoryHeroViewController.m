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
    
    //Creates a new thread so program can continue
    [NSThread detachNewThreadSelector:@selector(goSong) toTarget:self withObject:nil];
}

//Play First Measure
-(void)goSong{
    Song *firstSong = [[Song alloc] init];
    Note *firstNote;
    //Create Fake Song
    firstNote = [[Note alloc] set:@"tL"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"tR"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"bR"];
    [firstSong addNote:firstNote];
    firstNote = [[Note alloc] set:@"bL"];
    [firstSong addNote:firstNote];
    
    
    NSMutableArray *beat = [firstSong getBeat];
    int size = [beat count];
    Note *note;
    for(int i = 0;i < size;i++){
        
        
        note = [beat objectAtIndex:i];
        NSString *str = [note getButtonRef];
        NSLog(str);
        UIButton *button;
        
        if(str == @"tR"){
            button = tRButton;
        }else if(str == @"tL"){
            button = tLButton;
        }else if(str == @"bL"){
            button = bLButton;
        }else if(str == @"bR"){
            button = bRButton;
        }
        
        //signals main thread to make UI change
         dispatch_async( dispatch_get_main_queue(), ^{
             [button setHighlighted:TRUE];
         });
        
        sleep(1);
        
        //signals main thread to make UI change
        dispatch_async( dispatch_get_main_queue(), ^{
            [button setHighlighted:FALSE];
        });
        
    }

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
