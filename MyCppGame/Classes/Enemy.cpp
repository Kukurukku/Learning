//
//  Enemy.cpp
//  MyCppGame
//
//  Created by 東屋　百合絵 on 2015/03/11.
// 3/26に日野さんに聞いたメモ
/*このクラスはあくまで
・キャラクタを表示する。(アニメーション)実装OK helloworldテストOK
・キャラクタを走らせる（所定の方向に指定のスピードで）実装OK helloworldテストOK
・キャラクタのスピード変更 実装OK helloworldテスト未実行
・キャラクターを殺す　実装OK helloworldテストOK
 
 なので、例えば壁にぶつかって反転とか考えるときに、
 勝手にenemyクラスでやらなくていい
 
 */
//
//

#include "Enemy.h"
USING_NS_CC;

Enemy::Enemy(EnemyType enemyType)
: _enemyType(enemyType)
{
}

Enemy* Enemy::create(EnemyType enemyType,int tag){
    auto enemy = new Enemy(enemyType);
    enemy->init(tag);
    enemy->autorelease();
    return  enemy;
}

/**
 初期処理
 
 【説明】
 
 初期化処理。enemyType毎のキャラクターの情報を生成する。
 
 
 【引数】
 
 tag:スプライトのタグ。剛体のタグとしても使用する。
 */
bool Enemy::init(int tag){

    // タグを設定する
    setTag(tag);
    
    // 向きをリセットする
    direction = -1;
    
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
        {enemyName = "human1.png";
            // パラパラあにめのコマ設定
            animation = Animation::create();
            animation->addSpriteFrameWithFile("human1.png");
            animation->addSpriteFrameWithFile("human2.png");
            animation->setRestoreOriginalFrame(true);
            animation->setDelayPerUnit(0.1f);
            // HPを設定する
            HP=1.0f;
            
            // 敵キャラのパラパラアニメを設定(ぱらぱらアニメが設定されている場合のみ)
            Animate *animate = Animate::create(animation);
            RepeatForever *animated = RepeatForever::create(animate);
            runAction(animated);    // アニメーションのアクション
            
            break;
        }
        // 敵キャラ2：飛ぶ人間
        case human2:
            enemyName = "human_j1.png";
            //setScale(1.5f, 1.5f);
            HP=2.0f;
            break;
            
        default:
            break;
    }
    
    // 敵キャラ画像設定
    Sprite::initWithFile(enemyName);

    
    // 剛体の生成
    auto enemyMat = PHYSICSBODY_MATERIAL_DEFAULT;
    enemyMat.density     = 1.0f; // 密度
    enemyMat.restitution = 0.6f; // 反発係数
    enemyMat.friction    = 0.0f; // 摩擦係数
    enemyBody = PhysicsBody::createBox(getContentSize(), enemyMat);
    enemyBody->setMass(1.0f); // 重さ
    enemyBody->setMoment(1000.0f); // モーメント(大きいほど回転しにくい)
    enemyBody->setRotationEnable(false); // 回転させない
    enemyBody->setContactTestBitmask(true); // 衝突検知用
    enemyBody->setTag(getTag());    // タグ付け スプライトと同じタグを設定
    
    // テキストスプライトに剛体を関連付ける
    setPhysicsBody(enemyBody);
    
    // サウンドのプリロード
    CocosDenshion::SimpleAudioEngine::sharedEngine()->preloadEffect(SOUND_EFFECT);
    
    return true;
}

/**
 敵アクションスタート
 
【説明】
 力と向きを指定し、その方向に走らせる
 
 【引数】
 speed キャラクターの移動スピード
 directionType キャラクターのスプライトの向き 0:左 1:右
 
 4/2追記
 いろんなキャラクタの動きをここで設定する。
 その場合はenemytypeで判断する。
 */
void Enemy::startAction(float speed, int directionType){
 
    float sp = speed;
    
    // 指定の向きを、現在の向きとしてenemyクラス変数に設定
    direction = directionType;
    
    // 指定した方向にスプライトの向きを変える 0:左 1:右
    if(direction == DimentionType(0)) {
        
        // スプライトの向きを左に設定
        setFlippedX(false);
        
        sp = speed*-1;
        

    } else {
        // スプライトの向きを右に設定
        setFlippedX(true);
    
    }
    // 人間をspeedの方向に向けて走らせる
    enemyBody->applyImpulse(Vect(sp, 10.0f), Point(0.0f, 0.0f));
    
    
    
    // 飛ぶ種類の場合ジャンプアクションを呼び出す
    if(_enemyType == human2) {
    
        jumpAction(START);
    }
    
}

/**
 キャラクターのスピードを変える
 
 【引数】
 changeSpeed キャラクターの変更後の移動スピード

 */
void Enemy::changeSpeed(float changeSpeed){

    enemyBody->applyImpulse(Vect(changeSpeed, 10.0f), Point(0.0f, 0.0f));
}

/**
糞HIT時処理
 
 【説明】
 
 糞があたった場合のアクションを定義。ダメージを受けたらHPを減少させダメージ演出（点滅）をする
 HPの状態により、敵が生きてるのか死んだのかを返す
 
 【引数】
 
 damage:ダメージ数
 
 【戻り値】
 
 enemyの生死状態 0:死 1:生
 */
