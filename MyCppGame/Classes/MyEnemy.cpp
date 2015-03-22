//
//  MyEnemy.cpp
//  MyCppGame
//
//  Created by 東屋　百合絵 on 2015/03/11.
//
//

#include "MyEnemy.h"
USING_NS_CC;

MyEnemy::MyEnemy(EnemyType enemyType)
: _enemyType(enemyType)
{
}

MyEnemy* MyEnemy::create(EnemyType enemyType){
    auto enemy = new MyEnemy(enemyType);
    enemy->init();
    enemy->autorelease();
    return  enemy;
}

bool MyEnemy::init(){

    // 初期化処理でやること(1.originとvisibleSize設定、2.どの敵キャラか設定→初期位置設定→敵キャラ画像アニメ設定)
    
    visibleSize = Director::getInstance()->getVisibleSize();
    origin = Director::getInstance()->getVisibleOrigin();
    
    
    // 敵キャラファイル名
    std::string enemyName;
    // 敵キャラアニメーション
    Animation *animation;
    
    if (!Sprite::init()) {
        return false;
    }
    
    switch (_enemyType) {
            
        // 敵キャラ：走る人間
        case human:
            enemyName = "human1.png";
            // パラパラあにめのコマ設定
            animation = Animation::create();
            animation->addSpriteFrameWithFile("human1.png");
            animation->addSpriteFrameWithFile("human2.png");
            animation->setRestoreOriginalFrame(true);
            animation->setDelayPerUnit(0.1f);
            HP=1;
            break;
            
        // 敵キャラ2：飛ぶ人間
        case human2:
            enemyName = "human_j1.png";
            setScale(1.5f, 1.5f);
            // パラパラあにめのコマ設定
            animation = Animation::create();
            animation->addSpriteFrameWithFile("human_j1.png");
            animation->addSpriteFrameWithFile("human_j2.png");
            animation->setRestoreOriginalFrame(true);
            animation->setDelayPerUnit(0.3f);
            
            break;
            
        default:
            break;
    }
    
    // 敵キャラ画像設定
    Sprite::initWithFile(enemyName);
    setTag(10);
    
    /*spEnemy = Sprite::create(enemyName);
    spEnemy->setTag(10);*/

    // 敵キャラのパラパラアニメを設定
    Animate *animate = Animate::create(animation);
    RepeatForever *animated = RepeatForever::create(animate);
    runAction(animated);    // アニメーションのアクション
    //spEnemy->runAction(animated);    // アニメーションのアクション
    
    //衝突検知用の壁を作る
    MyEnemy::createWall();

    
    // 衝突判定
    auto contactListener = EventListenerPhysicsContact::create();
    contactListener->onContactBegin = CC_CALLBACK_1(MyEnemy::collision, this);
    this->getEventDispatcher()->addEventListenerWithFixedPriority(contactListener, 10);
    
    
    
    // 剛体の生成
    auto enemyMat = PHYSICSBODY_MATERIAL_DEFAULT;
    enemyMat.density     = 1.0f; // 密度
    enemyMat.restitution = 0.6f; // 反発係数
    enemyMat.friction    = 0.0f; // 摩擦係数
    enemyBody = PhysicsBody::createBox(getContentSize(), enemyMat);
    enemyBody->setMass(1.0f); // 重さ
    enemyBody->setMoment(1000.0f); // モーメント(大きいほど回転しにくい)
    enemyBody->setContactTestBitmask(true); // 衝突検知用
    enemyBody->setTag(10);
    
    // テキストスプライトに剛体を関連付ける
    setPhysicsBody(enemyBody);
    //spEnemy->setPhysicsBody(enemyBody);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 動作アクションスタート
    startAction();
    
    return true;
}

// 敵の向きを変える
void MyEnemy::changeDirection(bool flippedXStatus){
    
    if(flippedXStatus) {
    
        setFlippedX(true);
    
    } else {
        setFlippedX(false);
    
    }
    
}


/**
 アクションをスタートさせる
 */
void MyEnemy::startAction(){
    
    // 人間を左に向かって走り出させる
    enemyBody->applyImpulse(Vect(-300.0f, 10.0f), Point(0.0f, 0.0f));
}


/**
 衝突検知
 */

bool MyEnemy::collision(cocos2d::PhysicsContact& contact){
    
    // 衝突したキャラクターのPhysicsBodyを取得する
    cocos2d::PhysicsBody *targetBody = contact.getShapeA()->getBody();
    
    // 衝突されたのが左右どちらかの壁の場合、走る方向を反転させる
    if(contact.getShapeB()->getBody()->getTag()==2){
        // 左に走らせる
        targetBody->applyImpulse(Vect(-500.0f, 10.0f), Point(0.0f, 0.0f));
        setFlippedX(false);
        
        // テスト中。右の壁にあたると死ぬ
        hitBall(targetBody);
    
    } else if(contact.getShapeB()->getBody()->getTag()==3){
        // 右に走らせる
        targetBody->applyImpulse(Vect(500.0f, 10.0f), Point(0.0f, 0.0f));
        setFlippedX(true);
        
    }

    return true;
}


