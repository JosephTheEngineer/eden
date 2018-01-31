//
//  md5.h
//  Eden
//
//  Created by Ari Ronen on 7/5/11.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//
#ifndef Eden_md5_h
#define Eden_md5_h


#include <CoreFoundation/CoreFoundation.h>
#define FileHashDefaultChunkSizeForReadingData 4096

#ifdef __cplusplus
extern "C" {
#endif

CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath, 
                                      size_t chunkSizeForReadingData);

#ifdef __cplusplus
    }
#endif


#endif
