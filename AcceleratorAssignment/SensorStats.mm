//
//  SensorStats.m
//  AcceleratorAssignment
//
//  Created by Talar Boyadjian on 12/31/17.
//  Copyright © 2017 Talar Boyadjian. All rights reserved.
//

#import "SensorStats.h"

#include "SensorStats_Imp.hpp"

@implementation SensorStats {
  SensorStats_Imp* imp;
}

-(instancetype)init {
  self = [super init];
  imp = new SensorStats_Imp();
  
  return self;
}

-(void)updateSensor:(float)x withY:(float)y withZ:(float)z {
  // write C++ here
  imp->updateXYZ(x, y, z);
}

-(int)measurementsCount {
  return imp->measurementsCount();
}

-(float)meanX {
  return imp->meanX();
}

-(float)meanY {
  return imp->meanY();
}

-(float)meanZ {
  return imp->meanZ();
}

-(float)minX {
  return imp->minX();
}

-(float)minY {
  return imp->minY();
}

-(float)minZ {
  return imp->minZ();
}

-(float)maxX {
  return imp->maxX();
}

-(float)maxY {
  return imp->maxY();
}

-(float)maxZ {
  return imp->maxZ();
}

-(float)medianX {
  return imp->medianX();
}

-(float)medianY {
  return imp->medianY();
}

-(float)medianZ {
  return imp->medianZ();
}

-(float)standardDeviationX {
  return imp->standardDeviationX();
}

-(float)standardDeviationY {
  return imp->standardDeviationY();
}

-(float)standardDeviationZ {
  return imp->standardDeviationZ();
}



-(int)partialMeasurementsCount {
  return imp->partialMeasurementsCount();
}

-(float)partialMeanX {
  return imp->partialMeanX();
}

-(float)partialMeanY {
  return imp->partialMeanY();
}

-(float)partialMeanZ {
  return imp->partialMeanZ();
}

-(float)partialMinX {
  return imp->partialMinX();
}

-(float)partialMinY {
  return imp->partialMinY();
}

-(float)partialMinZ {
  return imp->partialMinZ();
}

-(float)partialMaxX {
  return imp->partialMaxX();
}

-(float)partialMaxY {
  return imp->partialMaxY();
}

-(float)partialMaxZ {
  return imp->partialMaxZ();
}

-(float)partialMedianX {
  return imp->partialMedianX();
}

-(float)partialMedianY {
  return imp->partialMedianY();
}

-(float)partialMedianZ{
  return imp->partialMedianZ();
}

-(float)partialStandardDeviationX {
  return imp->partialStandardDeviationX();
}

-(float)partialStandardDeviationY {
  return imp->partialStandardDeviationY();
}

-(float)partialStandardDeviationZ {
  return imp->partialStandardDeviationZ();
}

-(int)partialZeroCrossingsX {
  return imp->partialZeroCrossingsX();
}

-(int)partialZeroCrossingsY {
  return imp->partialZeroCrossingsY();
}

-(int)partialZeroCrossingsZ {
  return imp->partialZeroCrossingsZ();
}

@end

