#include "HelloWorldScene.h"
#include "Enemy.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    //auto scene = Scene::create();
    
    // higashiya テスト physicsbody用物理世界
    auto scene = Scene::createWithPhysics();
    // 物理空間を取り出す。
    auto world = scene->getPhysicsWorld();
    world->setDebugDrawMask(PhysicsWorld::DEBUGDRAW_ALL);
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(HelloWorld::menuCloseCallback, this));
    
	closeItem->setPosition(Vec2(origin.x + visibleSize.width - closeItem->getContentSize().width/2 ,
                                origin.y + closeItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);

    // ここからスプライトの仮表示
    // add "HelloWorld" splash screen"
    /*auto sprite = Sprite::create("human.png");

    // position the sprite on the center of the screen
    sprite->setPosition(Vec2(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
    sprite->setScale(0.5f, 0.5f);

    // add the sprite as a child to this layer
    this->addChild(sprite, 0);*/
    
    

    
    // テスト　physicsbody用判定地面と壁作成
    Vec2 vec[5]{
    
        Vec2(1,visibleSize.height),
        Vec2(1,1),
        Vec2(visibleSize.width-1,1),
        Vec2(visibleSize.width-1,visibleSize.height),
        Vec2(1,visibleSize.height-1),
        
    };
    
    auto wall = Node::create();
    wall->setPhysicsBody(PhysicsBody::createEdgeChain(vec, 5, PhysicsMaterial(1.0f, 0.9f, 0.5f)));
    // 壁に衝突判定を入れている
    wall->getPhysicsBody()->setContactTestBitmask(true);
    wall->setPosition(0, 0);
    addChild(wall);
    
    
    // 衝突判定
    auto contactListener = EventListenerPhysicsContact::create();
    contactListener->onContactBegin = CC_CALLBACK_1(HelloWorld::collision, this);
    this->getEventDispatcher()->addEventListenerWithFixedPriority(contactListener, 10);
    
    
    
    
    // physicsbodyテスト
    /*auto type = static_cast<Enemy::EnemyType>(1); // 走る人間
    auto tag = 99;
    auto enemy = Enemy::create(type,tag); //ホントはタグも一緒に設定したい
    
    // ころす
    enemy->hitBall(1.0);
    // 走らせる
    enemy->startAction(100.0f, 0);
    enemy->setPosition(Point(visibleSize.width / 2, enemy->getContentSize().height/2)); //※テスト
    addChild(enemy);*/

    // 衝突判定用のテスト
    aa=false;

    
    // キャラクター2
    auto type2 = static_cast<Enemy::EnemyType>(2); // 走る人間
    auto tag2 = 88;
    auto enemy2 = Enemy::create(type2,tag2); //ホントはタグも一緒に設定したい
    
    // ころす
    //enemy2->hitBall(1.0);
    // 走らせる
    enemy2->startAction(100.0f, 0);
    enemy2->setPosition(Point(visibleSize.width / 2, enemy2->getContentSize().height/2)); //※テスト
    addChild(enemy2);

    
    return true;
}

void HelloWorld::menuCloseCallback(Ref* pSender)
{
#if (CC_TARGET_PLATFORM == CC_PLATFORM_WP8) || (CC_TARGET_PLATFORM == CC_PLATFORM_WINRT)
	MessageBox("You pressed the close button. Windows Store Apps do not implement a close button.","Alert");
    return;
#endif

    Director::getInstance()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}

/**
 衝突検知
 */

bool HelloWorld::collision(cocos2d::PhysicsContact& contact){
    
    // 衝突したbodyのタグから、衝突したキャラクターのタグを取得する
    auto targetBodyTag = contact.getShapeB()->getBody()->getTag();
    Enemy *enemy = (Enemy*)getChildByTag(targetBodyTag);
    // テスト壁にぶつかったと過程して
    if(!aa){
        aa=true;
        
        // テスト　飛ぶ人間だけ以下の処理
        if(targetBodyTag == 88){
            
            // ころす
            enemy->hitBall(1.0);
            
            if(enemy->getDirection() == 0){
                enemy->startAction(200.0f, 1);
            
            } else {
                enemy->startAction(200.0f, 0);
            }
        }
    } else {
        
        /*親画面でsprite呼び出した時に設定したタグで、spriteクラスではphysicsbodyを設定する
         衝突検知で衝突したボディのタグがとれるので、それと同様の設定がされているタグを親のNOdeから抽出する。
         その時に、そのspriteの現在の向きが取得できるのでそれを参考に、どっちの向きに反転させるのかを設定する
         ちなみにうえの"aa"というのは、本来は左右どちらの壁にあたったかで衝突処理を走らせたいが、
         現状の実装だと壁と地面が同じタグなので、それを回避するために設定した。
         私はあくまでEnemyクラスの内容が正しい事を確認できればいいのでとりあえずこの実装のまま置いておく
         */

        // テスト　飛ぶ人間だけ以下の処理
        if(targetBodyTag == 99){
        
            // 走る人間を処理させ続ける動き
            if(enemy->getDirection() == 0){
                enemy->startAction(500, 1);

            } else {
                enemy->startAction(500, 0);
            }
         
        
        }

        // テスト　飛ぶ人間だけ以下の処理
        if(targetBodyTag == 88){
        
        // 飛ぶ人間の動きを終了させる
        enemy->endAction();
        }
        aa=false;

    }
    
    return true;
}
