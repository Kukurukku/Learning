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
#include "HelloWorldScene.h"
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
        case RUN_MIDDLE_LEFT:
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
            
            // 5/21追加：スピードを設定
            SPEED = 300.0f;
            direction = 1; /*5/28追記*/
            break;
        }
            // 敵キャラ：走る人間
        case RUN_MIDDLE_RIGHT:
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
            
            // 5/21追加：スピードを設定
            SPEED = 300.0f;
            direction = 0; /*5/28追記*/
            break;
        }

        // 敵キャラ2：ランダム飛ぶ人間
        case JUMP_MIDDLE_RANDOM:
            enemyName = "human_j1.png";
            //setScale(1.5f, 1.5f);
            direction = 1; /*5/28追記*/
            HP=2.0f;
            SPEED = 100.0f;
            break;
        // 敵キャラ4：垂直飛ぶ人間
        case JUMP_MIDDLE_VERTICAL:
            enemyName = "human_j1.png";
            //setScale(1.5f, 1.5f);
            direction = 1; /*5/28追記*/
            HP=2.0f;
            SPEED = 100.0f;
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
 キャラクタタイプと現在の向きにより、指定のスピード方向にアクションさせる
 
 【引数】
 4/2追記
 いろんなキャラクタの動きをここで設定する。
 その場合はenemytypeで判断する。
 */
