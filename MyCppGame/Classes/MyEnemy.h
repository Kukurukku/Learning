//
//  MyEnemy.h
//  MyCppGame
//
//  Created by 東屋　百合絵 on 2015/03/11.
//
//

#ifndef __MyCppGame__MyEnemy__
#define __MyCppGame__MyEnemy__

//#include <stdio.h>
#include "cocos2d.h"

class MyEnemy : public cocos2d::Sprite{
    
public:
    // 敵のタイプ
    enum EnemyType{
    
        human = 1,
        human2 = 2,
    };
    
    // 方向タイプ
    enum DirectionType{
        leftDirection = 1,
        rightDirection = 2,
    };
    
    
    // 動きタイプ
    enum ActionType{
        action1 = 1,
        action2 = 2,
    };
    
private:
    // 敵の動き
    //cocos2d::Action* getAction(float animtionTime, cocos2d::Point point);
    
    // オリジナルの敵の動きメソッド
    // 2015/03/19 不要
    //cocos2d::Action* getAction();
    //cocos2d::Action* getAction2();
    
    

    
protected:
    // 敵の体力
    int HP;
    
    // 敵の種類
    EnemyType _enemyType;
    
    // origin座標
    cocos2d::Vec2 origin;
    
    // 画面サイズ
    cocos2d::Size visibleSize;
    
public:
    
    MyEnemy(EnemyType enemyType);
    
    // 初期化メソッド
    virtual bool init();
    
    // Create()を使えるようにする。
    //CREATE_FUNC(MyEnemy);
    
    // CREATE_FUNCを使わない場合
    static MyEnemy* create(EnemyType enemyType);
    
    // 敵の向きを変える
    void changeDirection(bool flippedXStatus);
    
    
    // アクション開始（引数 アクションタイプ）
    void startAction();
    
    // 2015/03/19 仮
    // アクション終了
    void endAction();
    
    // 敵移動定義メソッド
    cocos2d::Sequence* getActionSequence();
    
    // 敵アニメーションメソッド
    cocos2d::RepeatForever setCharactorAnimation();
    
    
    
    
};




#endif /* defined(__MyCppGame__MyEnemy__) */
