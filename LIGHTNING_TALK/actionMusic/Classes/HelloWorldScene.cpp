#include "HelloWorldScene.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

bool HelloWorld::init()
{
    if ( !Layer::init() )
    {
        return false;
    }
    
    // acf, acb, awbからCueSheetを読み込んでいる
    auto cueSheet = ADX2::CueSheet::create("ADX2_samples.acf",
                                           "Basic.acb",
                                           "Basic.awb");
    this->setCueSheet(cueSheet);
    // 「お誕生日おめでとうございます」を再生してる
    _cueSheet->playCueByID(1);
    
    return true;
}

HelloWorld::HelloWorld()
: _cueSheet(nullptr)
{
}

HelloWorld::~HelloWorld()
{
    CC_SAFE_RELEASE_NULL(_cueSheet);
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
