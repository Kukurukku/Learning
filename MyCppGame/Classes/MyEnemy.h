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
    
        // 走る人間
        human = 1,
        // 飛ぶ人間
        human2 = 2,
    };

private:
    
    
protected:
    // 敵の体力
    int HP;
    
    // 敵の種類
    EnemyType _enemyType;
    
    // origin座標
    cocos2d::Vec2 origin;
    
    // 画面サイズ
    cocos2d::Size visibleSize;
    
    // 衝突用の壁生成
    void createWall();
    
    // キャラクターを物体に。
    cocos2d::PhysicsBody *enemyBody;
    
    // 上下左右の壁を物体に
    cocos2d::PhysicsBody *pTopWallBody;
    cocos2d::PhysicsBody *pBottomWallBody;
    cocos2d::PhysicsBody *pRightWallBody;
    cocos2d::PhysicsBody *pLeftWallBody;
    
    // 敵キャラのsprite定義テスト用。壁にぶつかったやつだけspriteの向きを反転させるため。　Humanクラスを参考に、addparentメソッド
    cocos2d::Sprite *spEnemy;
    
public:
    
    MyEnemy(EnemyType enemyType);
    
    // 初期化メソッド
    virtual bool init();
    
    // CREATE_FUNCを使わない場合
    static MyEnemy* create(EnemyType enemyType);
    
    // 敵の向きを変える
    void changeDirection(bool flippedXStatus);
    
    
    // アクション開始（引数 アクションタイプ）
    void startAction();
    
    // アクション終了
    void endAction();

    // physicsbodyテスト用　衝突検知
    bool collision(cocos2d::PhysicsContact& contact);
    
    
    // 玉があたったときの実装
    void hitBall(cocos2d::PhysicsBody *pBody);
    
    
    
    // テスト用。壁にぶつかったやつだけspriteの向きを反転させるため。　Humanクラスを参考に、addparentメソッド
    void addParent(cocos2d::Node *pParent);
    
};




#endif /* defined(__MyCppGame__MyEnemy__) */
