//
//  GamePlayed+DataModel.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "GamePlayed.h"

// ===== DECLARATION =====

@interface GamePlayed (DataModel)

+(GamePlayed *) getObjectWithDate:(NSDate *)date withRank:(NSNumber *)rank withNbPlayer:(NSNumber *)nbPlayer withEntityDescription:entityDescriptionGamedPlayed inManagedObjectContext:context;

@end
