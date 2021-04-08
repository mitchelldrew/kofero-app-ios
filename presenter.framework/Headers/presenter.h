#import <Foundation/NSArray.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSError.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>

@class PresenterKotlinException, PresenterModelObj, PresenterModelCharacter, PresenterModelGame, PresenterModelMove, PresenterKotlinThrowable, PresenterKotlinArray<T>;

@protocol PresenterIImageProviderListener, PresenterIProviderListener, PresenterIGameView, PresenterIGamePresenter, PresenterIProvider, PresenterIImageProvider, PresenterIHomeView, PresenterIHomePresenter, PresenterIMovePresenter, PresenterICharacterView, PresenterICharacterPresenter, PresenterIRootView, PresenterIRootPresenter, PresenterKotlinIterator;

NS_ASSUME_NONNULL_BEGIN
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-warning-option"
#pragma clang diagnostic ignored "-Wincompatible-property-type"
#pragma clang diagnostic ignored "-Wnullability"

__attribute__((swift_name("KotlinBase")))
@interface PresenterBase : NSObject
- (instancetype)init __attribute__((unavailable));
+ (instancetype)new __attribute__((unavailable));
+ (void)initialize __attribute__((objc_requires_super));
@end;

@interface PresenterBase (PresenterBaseCopying) <NSCopying>
@end;

__attribute__((swift_name("KotlinMutableSet")))
@interface PresenterMutableSet<ObjectType> : NSMutableSet<ObjectType>
@end;

__attribute__((swift_name("KotlinMutableDictionary")))
@interface PresenterMutableDictionary<KeyType, ObjectType> : NSMutableDictionary<KeyType, ObjectType>
@end;

@interface NSError (NSErrorPresenterKotlinException)
@property (readonly) id _Nullable kotlinException;
@end;

