//沙盒类   便于快速得到地址

#import <Foundation/Foundation.h>

@interface LitterL_SandBox : NSObject


// 获取沙盒Document的文件目录
+ (NSString *)L_getDocumentDirectory;

// 获取沙盒Library的文件目录
+ (NSString *)L_getLibraryDirectory;

// 获取沙盒Library/Caches的文件目录
+ (NSString *)L_getCachesDirectory;

// 获取沙盒Preference的文件目录
+ (NSString *)L_getPreferencePanesDirectory;

// 获取沙盒tmp的文件目录
+ (NSString *)L_getTmpDirectory;







// 根据路径返回目录或文件的大小
+ (double)L_sizeWithFilePath:(NSString *)path;

// 得到指定目录下的所有文件
+ (NSArray *)L_getAllFileNames:(NSString *)dirPath;

// 删除指定目录或文件
+ (BOOL)L_clearCachesWithFilePath:(NSString *)path;

// 清空指定目录下文件
+ (BOOL)L_clearCachesFromDirectoryPath:(NSString *)dirPath;

@end
