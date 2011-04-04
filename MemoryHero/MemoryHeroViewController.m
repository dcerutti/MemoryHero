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
    
    if(usrTurn != NULL){
        [usrTurn addObject:@"tL"];
        beatCount++;
    }
    
}

-(IBAction)topRightButton{
    
    NSLog(@"topRight");
    [usrTurn addObject:@"tR"];
    beatCount++;
    
}
-(IBAction)bottomLeftButton{
    
    NSLog(@"bottomLeft");
    [usrTurn addObject:@"bL"];
    beatCount++;
    
    
}

-(IBAction)bottomRightButton{
    
    NSLog(@"bottomRight");
    [usrTurn addObject:@"bR"];
    beatCount++;
    
    
}

- (void)dealloc
{
    [super dealloc];
}

-(void)viewDidLoad{
    
    //Creates a new thread so program can continue
    //[NSThread detachNewThreadSelector:@selector(goSong) toTarget:self withObject:nil];
    
}

//Play First Measure
-(void)goSong{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = @"wait";
        
    });
    
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
    
    //set global song to song created
    currentSong = firstSong;
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
    
    
    [NSThread detachNewThreadSelector:@selector(usrTurn) toTarget:self withObject:nil];
    [pool release];
}

//method that runs while usr is typing pattern

-(void)usrTurn{
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = @"GO!";
    });
    
    usrTurn = [[NSMutableArray alloc]init];
    NSMutableArray *beat = [currentSong getBeat];
    beatCount = -1;
    NSString *strUsr;
    NSString *strCS;
    Note *csNote;
    BOOL escapeFlag = true;
    int score = 0;//temp
    while(escapeFlag){
        
        
        //right now it waits for u to match pattern but it will eventually wait based on time.
        if(beatCount != -1){
            
            sleep(.1);
            strUsr = [usrTurn objectAtIndex:beatCount];
            strCS = [[beat objectAtIndex:beatCount] getButtonRef];
            csNote = [beat objectAtIndex:beatCount];
            
            
            if(!csNote.didCheck){
                
                csNote.didCheck = TRUE;
                
                if(strUsr == strCS){
                    
                    score++;
                    dispatch_async( dispatch_get_main_queue(), ^{
                        status.text = @"Great!";
                        
                    });
                    
                }else{
                    
                    dispatch_async( dispatch_get_main_queue(), ^{
                        status.text = @"BAD!";
                    });
                }
                
            }
            
        }
        
        
        if(beatCount == [beat count] - 1){
            escapeFlag = false;
        }
        
        
    }
    
    dispatch_async( dispatch_get_main_queue(), ^{
        status.text = [NSString stringWithFormat:@"%d/%d Correct", score,[beat count]];
    });
    
    [pool release];
    [usrTurn release];
    usrTurn = NULL;
    
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
