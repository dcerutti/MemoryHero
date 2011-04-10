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

-(int)getLibrarySize {
    return [library count];
}

-(void)firstSong{

    Song *songBuild = [[Song alloc] init];
    Note *noteBuild;
    [songBuild setName:@"Jack One"];
    [songBuild setBeatsPerMeasure:8];
    noteBuild = [[Note alloc]set:@"tL" :3.922];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :19.989];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :20.913];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :35.97];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :36.939];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :38.403];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :51.975];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :52.983];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :54.455];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :54.972];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :68.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :68.971];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :70.443];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :70.964];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :71.49];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :83.997];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :84.965];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :86.485];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :86.957];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :87.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :87.957];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :99.993];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :100.984];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :102.464];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :102.968];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :103.408];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :103.936];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :104.455];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :115.977];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :116.89];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :118.498];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :119.018];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :119.466];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :119.946];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :120.441];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :120.969];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :132.042];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :132.978];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :134.426];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :134.931];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :135.448];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :135.93];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :136.418];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :136.987];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :137.898];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :148.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :149.027];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :150.471];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :150.956];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :151.467];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :151.941];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :152.435];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :152.954];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :154.008];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :154.405];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :163.988];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :165.003];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :166.403];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :166.985];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :167.476];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :167.994];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :168.46];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :168.996];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :169.966];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :170.46];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :170.98];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :179.924];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :180.997];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :182.465];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :182.941];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :183.453];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :183.959];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :184.429];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :184.981];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tL" :186.021];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bR" :186.469];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"bL" :186.933];
    [songBuild addNote:noteBuild];
    noteBuild = [[Note alloc]set:@"tR" :187.485];
    [songBuild addNote:noteBuild];
    [self setSong:songBuild];
}

@end
