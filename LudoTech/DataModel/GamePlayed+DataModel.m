//
//  GamePlayed+DataModel.m
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "GamePlayed+DataModel.h"

// ===== DEFINITION =====

@implementation GamePlayed (DataModel)

+(GamePlayed *) getObjectWithDate:(NSDate *)date withVariant:(Variant *)variant withRank:(NSNumber *)rank withNbPlayer:(NSNumber *)nbPlayer withEntityDescription:entityDescriptionGamedPlayed inManagedObjectContext:context
{
    GamePlayed *retValue = nil;
    
    // If no date given, method fails
    if (!date | !rank | !nbPlayer |!variant)
    {
        retValue = nil;
    }
    
    // Else we search for an object with this into the persistent store ...
    else
    {
        retValue = [[GamePlayed alloc] initWithEntity:entityDescriptionGamedPlayed insertIntoManagedObjectContext:context];
        
        if (retValue)
        {
            retValue.date = date;
            retValue.rank = rank;
            retValue.nbPlayer = nbPlayer;
            retValue.variant = variant;
        }
        
    }
    return retValue;
}
@end
