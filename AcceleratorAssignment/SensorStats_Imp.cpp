//
//  SensorStats.cpp
//  AcceleratorAssignment
//
//  Created by Talar Boyadjian on 12/31/17.
//  Copyright © 2017 Talar Boyadjian. All rights reserved.
//

#include "SensorStats_Imp.hpp"
#include <vector>
#include <algorithm>
#include <cmath>
#include <iostream>
using namespace std;

void SensorStats_Imp::updateXYZ(float x, float y, float z) {
  xStats.push_back(x);
  yStats.push_back(y);
  zStats.push_back(z);
  statsCount++;
  if (statsCount < 101) {
    xPartialStats = xStats;
    yPartialStats = yStats;
    zPartialStats = zStats;
  } else {
    xPartialStats.clear();
    yPartialStats.clear();
    zPartialStats.clear();

    int size = xStats.size();
    xPartialStats = vector<float>(xStats.end() - std::min(100, size -1), xStats.end());
    yPartialStats = vector<float>(yStats.end() - std::min(100, size -1), yStats.end());
    zPartialStats = vector<float>(yStats.end() - std::min(100, size -1), zStats.end());
  }
}

//Private functions
float SensorStats_Imp::getMean(vector<float> stats) {
  float sum = 0;
  for(std::size_t i = 0; i < stats.size(); i++)
    sum += stats.at(i);
  return sum/stats.size();
}

float SensorStats_Imp::getStandardDeviation(vector<float> stats) {
  double standardDeviation = 0;
  int i;
  double arrayMean = getMean(stats);
  for (i = 0; i < stats.size(); ++i) {
    standardDeviation += pow(stats[i] - arrayMean, 2);
  }
  return sqrt(standardDeviation / stats.size());
}

float SensorStats_Imp::getMedian(vector<float> stats) {
  std::sort (stats.begin(), stats.end());
  return stats[stats.size()/2];
}

int SensorStats_Imp::getZeroCrossings(vector<float> stats) {
  int count = 0;
  if (stats.size() == 1) {
    return count;
  } else if (stats.size() == 2) {
    if (stats[0]*stats[1] < 1) {
      count = 1;
    }
  } else {
    int i;
    for (i = 1; i < stats.size() - 2; ++i) {
      if (stats[i]*stats[i+1] < 0) {
        count ++;
      }
    }
  }
  return count;
}

//All data functions
int SensorStats_Imp::measurementsCount() {
  return statsCount;
}

float SensorStats_Imp::meanX() {
  return getMean(xStats);
}

float SensorStats_Imp::meanY() {
  return getMean(yStats);
}

float SensorStats_Imp::meanZ() {
  return getMean(zStats);
}


float SensorStats_Imp::minX() {
  return *std::min_element(xStats.begin(), xStats.end());
}

float SensorStats_Imp::minY() {
  return *std::min_element(yStats.begin(), yStats.end());
}

float SensorStats_Imp::minZ() {
  return *std::min_element(zStats.begin(), zStats.end());
}

float SensorStats_Imp::maxX() {
  return *std::max_element(xStats.begin(), xStats.end());
}

float SensorStats_Imp::maxY() {
  return *std::max_element(yStats.begin(), yStats.end());
}

float SensorStats_Imp::maxZ() {
  return *std::max_element(zStats.begin(), zStats.end());
}

float SensorStats_Imp::medianX() {
  return getMedian(xStats);
}

float SensorStats_Imp::medianY() {
  return getMedian(yStats);
}

float SensorStats_Imp::medianZ() {
  return getMedian(zStats);
}

float SensorStats_Imp::standardDeviationX() {
  return getStandardDeviation(xStats);
}

float SensorStats_Imp::standardDeviationY() {
  return getStandardDeviation(yStats);
}

float SensorStats_Imp::standardDeviationZ() {
  return getStandardDeviation(zStats);
}


//Partial data functions
int SensorStats_Imp::partialMeasurementsCount() {
  return xPartialStats.size();
}

float SensorStats_Imp::partialMeanX() {
  return getMean(xPartialStats);
}

float SensorStats_Imp::partialMeanY() {
  return getMean(yPartialStats);
}

float SensorStats_Imp::partialMeanZ() {
  return getMean(zPartialStats);
}

float SensorStats_Imp::partialMinX() {
  return *std::min_element(xPartialStats.begin(), xPartialStats.end());
}

float SensorStats_Imp::partialMinY() {
  return *std::min_element(yPartialStats.begin(), yPartialStats.end());
}

float SensorStats_Imp::partialMinZ() {
  return *std::min_element(zPartialStats.begin(), zPartialStats.end());
}

float SensorStats_Imp::partialMaxX() {
  return *std::max_element(xPartialStats.begin(), xPartialStats.end());
}

float SensorStats_Imp::partialMaxY() {
  return *std::max_element(yPartialStats.begin(), yPartialStats.end());
}

float SensorStats_Imp::partialMaxZ() {
  return *std::max_element(zPartialStats.begin(), zPartialStats.end());
}

float SensorStats_Imp::partialMedianX() {
  return getMedian(xPartialStats);
}

float SensorStats_Imp::partialMedianY() {
  return getMedian(yPartialStats);
}

float SensorStats_Imp::partialMedianZ() {
  return getMedian(zPartialStats);
}

float SensorStats_Imp::partialStandardDeviationX() {
  return getStandardDeviation(xPartialStats);
}

float SensorStats_Imp::partialStandardDeviationY() {
  return getStandardDeviation(yPartialStats);
}

float SensorStats_Imp::partialStandardDeviationZ() {
  return getStandardDeviation(zPartialStats);
}

int SensorStats_Imp::partialZeroCrossingsX() {
  return getZeroCrossings(xPartialStats);
}

int SensorStats_Imp::partialZeroCrossingsY() {
  return getZeroCrossings(yPartialStats);
}

int SensorStats_Imp::partialZeroCrossingsZ() {
  return getZeroCrossings(zPartialStats);
}