int Enemy::hitBall(int damage){

    // HPを削る
    HP = HP-damage;
    
    // 返却値を初期化
    int result = ALIVE;
    
    // 当たった音を鳴らす
    // EFFECTの場合
    CocosDenshion::SimpleAudioEngine::sharedEngine()
    ->playEffect(SOUND_EFFECT,false);
    
    // HPが０だったら倒れる演出させる
    if(HP <= 0){
        // 死んだら親はgetActionで呼び出して、enemyの死亡アニメーション→親がスプライトを消すというシーケンス実行したほうがいいかも
        // 死亡アクションアニメーション
        Enemy::getDeadActionSequence();
        if(runAction(getDeadActionSequence())){
                result = DEAD;
                // 敵キャラの生死を返却
                return result;
        }

    } else {
     
     // ダメージが0でないばあい、ダメージ受けたリアクション（点滅）をする
     auto blink = Blink::create(1,10);
     runAction(blink);
    }
    
    // 敵キャラの生死を返却
    return result;

}

/**
 敵キャラの向きを取得する
 
 【説明】
 
 スプライトの向きを取得する
 
 【戻り値】
 
 
 現在のスプライトの向き 0:左　1:右
 */
int Enemy::getDirection(){

    return direction;

}

/**
 敵キャラの向きを変更する
 
 【説明】
 
 現在の敵キャラの向きと逆の向きにするメソッド
 
 
 */
void Enemy::changeDirection(){
    
    // 0:左 1:右
    if(direction == DimentionType(0)) {
        
        // スプライトの向きを右に設定
        setFlippedX(false);
        
        // 現在の向き(右）を設定
        direction = DimentionType(1);
        
    } else {
        // スプライトの向きを左に設定
        setFlippedX(true);
        
        // 現在の向き(左）を設定
        direction = DimentionType(0);
        
    }
    
}

/**
 敵キャラジャンプアクション追加
 
 【説明】
 
 敵キャラタイプ:human2の場合のジャンプのアクション定義。
 引数によって処理を分岐する。
 START: ジャンプ中画像に差し替え。ジャンプのちからをphysicsbodyに与える
 END:ジャンプ後の画像に差し替える。
 
 
 【引数】
 
 actionType:ジャンプ開始か終了か 0:start 1:end
 */
void Enemy::jumpAction(int actionType){
    
    Texture2D *pTexture;
    
    // physicsbodyを書き換えるために取得する
    PhysicsBody *targetBody = getPhysicsBody();
    
    if(actionType == START){
        
        // ジャンプさせるため、物理影響を受けるように設定
        //targetBody->setDynamic(true);

        // human_j2.pngを使ってCCTexture2Dを作成
        pTexture = TextureCache::sharedTextureCache()->addImage("human_j2.png");
        // スプライトの画像を飛んでる時の画像に差し替える
        setTexture(pTexture);
        enemyBody->applyImpulse(Vect(0.0f, 100.0f), Point(0.0f, 0.0f));
        
    } else {
    
        // ジャンプ終了のため、物理影響を受けないように設定　エラーになるため一時コメントアウト
        //targetBody->setDynamic(false);
        
        // human_j1.pngを使ってCCTexture2Dを作成
        pTexture = TextureCache::sharedTextureCache()->addImage("human_j1.png");
        setTexture(pTexture);
    }
    
}

/**
 敵キャラアクション終了
 
 【説明】
 
 enemyType毎終了処理を呼ぶ
 ※現状human2のみ実装
*/
void Enemy::endAction(){

    switch (_enemyType) {
            
        // 飛ぶ人間の着地処理をする
        case human2:
            jumpAction(END);
            break;
            
        default:
            break;
    }

}
// 4/16追記
//　敵死亡アニメーションシーケンス
Sequence* Enemy::getDeadActionSequence(){    
    // 現在のアニメーションを停止　以下うまくいかないので一旦コメントアウト
    //stopAllActions();
    
    // たまが当たったら倒れて点滅する演出を呼ぶ
    cocos2d::CallFunc *move1 = CallFunc::create([this](){

        // 敵キャラ死亡アニメーション
        Animation *animation;
        animation = Animation::create();
        animation->addSpriteFrameWithFile("human_d.png");
        animation->setRestoreOriginalFrame(true);
        animation->setDelayPerUnit(1.0f);
         
        Animate *animate = Animate::create(animation);

        RepeatForever *animated = RepeatForever::create(animate);
        runAction(animated);    // アニメーションのアクション*/
        
        // テスト死んだ画像に差し替える
        /*Texture2D *pTexture = TextureCache::sharedTextureCache()->addImage("human_d.png");
         setTexture(pTexture);*/
        
    });
    cocos2d::CallFunc *move2 = CallFunc::create([this](){
        
        // ダメージが0でないばあい、ダメージ受けたリアクション（点滅）をする
        auto blink = Blink::create(0.5,5.0);
        runAction(blink);
        
    });
    cocos2d::CallFunc *compCallFunc = CallFunc::create([this](){
        //フェードアウト
        ActionInterval* fadeOut = CCFadeOut::create(3);
        runAction(fadeOut);
    });
    
    
    auto ss = cocos2d::Sequence::create(move1,move2,compCallFunc,NULL);
    
    return ss;
}




