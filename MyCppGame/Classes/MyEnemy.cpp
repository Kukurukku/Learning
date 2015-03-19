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
            
        // 敵キャラ：人の動き定義
        case human:
            enemyName = "human1.png";
            // パラパラあにめのコマ設定
            animation = Animation::create();
            animation->addSpriteFrameWithFile("human1.png");
            animation->addSpriteFrameWithFile("human2.png");
            animation->setRestoreOriginalFrame(true);
            animation->setDelayPerUnit(0.1f);
            
            break;
            
        // 敵キャラ2：巨人の動き定義
        case human2:
            enemyName = "human1.png";
            setScale(1.5f, 1.5f);
            // パラパラあにめのコマ設定
            animation = Animation::create();
            animation->addSpriteFrameWithFile("human1.png");
            animation->addSpriteFrameWithFile("human2.png");
            animation->setRestoreOriginalFrame(true);
            animation->setDelayPerUnit(0.3f);
            
            break;
            
        default:
            break;
    }
    
    // 敵キャラ画像設定
    Sprite::initWithFile(enemyName);
    
    // 初期位置を設定(※いずれ、初期位置を指定できるようにする)
    setPosition(origin.x + visibleSize.width - getContentSize().width/2 ,
                origin.y + getContentSize().height/2);

    // 敵キャラのパラパラアニメを設定
    Animate *animate = Animate::create(animation);
    RepeatForever *animated = RepeatForever::create(animate);
    
    runAction(animated);    // アニメーションのアクション
    
    startAction();
    
    return true;
}

//　人間1のアニメーションシーケンス
Sequence* MyEnemy::getActionSequence(){
    
    auto move1 = MoveTo::create(2.0f, Point(origin.x + getContentSize().width/2,origin.y + getContentSize().height/2));
    auto move2 = MoveTo::create(2.0f, Point(visibleSize.width - getContentSize().width/2,origin.y + getContentSize().height/2));
    
    // move1終了時の向き変え
    cocos2d::CallFunc *compMove1 = CallFunc::create([this](){
        // アニメーション終了後にやりたいこと:キャラクターの向き変更
        MyEnemy::changeDirection(true);
        
    });
    cocos2d::CallFunc *compMove2 = CallFunc::create([this](){
        // アニメーション終了後にやりたいこと:キャラクターの向き変更
        MyEnemy::changeDirection(false);
        
    });
    
    cocos2d::CallFunc *compCallFunc = CallFunc::create([this](){
        // アニメーション終了後にやりたいこと
        startAction();
        
    });
    

    auto ss = cocos2d::Sequence::create(move1,compMove1,move2,compMove2,compCallFunc,NULL);
    
    return ss;
}




// 敵の向きを変える
void MyEnemy::changeDirection(bool flippedXStatus){
    
    if(flippedXStatus) {
    
        setFlippedX(true);
    
    } else {
        setFlippedX(false);
    
    }
    
}


// start行ったり来たり
// アクションをスタートさせるメソッド()
void MyEnemy::startAction(){

    // 引数
    // 開始位置 :画面右端固定
    
    getActionSequence();
    runAction(getActionSequence()); // 動きのアクション

}


/* 一旦不要メソッド
 
//人間1のアクション(右→左)
Action* MyEnemy::getAction(){
    
    //auto winSize = Director::getInstance()->getWinSize();
    auto move = MoveTo::create(10.0f, Point(origin.x + getContentSize().width/2,origin.y + getContentSize().height/2));
    
    return move;
}

//人間2のアクション(左→右)
Action* MyEnemy::getAction2(){
    
    /*Size visibleSize = Director::getInstance()->getVisibleSize();
     Vec2 origin = Director::getInstance()->getVisibleOrigin();
     setPosition(origin.x + getContentSize().width/2 ,
     origin.y + getContentSize().height/2);
    
    auto winSize = Director::getInstance()->getWinSize();
    auto move = MoveTo::create(10.0f, Point(visibleSize.width - getContentSize().width/2,origin.y + getContentSize().height/2));
    
    return move;
}
*/

