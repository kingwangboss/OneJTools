

#import <UIKit/UIKit.h>
#import "NSBundle+DBLibrary.h"


/**
 文件类型枚举

 - DBAttachmentMediaTypeImage: 图片文件
 - DBAttachmentMediaTypeVideo: 视频文件
 - DBAttachmentMediaTypeOther: 其他文档
 */
typedef NS_OPTIONS(NSUInteger, DBAttachmentMediaType) {
    DBAttachmentMediaTypeImage = (1 << 0),
    DBAttachmentMediaTypeVideo = (1 << 1),
    DBAttachmentMediaTypeOther = (1 << 2),
};
// 选择全部文档类型
UIKIT_EXTERN const DBAttachmentMediaType DBAttachmentMediaTypeMaskAll;

NS_ASSUME_NONNULL_BEGIN

@class DBAttachment;

typedef void (^FinishPickingBlock)(NSArray<DBAttachment *> * attachmentArray);
typedef void (^FinishImagePickingBlock)(NSArray<UIImage *> * imageArray);
typedef void (^FinishVideoPickingBlock)(NSArray* resourceArray);
typedef void (^CancelBlock)();

@interface DBAttachmentPickerController : NSObject

/*!
 @brief 用于在iPad上运行应用程序时，提供正确计算位置弹出视图的机会。 您可以指定用户触摸的UIButton，UITableViewCell等实例。
 @attention 此参数必须只包含UIView子类实例或nil
 */
@property (weak, nonatomic) UIView *senderView;


/**
 * 用于确定可选择的附件类型
 * 默认选择 DBAttachmentMediaTypeMaskAll
 */
@property (assign, nonatomic) DBAttachmentMediaType mediaType;


/**
 * 用于确定从摄像机捕获的视频的质量
 * 默认选择中等类型 UIImagePickerControllerQualityTypeMedium
 */
@property (assign, nonatomic) UIImagePickerControllerQualityType capturedVideoQulity;


/**
 * 用于添加其他应用程序按钮
 * 要正常运行此选项，必须在项目设置中选择的iCloud文档的能力
 * 默认选择 NO
 */
@property (assign, nonatomic) BOOL allowsSelectionFromOtherApps;


/**
 * 是否允许多选
 * 默认选择 NO
 */
@property (assign, nonatomic) BOOL allowsMultipleSelection;


/**
 创建并返回附件选择器控制器

 @param finishPickingBlock 当用户选择附件时回调
 @param cancelBlock 当用户选择取消按钮时,将执行该块
 @return 附件选择器控制器实例
 */
+ (instancetype)attachmentPickerControllerFinishPickingBlock:(FinishPickingBlock)finishPickingBlock
                                                 cancelBlock:(_Nullable CancelBlock)cancelBlock;


/**
 创建并返回具有常量介质类型的附件选择器控制器（image）

 @param finishPickingBlock 当用户选择图像时
 @param cancelBlock 当用户选择取消按钮时,将执行该块
 @return 实例附件选择器控制器
 */
+ (instancetype)imagePickerControllerFinishPickingBlock:(FinishImagePickingBlock)finishPickingBlock
                                            cancelBlock:(_Nullable CancelBlock)cancelBlock;


+ (instancetype)videoPickerControllerFinishPickingBlock:(FinishVideoPickingBlock)finishPickingBlock
                                            cancelBlock:(_Nullable CancelBlock)cancelBlock;

/**
 当前附件选择器控制器指定UIViewController

 @param initialViewController 呈现附件选择器控制器
 */
- (void)presentOnViewController:(UIViewController *)initialViewController;

@end

NS_ASSUME_NONNULL_END
