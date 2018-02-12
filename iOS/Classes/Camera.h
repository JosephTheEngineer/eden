//
//  Camera.h
//  prototype
//
//  Created by Ari Ronen on 10/11/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//


#ifndef Eden_Camera_h
#define Eden_Camera_h



#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "glu.h"
#import "Util.h"

class Camera {
public:
    Camera();
    ~Camera();
    void reset();
    BOOL update(float etime);
    void render();
    void render2();
    
	float px,py,pz;
	float vx,vy,vz;
	Vector look;
	float yaw,pitch;	
	float speed;
	int mode;
};

#endif
