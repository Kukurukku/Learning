#include "HelloWorldScene.h"
#include "MyEnemy.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    //auto scene = Scene::create();
    
    // higashiya テスト physicsbody用物理世界
    auto scene = Scene::createWithPhysics();
    // 物理空間を取り出す。
    /*auto world = scene->getPhysicsWorld();
    world->setDebugDrawMask(PhysicsWorld::DEBUGDRAW_ALL);*/
    
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
    
    

    
    // テスト　physicsbody用判定地面作成
    /*
    Vec2 vec[4]{
    
        Vec2(1,visibleSize.height),
        Vec2(1,1),
        Vec2(visibleSize.width-1,1),
        Vec2(visibleSize.width-1,visibleSize.height),
        
    };
    
    auto wall = Node::create();
    wall->setPhysicsBody(PhysicsBody::createEdgeChain(vec, 4, PhysicsMaterial(1.0f, 0.9f, 0.5f)));
    wall->setPosition(0, 0);
    addChild(wall);*/
    
    
    
    
    // テキストスプライトの生成と追加 テスト用
    /*auto pLSprite = LabelTTF::create("Physics Sprite", "Arial", 24);
    pLSprite->setPosition(Point(visibleSize.width / 2, 200.0f));
    pLSprite->setTag(100);
    addChild(pLSprite);
    
    // 剛体の生成
    auto lmaterial = PHYSICSBODY_MATERIAL_DEFAULT;
    lmaterial.density     = 1.0f; // 密度
    lmaterial.restitution = 0.6f; // 反発係数
    lmaterial.friction    = 0.5f; // 摩擦係数
    auto plBody = PhysicsBody::createBox(pLSprite->getContentSize(), lmaterial);
    plBody->setMass(1.0f); // 重さ
    plBody->setMoment(1000.0f); // モーメント(大きいほど回転しにくい)
    plBody->setContactTestBitmask(true);
    
    // テキストスプライトに剛体を関連付ける
    pLSprite->setPhysicsBody(plBody);
    
    // 適当な力を与えて回転させてみる
    plBody->applyImpulse(Vect(0.0f, 10.0f), Point(100.0f, 0.0f));*/
        
    
    
    //テスト敵クラスを使って敵を作成する
    //auto type = static_cast<MyEnemy::EnemyType>(1); 普通の人間
    /*auto type = static_cast<MyEnemy::EnemyType>(2); // 大きい人間
    auto enemy = MyEnemy::create(type);
    enemy->changeDirection(false);
    addChild(enemy);*/
    
    
    
    // physicsbodyテスト
    auto type = static_cast<MyEnemy::EnemyType>(1); // 走る人間
    auto enemy = MyEnemy::create(type);
    //enemy->setTag(99);
    enemy->changeDirection(false);
    
    enemy->setPosition(Point(visibleSize.width / 2, enemy->getContentSize().height/2)); //※テスト
    addChild(enemy);


    /*auto type2 = static_cast<MyEnemy::EnemyType>(2); // 走る人間
    auto enemy2 = MyEnemy::create(type2);
    enemy2->changeDirection(false);
    
    enemy2->setPosition(Point(visibleSize.width / 3, enemy2->getContentSize().height/2)); //※テスト
    addChild(enemy2);*/

    
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