void Enemy::executeAction(/*float speed, int directionType*/){
    
    // キャラクタ毎にexecuteActionした動きが違うので、enemytypeによって別の動きメソッドを呼ぶ
    switch(_enemyType){
        case RUN_MIDDLE_LEFT:
            executeEnemyRunType();
            break;
        case RUN_MIDDLE_RIGHT:
            executeEnemyRunType();
            break;
        case JUMP_MIDDLE_RANDOM:
            executeEnemyJumpRandomType();
            break;
        case JUMP_MIDDLE_VERTICAL:
            executeEnemyJumpVerticalType();
    
    };
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
int Enemy::hitBall(HelloWorld *parent,int damage){

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
        

        //メニューアイテムのやりかたを見る
        /*複数　的　カウンターをメイン側で
        コールバック側で持てば
         やり方としてはコールバック関数をもらって、それを、アニメーション終了のコールバック関数に入れると良さそう
         だからこちらではRemoveSelfとかを呼ばなくてOK
         しかしやり方がわからない↓*/
        
        //Sequence *seq = cocos2d::Sequence::create(getDeadAction(),function,NULL);
        int targetTag = getTag();
        cocos2d::CallFunc *compCallFunc = CallFunc::create([this](){
            
            if (_callback) _callback(this);
            //if (m_callback) m_callback(targetTag);
            //HelloWorldSceneのスプライト消去メソッドを実行
            //parent->removeEnemy(targetTag);
            
        });
        
        auto action = cocos2d::Sequence::create(getDeadAction(),compCallFunc, NULL);

        runAction(action);
        
        // 敵キャラ死亡ステータス設定
        result = DEAD;

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
void Enemy::jumpAction(/*int actionType*/){
    // 5/28あたらしくした
    Texture2D *pTexture1 = TextureCache::sharedTextureCache()->addImage("human_j1.png");
    Texture2D *pTexture2 = TextureCache::sharedTextureCache()->addImage("human_j2.png");
    auto callfunc1 = CallFunc::create([this,pTexture1](){
        PhysicsBody *targetBody = getPhysicsBody();
        targetBody->resetForces();
        setPhysicsBody(targetBody);
        // human_j1.pngを使ってCCTexture2Dを作成
        setTexture(pTexture1);
        
    });
    
    auto callfunc2 = CallFunc::create([this,pTexture2](){
        setTexture(pTexture2);

    });
    
    auto callfuncEnd = CallFunc::create([this,pTexture2](){

        // human_j2.pngを使ってCCTexture2Dを作成
        setTexture(pTexture2);
        enemyBody->applyImpulse(Vect(0.0f, 100.0f), Point(0.0f, 0.0f));
        
    });
    
    // スプライト画像切替のためディレイを設ける
    auto delay = DelayTime::create(0.3f);
    auto sequence = cocos2d::Sequence::create(callfunc1,delay,callfuncEnd,NULL);
    
    runAction(sequence);

    //Texture2D *pTexture;
    
    // physicsbodyを書き換えるために取得する
    //PhysicsBody *targetBody = getPhysicsBody();
    /*if(actionType == START){
        
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
    }*/
    
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
        case JUMP_MIDDLE_RANDOM:
            jumpAction(/*END*/);
            break;
        default:
            break;
    }

}
// 4/16追記
//　敵死亡アニメーションシーケンス
Sequence* Enemy::getDeadAction(){
    
    // 敵の動きを止める
    PhysicsBody *targetBody = getPhysicsBody();
    targetBody->removeFromWorld();
    
    // テスト死んだ画像に差し替える（注意：差し替え前の画像とアスペクト比率が一緒でないと画像が変に引き延ばされる。その場合は上記の死亡アニメーションを使う事）
    //Texture2D *pTexture =
    setTexture(TextureCache::sharedTextureCache()->addImage("human_d.png"));
    
    // 敵キャラ死亡アニメーション
    /*Animation *animation;
    animation = Animation::create();
    animation->addSpriteFrameWithFile("human_d.png");
    animation->setRestoreOriginalFrame(true);
    animation->setDelayPerUnit(1.0f);
         
    Animate *animate = Animate::create(animation);

    RepeatForever *animated = RepeatForever::create(animate);
    runAction(animated);    // アニメーションのアクション*/

    //点滅
    auto blink = Blink::create(0.5,4.0);

    //フェードアウト(不安定)
    ActionInterval* fadeOut = CCFadeOut::create(0.5);
    runAction(fadeOut);
    
    auto sequence = cocos2d::Sequence::create(blink,fadeOut,NULL);
    
    runAction(sequence);
    
    return sequence;
}

/**
 コールバック関数を受け取る
 */
/*void Enemy::setCallback(const std::function<void (int)> &callback)
 {
 m_callback = callback;
 }*/

void Enemy::setCallback(const enemyAnimationEndCallback& callback)
{
    _callback = callback;
}


/**
*/
int Enemy::getEnemyDirection(bool isFirst){

    int DIRECTION;
    // 敵キャラクタのタイプにより、細かく動作を分岐する
    switch (_enemyType) {
        
        // 走る人左側中速
        case 10:
            // 初回の場合は左側にrun開始
            if(isFirst){
                DIRECTION=0;
                
            } else {
                // 初回じゃない場合、現在の向きと逆になるように設定する
                if(direction == DimentionType(0)) {
                    DIRECTION=1;
                } else {
                    DIRECTION=0;
                }
                
                
            }
            break;
        // 走る人右側中速
        case 11:
            
            if(isFirst){
                DIRECTION=1;
                
            } else {
                // 初回じゃない場合、現在の向きと逆になるように設定する
                if(direction == DimentionType(0)) {
                    DIRECTION=1;
                } else {
                    DIRECTION=0;
                }
                
                
            }
            break;
        // 飛ぶ人左側中速
        case 20:
            
            if(isFirst){
                DIRECTION=0;
                
            } else {
                // 初回じゃない場合、現在の向きと逆になるように設定する
                if(direction == DimentionType(0)) {
                    DIRECTION=1;
                } else {
                    DIRECTION=0;
                }
            }
            break;
        // 飛ぶ人右側中速
        case 21:
            
            if(isFirst){
                DIRECTION=1;
                
            } else {
                // 初回じゃない場合、現在の向きと逆になるように設定する
                if(direction == DimentionType(0)) {
                    DIRECTION=1;
                } else {
                    DIRECTION=0;
                }
                
                
            }

            break;
            
    }

    return DIRECTION;
}


/**
 敵キャラのアクション（走る人）
 */
void Enemy::executeEnemyRunType(){


    // 5/21追加：こっからしたメソッド終わりまで全部
    //初回作成かそうでないかのフラグを立てる。
    /*bool isFirst =true;
    
    if(direction !=-1){
        // 初回作成じゃない場合
        isFirst =false;
    }*/
    
    //　敵のスピード設定用変数
    float sp = 0;
    
    // 敵の向きを取得
    changeDirection();
    //direction = getEnemyDirection(isFirst);
    
    // 敵の動きを止めるためにphysicsBody取得
    PhysicsBody *targetBody = getPhysicsBody();
    
    // 敵の動きを止める
    targetBody->resetForces();
    
    // スプライトの向きとスピードを指定する
    if(direction == DimentionType(0)) {
        
        // スプライトの向きを左に設定
        setFlippedX(false);
        
        sp = SPEED*-1;
        
        
    } else {
        // スプライトの向きを右に設定
        setFlippedX(true);
        sp = SPEED;
        targetBody->resetForces();
    }
    
    // 人間をspeedの方向に向けて走らせる
    enemyBody->applyImpulse(Vect(sp, 10.0f), Point(0.0f, 0.0f));

}

/**
 敵キャラのアクション（飛ぶ人）
 */
void Enemy::executeEnemyJumpRandomType(){
    
    //　敵のスピード設定用変数
    float sp = 0;
    
    
    // 飛ぶ方向をランダムに
    int randomNum = arc4random_uniform(2);
    
    // 敵の向きを取得
    direction = randomNum;
    
    // 敵の動きを止めるためにphysicsBody取得
    PhysicsBody *targetBody = getPhysicsBody();
    
    // 敵の動きを止める
    targetBody->resetForces();
    
    // スプライトの向きとスピードを指定する
    if(direction == DimentionType(0)) {
        
        // スプライトの向きを左に設定
        setFlippedX(false);
        
        sp = SPEED*-1;
        
        
    } else {
        // スプライトの向きを右に設定
        setFlippedX(true);
        sp = SPEED;
        targetBody->resetForces();
    }
    
    // 人間をspeedの方向に向けて走らせる
    enemyBody->applyImpulse(Vect(sp, 10.0f), Point(0.0f, 0.0f));

    jumpAction(/*START*/);

    
}
/**
 敵キャラのアクション（垂直飛ぶ人）
 */
void Enemy::executeEnemyJumpVerticalType(){
    
    //　敵のスピード設定用変数
    float sp = 0;
    
    // 敵の向きを取得
    direction = 0;
    
    // 敵の動きを止めるためにphysicsBody取得
    PhysicsBody *targetBody = getPhysicsBody();
    
    // 敵の動きを止める
    targetBody->resetForces();
    
    // スプライトの向きとスピードを指定する
    if(direction == DimentionType(0)) {
        
        // スプライトの向きを左に設定
        setFlippedX(false);
        
        sp = SPEED*-1;
        
        
    } else {
        // スプライトの向きを右に設定
        setFlippedX(true);
        sp = SPEED;
        targetBody->resetForces();
    }
    
    jumpAction(/*START*/);
    
    
}


