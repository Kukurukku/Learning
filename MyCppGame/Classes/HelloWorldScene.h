#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"

class HelloWorld : public cocos2d::Layer
{
public:
    // there's no 'id' in cpp, so we recommend returning the class instance pointer
    static cocos2d::Scene* createScene();

    // Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
    virtual bool init();
    
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender);
    
    // implement the "static create()" method manually
    CREATE_FUNC(HelloWorld);
    
    
    // 仮の衝突用
    bool collision(cocos2d::PhysicsContact& contact);
    
    
    bool aa;
    
    void removeEnemy(int target);
    //void removeEnemy(Node* sender);
    
    void my_callback_with_param(Ref* sender,int arg1);

};

#endif // __HELLOWORLD_SCENE_H__
