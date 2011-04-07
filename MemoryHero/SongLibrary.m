//
//  SongLibrary.m
//  MemoryHero
//
//  Created by Dan Cerutti on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SongLibrary.h"


@implementation SongLibrary

-(id)init{
    
    library = [[NSMutableArray alloc] init];
    
    
    //FirstSong
    [self firstSong];
    
    return self;
}

-(Song *)getSong:(NSInteger)index{
    return [library objectAtIndex:index]; 
}

-(void)setSong:(Song *)song{
    [library addObject:song];
}

-(void)firstSong{
    Song *songBuild = [[Song alloc] init];
    Note *noteBuild;
    noteBuild = [[Note alloc]set:@"tR" :2.365];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :2.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :2.59];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :2.71];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :2.87];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.013];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.174];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.326];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.63];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :3.797];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :3.949];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.102];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.221];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.389];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.533];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.678];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :4.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :4.942];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.054];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.213];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.366];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.654];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :5.83];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :5.982];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.142];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.294];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.454];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.565];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :6.75];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :6.87];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.046];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.342];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.526];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :7.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :8.158];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :8.294];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :8.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :8.774];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :9.07];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.486];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.814];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :9.99];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :10.261];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :10.589];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :10.743];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :10.918];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :11.181];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :11.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :11.918];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.27];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.462];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :12.733];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.054];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :13.182];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.366];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :13.646];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :13.982];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.742];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :14.926];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :15.222];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :15.582];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :15.734];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :15.894];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.022];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :16.166];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.31];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :16.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :16.613];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :17.806];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :18.11];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :18.406];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :18.726];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :19.014];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :20.246];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :20.51];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :20.878];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :21.053];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :21.342];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :21.654];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :22.062];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :22.365];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :22.709];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :22.886];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :23.014];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :23.334];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :23.558];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :23.814];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :24.15];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :24.774];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :25.406];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :25.934];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :26.55];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :26.91];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :27.11];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :27.326];
    [songBuild addNote:noteBuild];
    
    [self setSong:songBuild];
}

@end
