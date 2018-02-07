//
//  FileUpload.h
//  prototype
//
//  Created by Ari Ronen on 11/12/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//

#ifndef Eden_FileUpload_h
#define Eden_FileUpload_h
#import <Foundation/Foundation.h>


@interface FileUpload : NSObject {
    NSURL *serverURL;
    NSString *filePath;
    NSString *imgPath;
    id delegate;
    SEL doneSelector;
    SEL errorSelector;
    SEL progressSelector;
    BOOL uploadDidSucceed;
}

-   (instancetype)initWithURL: (NSURL *)serverURL 
           filePath: (NSString *)filePath 
            imgPath: (NSString *)aimgPath
           delegate: (id)delegate 
       doneSelector: (SEL)doneSelector 
      errorSelector: (SEL)errorSelector
   progressSelector: (SEL)progressSelector NS_DESIGNATED_INITIALIZER;

@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *filePath;

@end

#endif
