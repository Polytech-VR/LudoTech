//
//  Edition+DataModel.h
//  LudoTech
//
//  Created by Valentin Bercot on 13/03/2015.
//  Copyright (c) 2015 Valentin Bercot & Remy Tartiere. All rights reserved.
//

#import "Edition.h"

// ===== DECLARATION =====

@interface Edition (DataModel)

// ===== METHODS =====

+(Edition *) getObjectWithName:(NSString *)name withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

+(Edition *) getObjectWithName:(NSString *)name withVariant:(Variant*)variant withEditor:(Editor *)editorEdition withLanguage: (Language *)languageEdition withTheme:(Theme *)themeEdition withYear:(NSString *)year withEntityDescription:(NSEntityDescription *)entity inManagedObjectContext:(NSManagedObjectContext *)context;

@end
