//
//  Menu_background.h
//  prototype
//
//  Created by Ari Ronen on 1/1/11.
//  This project is licensed under the GNU General Public License v3. See https://github.com/JosephTheEngineer/Eden for more info.
//

#ifndef Eden_Menu_background_h
#define Eden_Menu_background_h




class Menu_background {
    
public:
    Menu_background();
    void update(float etime);
    void render();
private:
CGRect clouds[3];
};

#endif
