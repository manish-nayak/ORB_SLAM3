#!/bin/bash
cd ..
currentDir=$(pwd)
runType=Monocular
datasetType=MH_01_easy
timestampType=MH01

# pathDatasetEuroc='/EuRoC' #Example, it is necesary to change it by the dataset path
pathDatasetEuroc='/home/qygxamu/brt/ORB_SLAM3/data'

if  [ -d "$pathDatasetEuroc" ];then
  echo  ""
else
  echo  "The folder does not exist ${pathDatasetEuroc} "
  exit 1
fi

if  [ -f "$currentDir/Vocabulary/ORBvoc.txt" ];then
  echo  ""
else
  echo  "The file does not exist $currentDir/Vocabulary/ORBvoc.txt "
  exit 1
fi
if  [ -f "$currentDir/Examples/$runType/EuRoC.yaml" ];then
  echo  ""
else
  echo  "The file does not exist $currentDir/Examples/$runType/EuRoC.yaml "
  exit 1
fi
if  [ -d $pathDatasetEuroc/$datasetType ];then
  echo  ""
else
  echo  "The folder does not exist $pathDatasetEuroc/$datasetType "
  exit 1
fi
if  [ -f "$currentDir/Examples/$runType/EuRoC_TimeStamps/$timestampType.txt" ];then
  echo  ""
else
  echo  "The file does not exist $currentDir/Examples/$runType/EuRoC_TimeStamps/$timestampType.txt "
  exit 1
fi
if  [ -d "logs" ];then
  echo  ""
else
  echo  "logs - The folder does not exist. Create"
  mkdir logs
fi

#------------------------------------
# Monocular Examples
echo "Launching $timestampType with $runType sensor"
gdb --args ./Examples/$runType/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/$runType/EuRoC.yaml $pathDatasetEuroc/$datasetType ./Examples/$runType/EuRoC_TimeStamps/$timestampType.txt "$datasetType_$runType"
# ./Examples/$runType/mono_euroc ./Vocabulary/ORBvoc.txt ./Examples/$runType/EuRoC.yaml $pathDatasetEuroc/$datasetType ./Examples/$runType/EuRoC_TimeStamps/$timestampType.txt "$datasetType_$runType"