//
//  Joystick.h
//  prototype
//
//  Created by Ari Ronen on 12/27/10.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//

#ifndef Eden_Joystick_h
#define Eden_Joystick_h




class Joystick{
    public:
    Joystick();
    BOOL update(float etime);
    void render();
};


#endif