/**
 壁生成
 左右壁は衝突判定用
 */
void MyEnemy::createWall(){
    // テキストスプライトの生成と追加
    
    // 右
    auto spRightWall = Sprite::create();
    spRightWall->setTextureRect(Rect(0,0,10,visibleSize.height));
    spRightWall->setPosition(Point(visibleSize.width, spRightWall->getContentSize().height/2));
    addChild(spRightWall);
    
    // 左
    auto spLeftWall = Sprite::create();
    spLeftWall->setTextureRect(Rect(0,0,10,visibleSize.height));
    spLeftWall->setPosition(Point(0, spLeftWall->getContentSize().height/2));
    addChild(spLeftWall);
    
    // 上
    auto spTopWall = Sprite::create();
    spTopWall->setTextureRect(Rect(0,0,visibleSize.width,5));
    spTopWall->setPosition(Point(spTopWall->getContentSize().width/2, spTopWall->getContentSize().height/2));
    addChild(spTopWall);
    
    // 下
    auto spBottomWall = Sprite::create();
    spBottomWall->setTextureRect(Rect(0,0,visibleSize.width,5));
    spBottomWall->setPosition(Point(spBottomWall->getContentSize().width/2, visibleSize.height - spTopWall->getContentSize().height/2));
    addChild(spBottomWall);
    
    // 剛体の生成
    auto material = PHYSICSBODY_MATERIAL_DEFAULT;
    material.density     = 1.0f; // 密度
    material.restitution = 0.6f; // 反発係数
    material.friction    = 0.5f; // 摩擦係数
    
    
    // physicsbody右
    pRightWallBody = PhysicsBody::createBox(spRightWall->getContentSize(), material);
    pRightWallBody->setContactTestBitmask(true);
    pRightWallBody->setDynamic(false);
    pRightWallBody->setTag(2);
    
    // physicsbody左
    pLeftWallBody = PhysicsBody::createBox(spLeftWall->getContentSize(), material);
    pLeftWallBody->setContactTestBitmask(true);
    pLeftWallBody->setDynamic(false);
    pLeftWallBody->setTag(3);
    
    // physicsbody上
    pTopWallBody = PhysicsBody::createBox(spTopWall->getContentSize(), material);
    pTopWallBody->setContactTestBitmask(true);
    pTopWallBody->setDynamic(false);
    pTopWallBody->setTag(0);
    
    // physicsbody左
    pBottomWallBody = PhysicsBody::createBox(spBottomWall->getContentSize(), material);
    pBottomWallBody->setContactTestBitmask(true);
    pBottomWallBody->setDynamic(false);
    pBottomWallBody->setTag(1);
    
    // テキストスプライトに剛体を関連付ける
    spRightWall->setPhysicsBody(pRightWallBody);
    spLeftWall->setPhysicsBody(pLeftWallBody);
    
    spTopWall->setPhysicsBody(pTopWallBody);
    spBottomWall->setPhysicsBody(pBottomWallBody);
    
    
}

/**
 玉があたったときの実装
 テスト中：右の壁に当たると死ぬようになっているが、左右移動が止まらない
 */
void MyEnemy::hitBall(cocos2d::PhysicsBody *pBody){

    // HPを削る
    HP = HP-1;
    
    // HPが０だったら倒れる演出させる
    if(HP ==0){
        // 現在のアニメーションを停止
        stopAllActions();
        
        // 敵キャラ死亡アニメーション
        Animation *animation;
        animation = Animation::create();
        animation->addSpriteFrameWithFile("human_d.png");
        animation->setRestoreOriginalFrame(true);
        animation->setDelayPerUnit(0.3f);
        
        Animate *animate = Animate::create(animation);
        RepeatForever *animated = RepeatForever::create(animate);
        runAction(animated);    // アニメーションのアクション
        
        // 現在の剛体書き換え
        auto enemyMat = PHYSICSBODY_MATERIAL_DEFAULT;
        enemyMat.density     = 1.0f; // 密度
        enemyMat.restitution = 0.6f; // 反発係数
        enemyMat.friction    = 10.0f; // 摩擦係数
        
        //テスト用これでbodyの動きは止まるが・・
        pBody->removeFromWorld();
        //pBody = PhysicsBody::createBox(getContentSize(), enemyMat);
        
        
        
        
    }
}


// テスト用。壁にぶつかったやつだけspriteの向きを反転させるため。　Humanクラスを参考に、addparentメソッド
void MyEnemy::addParent(cocos2d::Node *pParent){


    pParent->addChild(spEnemy,0);
    

}
