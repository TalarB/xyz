//
//  SensorStats.h
//  AcceleratorAssignment
//
//  Created by Talar Boyadjian on 12/31/17.
//  Copyright © 2017 Talar Boyadjian. All rights reserved.
//

#ifndef SensorStats_h
#define SensorStats_h

#import <Foundation/Foundation.h>

@interface SensorStats : NSObject

- (void)updateSensor:(float)x withY:(float)y withZ:(float)z;
- (int)measurementsCount;
- (float)meanX;
- (float)meanY;
- (float)meanZ;
- (float)minX;
- (float)minY;
- (float)minZ;
- (float)maxX;
- (float)maxY;
- (float)maxZ;
- (float)medianX;
- (float)medianY;
- (float)medianZ;
- (float)standardDeviationX;
- (float)standardDeviationY;
- (float)standardDeviationZ;

- (int)partialMeasurementsCount;
- (float)partialMeanX;
- (float)partialMeanY;
- (float)partialMeanZ;
- (float)partialMinX;
- (float)partialMinY;
- (float)partialMinZ;
- (float)partialMaxX;
- (float)partialMaxY;
- (float)partialMaxZ;
- (float)partialMedianX;
- (float)partialMedianY;
- (float)partialMedianZ;
- (float)partialStandardDeviationX;
- (float)partialStandardDeviationY;
- (float)partialStandardDeviationZ;
- (int)partialZeroCrossingsX;
- (int)partialZeroCrossingsY;
- (int)partialZeroCrossingsZ;
















@end


#endif /* SensorStats_h */