__attribute__((swift_name("KotlinNumber")))
@interface PresenterNumber : NSNumber
- (instancetype)initWithChar:(char)value __attribute__((unavailable));
- (instancetype)initWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
- (instancetype)initWithShort:(short)value __attribute__((unavailable));
- (instancetype)initWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
- (instancetype)initWithInt:(int)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
- (instancetype)initWithLong:(long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
- (instancetype)initWithLongLong:(long long)value __attribute__((unavailable));
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
- (instancetype)initWithFloat:(float)value __attribute__((unavailable));
- (instancetype)initWithDouble:(double)value __attribute__((unavailable));
- (instancetype)initWithBool:(BOOL)value __attribute__((unavailable));
- (instancetype)initWithInteger:(NSInteger)value __attribute__((unavailable));
- (instancetype)initWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
+ (instancetype)numberWithChar:(char)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedChar:(unsigned char)value __attribute__((unavailable));
+ (instancetype)numberWithShort:(short)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedShort:(unsigned short)value __attribute__((unavailable));
+ (instancetype)numberWithInt:(int)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInt:(unsigned int)value __attribute__((unavailable));
+ (instancetype)numberWithLong:(long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLong:(unsigned long)value __attribute__((unavailable));
+ (instancetype)numberWithLongLong:(long long)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value __attribute__((unavailable));
+ (instancetype)numberWithFloat:(float)value __attribute__((unavailable));
+ (instancetype)numberWithDouble:(double)value __attribute__((unavailable));
+ (instancetype)numberWithBool:(BOOL)value __attribute__((unavailable));
+ (instancetype)numberWithInteger:(NSInteger)value __attribute__((unavailable));
+ (instancetype)numberWithUnsignedInteger:(NSUInteger)value __attribute__((unavailable));
@end;

__attribute__((swift_name("KotlinByte")))
@interface PresenterByte : PresenterNumber
- (instancetype)initWithChar:(char)value;
+ (instancetype)numberWithChar:(char)value;
@end;

__attribute__((swift_name("KotlinUByte")))
@interface PresenterUByte : PresenterNumber
- (instancetype)initWithUnsignedChar:(unsigned char)value;
+ (instancetype)numberWithUnsignedChar:(unsigned char)value;
@end;

__attribute__((swift_name("KotlinShort")))
@interface PresenterShort : PresenterNumber
- (instancetype)initWithShort:(short)value;
+ (instancetype)numberWithShort:(short)value;
@end;

__attribute__((swift_name("KotlinUShort")))
@interface PresenterUShort : PresenterNumber
- (instancetype)initWithUnsignedShort:(unsigned short)value;
+ (instancetype)numberWithUnsignedShort:(unsigned short)value;
@end;

__attribute__((swift_name("KotlinInt")))
@interface PresenterInt : PresenterNumber
- (instancetype)initWithInt:(int)value;
+ (instancetype)numberWithInt:(int)value;
@end;

__attribute__((swift_name("KotlinUInt")))
@interface PresenterUInt : PresenterNumber
- (instancetype)initWithUnsignedInt:(unsigned int)value;
+ (instancetype)numberWithUnsignedInt:(unsigned int)value;
@end;

__attribute__((swift_name("KotlinLong")))
@interface PresenterLong : PresenterNumber
- (instancetype)initWithLongLong:(long long)value;
+ (instancetype)numberWithLongLong:(long long)value;
@end;

__attribute__((swift_name("KotlinULong")))
@interface PresenterULong : PresenterNumber
- (instancetype)initWithUnsignedLongLong:(unsigned long long)value;
+ (instancetype)numberWithUnsignedLongLong:(unsigned long long)value;
@end;

__attribute__((swift_name("KotlinFloat")))
@interface PresenterFloat : PresenterNumber
- (instancetype)initWithFloat:(float)value;
+ (instancetype)numberWithFloat:(float)value;
@end;

__attribute__((swift_name("KotlinDouble")))
@interface PresenterDouble : PresenterNumber
- (instancetype)initWithDouble:(double)value;
+ (instancetype)numberWithDouble:(double)value;
@end;

__attribute__((swift_name("KotlinBoolean")))
@interface PresenterBoolean : PresenterNumber
- (instancetype)initWithBool:(BOOL)value;
+ (instancetype)numberWithBool:(BOOL)value;
@end;

__attribute__((swift_name("IImageProvider")))
@protocol PresenterIImageProvider
@required
- (void)addListenerImgListener:(id<PresenterIImageProviderListener>)imgListener __attribute__((swift_name("addListener(imgListener:)")));
- (void)getUrl:(NSString *)url __attribute__((swift_name("get(url:)")));
- (void)removeListenerImgListener:(id<PresenterIImageProviderListener>)imgListener __attribute__((swift_name("removeListener(imgListener:)")));
@end;

__attribute__((swift_name("IImageProviderListener")))
@protocol PresenterIImageProviderListener
@required
- (void)onErrorUrl:(NSString *)url error:(PresenterKotlinException *)error __attribute__((swift_name("onError(url:error:)")));
- (void)onReceiveUrl:(NSString *)url imgBase64:(NSString *)imgBase64 __attribute__((swift_name("onReceive(url:imgBase64:)")));
@end;

__attribute__((swift_name("IProvider")))
@protocol PresenterIProvider
@required
- (void)addListenerListener:(id<PresenterIProviderListener>)listener __attribute__((swift_name("addListener(listener:)")));
- (void)getIds:(NSArray<PresenterInt *> *)ids __attribute__((swift_name("get(ids:)")));
- (void)removeListenerListener:(id<PresenterIProviderListener>)listener __attribute__((swift_name("removeListener(listener:)")));
@end;

__attribute__((swift_name("IProviderListener")))
@protocol PresenterIProviderListener
@required
- (void)onErrorIds:(NSArray<PresenterInt *> *)ids error:(PresenterKotlinException *)error __attribute__((swift_name("onError(ids:error:)")));
- (void)onReceiveIds:(NSArray<PresenterInt *> *)ids elements:(NSArray<PresenterModelObj *> *)elements __attribute__((swift_name("onReceive(ids:elements:)")));
@end;

__attribute__((swift_name("IGamePresenter")))
@protocol PresenterIGamePresenter
@required
- (void)setViewView:(id<PresenterIGameView>)view __attribute__((swift_name("setView(view:)")));
- (void)showGameId:(int32_t)id __attribute__((swift_name("showGame(id:)")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("GamePresenter")))
@interface PresenterGamePresenter : PresenterBase <PresenterIGamePresenter>
- (instancetype)initWithCharacterProvider:(id<PresenterIProvider>)characterProvider gameProvider:(id<PresenterIProvider>)gameProvider imageProvider:(id<PresenterIImageProvider>)imageProvider __attribute__((swift_name("init(characterProvider:gameProvider:imageProvider:)"))) __attribute__((objc_designated_initializer));
- (void)setViewView:(id<PresenterIGameView>)view __attribute__((swift_name("setView(view:)")));
- (void)showGameId:(int32_t)id __attribute__((swift_name("showGame(id:)")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((swift_name("IGameView")))
@protocol PresenterIGameView
@required
- (void)displayCharacters:(NSArray<PresenterModelCharacter *> *)characters __attribute__((swift_name("display(characters:)")));
- (void)displayGame:(PresenterModelGame *)game __attribute__((swift_name("display(game:)")));
- (void)errorError:(PresenterKotlinException *)error __attribute__((swift_name("error(error:)")));
@end;

__attribute__((swift_name("IHomePresenter")))
@protocol PresenterIHomePresenter
@required
- (void)setViewView_:(id<PresenterIHomeView>)view __attribute__((swift_name("setView(view_:)")));
- (void)showGames __attribute__((swift_name("showGames()")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("HomePresenter")))
@interface PresenterHomePresenter : PresenterBase <PresenterIHomePresenter>
- (instancetype)initWithGameProvider:(id<PresenterIProvider> _Nullable)gameProvider imageProvider:(id<PresenterIImageProvider> _Nullable)imageProvider __attribute__((swift_name("init(gameProvider:imageProvider:)"))) __attribute__((objc_designated_initializer));
- (void)setViewView_:(id<PresenterIHomeView>)view __attribute__((swift_name("setView(view_:)")));
- (void)showGames __attribute__((swift_name("showGames()")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((swift_name("IHomeView")))
@protocol PresenterIHomeView
@required
- (void)displayUrl:(NSString *)url imgBase64:(NSString *)imgBase64 __attribute__((swift_name("display(url:imgBase64:)")));
- (void)displayGames:(NSArray<PresenterModelGame *> *)games __attribute__((swift_name("display(games:)")));
- (void)errorError:(PresenterKotlinException *)error __attribute__((swift_name("error(error:)")));
@end;

__attribute__((swift_name("IMovePresenter")))
@protocol PresenterIMovePresenter
@required
@end;

__attribute__((swift_name("IMoveView")))
@protocol PresenterIMoveView
@required
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("MovePresenter")))
@interface PresenterMovePresenter : PresenterBase <PresenterIMovePresenter>
- (instancetype)initWithMoveProvider:(id<PresenterIProvider>)moveProvider charProvider:(id<PresenterIProvider>)charProvider gameProvider:(id<PresenterIProvider>)gameProvider imageProvider:(id<PresenterIImageProvider>)imageProvider __attribute__((swift_name("init(moveProvider:charProvider:gameProvider:imageProvider:)"))) __attribute__((objc_designated_initializer));
@end;

__attribute__((swift_name("ICharacterPresenter")))
@protocol PresenterICharacterPresenter
@required
- (void)getId:(int32_t)id __attribute__((swift_name("get(id:)")));
- (void)setViewView__:(id<PresenterICharacterView>)view __attribute__((swift_name("setView(view__:)")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("CharacterPresenter")))
@interface PresenterCharacterPresenter : PresenterBase <PresenterICharacterPresenter>
- (instancetype)initWithMoveProvider:(id<PresenterIProvider>)moveProvider imageProvider:(id<PresenterIImageProvider>)imageProvider __attribute__((swift_name("init(moveProvider:imageProvider:)"))) __attribute__((objc_designated_initializer));
- (void)getId:(int32_t)id __attribute__((swift_name("get(id:)")));
- (void)setViewView__:(id<PresenterICharacterView>)view __attribute__((swift_name("setView(view__:)")));
@end;

__attribute__((swift_name("ICharacterView")))
@protocol PresenterICharacterView
@required
- (void)displayMoves:(NSArray<PresenterModelMove *> *)moves __attribute__((swift_name("display(moves:)")));
- (void)displayCharacter:(PresenterModelCharacter *)character __attribute__((swift_name("display(character:)")));
- (void)errorError:(PresenterKotlinException *)error __attribute__((swift_name("error(error:)")));
@end;

__attribute__((swift_name("IRootPresenter")))
@protocol PresenterIRootPresenter
@required
- (void)setViewRootView:(id<PresenterIRootView>)rootView __attribute__((swift_name("setView(rootView:)")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((swift_name("IRootView")))
@protocol PresenterIRootView
@required
- (void)errorError:(PresenterKotlinException *)error __attribute__((swift_name("error(error:)")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("RootPresenter")))
@interface PresenterRootPresenter : PresenterBase <PresenterIRootPresenter>
- (instancetype)initWithGameProvider:(id<PresenterIProvider>)gameProvider __attribute__((swift_name("init(gameProvider:)"))) __attribute__((objc_designated_initializer));
- (void)setViewRootView:(id<PresenterIRootView>)rootView __attribute__((swift_name("setView(rootView:)")));
- (void)shutdown __attribute__((swift_name("shutdown()")));
@end;

__attribute__((swift_name("KotlinThrowable")))
@interface PresenterKotlinThrowable : PresenterBase
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(PresenterKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(PresenterKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
- (PresenterKotlinArray<NSString *> *)getStackTrace __attribute__((swift_name("getStackTrace()")));
- (void)printStackTrace __attribute__((swift_name("printStackTrace()")));
- (NSString *)description __attribute__((swift_name("description()")));
@property (readonly) PresenterKotlinThrowable * _Nullable cause __attribute__((swift_name("cause")));
@property (readonly) NSString * _Nullable message __attribute__((swift_name("message")));
@end;

__attribute__((swift_name("KotlinException")))
@interface PresenterKotlinException : PresenterKotlinThrowable
- (instancetype)init __attribute__((swift_name("init()"))) __attribute__((objc_designated_initializer));
+ (instancetype)new __attribute__((availability(swift, unavailable, message="use object initializers instead")));
- (instancetype)initWithMessage:(NSString * _Nullable)message __attribute__((swift_name("init(message:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithMessage:(NSString * _Nullable)message cause:(PresenterKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(message:cause:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithCause:(PresenterKotlinThrowable * _Nullable)cause __attribute__((swift_name("init(cause:)"))) __attribute__((objc_designated_initializer));
@end;

__attribute__((swift_name("ModelObj")))
@interface PresenterModelObj : PresenterBase
- (instancetype)initWithId:(int32_t)id __attribute__((swift_name("init(id:)"))) __attribute__((objc_designated_initializer));
@property (readonly) int32_t id __attribute__((swift_name("id")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ModelCharacter")))
@interface PresenterModelCharacter : PresenterModelObj
- (instancetype)initWithId:(int32_t)id name:(NSString *)name health:(int32_t)health moveIds:(NSArray<PresenterInt *> *)moveIds iconUrl:(NSString *)iconUrl __attribute__((swift_name("init(id:name:health:moveIds:iconUrl:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithId:(int32_t)id __attribute__((swift_name("init(id:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) int32_t health __attribute__((swift_name("health")));
@property (readonly) NSString *iconUrl __attribute__((swift_name("iconUrl")));
@property (readonly) NSArray<PresenterInt *> *moveIds __attribute__((swift_name("moveIds")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ModelGame")))
@interface PresenterModelGame : PresenterModelObj
- (instancetype)initWithId:(int32_t)id name:(NSString *)name characterIds:(NSArray<PresenterInt *> *)characterIds iconUrl:(NSString *)iconUrl __attribute__((swift_name("init(id:name:characterIds:iconUrl:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithId:(int32_t)id __attribute__((swift_name("init(id:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSArray<PresenterInt *> *characterIds __attribute__((swift_name("characterIds")));
@property (readonly) NSString *iconUrl __attribute__((swift_name("iconUrl")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("ModelMove")))
@interface PresenterModelMove : PresenterModelObj
- (instancetype)initWithId:(int32_t)id name:(NSString *)name startup:(NSString *)startup active:(NSString *)active recovery:(NSString *)recovery hitAdv:(NSString *)hitAdv blockAdv:(NSString *)blockAdv notes:(NSString *)notes __attribute__((swift_name("init(id:name:startup:active:recovery:hitAdv:blockAdv:notes:)"))) __attribute__((objc_designated_initializer));
- (instancetype)initWithId:(int32_t)id __attribute__((swift_name("init(id:)"))) __attribute__((objc_designated_initializer)) __attribute__((unavailable));
@property (readonly) NSString *active __attribute__((swift_name("active")));
@property (readonly) NSString *blockAdv __attribute__((swift_name("blockAdv")));
@property (readonly) NSString *hitAdv __attribute__((swift_name("hitAdv")));
@property (readonly) NSString *name __attribute__((swift_name("name")));
@property (readonly) NSString *notes __attribute__((swift_name("notes")));
@property (readonly) NSString *recovery __attribute__((swift_name("recovery")));
@property (readonly) NSString *startup __attribute__((swift_name("startup")));
@end;

__attribute__((objc_subclassing_restricted))
__attribute__((swift_name("KotlinArray")))
@interface PresenterKotlinArray<T> : PresenterBase
+ (instancetype)arrayWithSize:(int32_t)size init:(T _Nullable (^)(PresenterInt *))init __attribute__((swift_name("init(size:init:)")));
+ (instancetype)alloc __attribute__((unavailable));
+ (instancetype)allocWithZone:(struct _NSZone *)zone __attribute__((unavailable));
- (T _Nullable)getIndex:(int32_t)index __attribute__((swift_name("get(index:)")));
- (id<PresenterKotlinIterator>)iterator __attribute__((swift_name("iterator()")));
- (void)setIndex:(int32_t)index value:(T _Nullable)value __attribute__((swift_name("set(index:value:)")));
@property (readonly) int32_t size __attribute__((swift_name("size")));
@end;

__attribute__((swift_name("KotlinIterator")))
@protocol PresenterKotlinIterator
@required
- (BOOL)hasNext __attribute__((swift_name("hasNext()")));
- (id _Nullable)next __attribute__((swift_name("next()")));
@end;

#pragma clang diagnostic pop
NS_ASSUME_NONNULL_END
