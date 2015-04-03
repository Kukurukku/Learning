//
//  Enemy.h
//  MyCppGame
//
//  Created by 東屋　百合絵 on 2015/03/11.
//
//

#ifndef __MyCppGame__Enemy__
#define __MyCppGame__Enemy__

//#include <stdio.h>
#include "cocos2d.h"

class Enemy : public cocos2d::Sprite{
    
public:
    // 敵のタイプ
    enum EnemyType{
    
        // 走る人間
        human = 1,
        // 飛ぶ人間
        human2 = 2,
    };

    // 敵の向き
    enum DimentionType{
        
        // 左
        left = 0,
        // 右
        right = 1,
    };
private:
    
    
protected:
    // 敵のタグ
    int _tag;
    
    // 敵の体力
    float HP;
    
    // 敵の向き
    int direction;
    
    // 敵の種類
    EnemyType _enemyType;
    
    // origin座標
    cocos2d::Vec2 origin;
    
    // 画面サイズ
    cocos2d::Size visibleSize;
    
    // キャラクターを物体に。
    cocos2d::PhysicsBody *enemyBody;
    
    // 上下左右の壁を物体に
    cocos2d::PhysicsBody *pTopWallBody;
    cocos2d::PhysicsBody *pBottomWallBody;
    cocos2d::PhysicsBody *pRightWallBody;
    cocos2d::PhysicsBody *pLeftWallBody;
    
    
public:
    
    Enemy(EnemyType enemyType);
    
    // 初期化メソッド
    virtual bool init(int tag);
    
    // CREATE_FUNCを使わない場合
    static Enemy* create(EnemyType enemyType, int tag);
    
    // アクション開始（引数 アクションタイプ）
    // 改：力と、向き情報を取得して、その方向に走らせる
    void startAction(float speed, int directionType);

    // 仮
    void startActionWithDirectionType(float speed, int directionType);
    
    // アクション終了
    void endAction();
    
    // 敵HIT
    void hitBall(int damage);
    
    // キャラクタースピード調整
    void changeSpeed(float changeSpeed);
    
    // 敵の向きを取得
    int getDirection();
    
    // 敵の向きを変える
    void changeDirection();
    
};




#endif /* defined(__MyCppGame__Enemy__) */
