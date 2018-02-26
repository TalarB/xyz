//
//  SensorStats.hpp
//  AcceleratorAssignment
//
//  Created by Talar Boyadjian on 12/31/17.
//  Copyright © 2017 Talar Boyadjian. All rights reserved.
//

#ifndef SensorStats_hpp
#define SensorStats_hpp

#include <stdio.h>
#include <vector>
using namespace std;

class SensorStats_Imp {
private:
  std::vector<float> xStats;
  std::vector<float> yStats;
  std::vector<float> zStats;
  //to keep the data of the last 5 seconds
  std::vector<float> xPartialStats;
  std::vector<float> yPartialStats;
  std::vector<float> zPartialStats;
  float getMean(vector<float> stats);
  float getMedian(vector<float> stats);
  float getStandardDeviation(vector<float> stats);
  int getZeroCrossings(vector<float> stats);
  
public:
  int statsCount = 0;
  void updateXYZ(float x, float, float);
  int measurementsCount();
  float meanX();
  float meanY();
  float meanZ();
  
  float minX();
  float minY();
  float minZ();
  
  float maxX();
  float maxY();
  float maxZ();
  
  float medianX();
  float medianY();
  float medianZ();
  
  float standardDeviationX();
  float standardDeviationY();
  float standardDeviationZ();
  
  float partialMeanX();
  float partialMeanY();
  float partialMeanZ();

  float partialMinX();
  float partialMinY();
  float partialMinZ();
  
  float partialMaxX();
  float partialMaxY();
  float partialMaxZ();
  
  float partialMedianX();
  float partialMedianY();
  float partialMedianZ();
  
  float partialStandardDeviationX();
  float partialStandardDeviationY();
  float partialStandardDeviationZ();
  
  int partialMeasurementsCount();
  
  int partialZeroCrossingsX();
  int partialZeroCrossingsY();
  int partialZeroCrossingsZ();
  
  
};

#endif /* SensorStats_hpp */
