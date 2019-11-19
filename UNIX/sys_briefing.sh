#!/bin/sh 

set -e 

TotalPMem=`free -m | grep "Mem:" | awk '{print $2}'`
UsingPMem=`free -m | grep "Mem:" | awk '{print $3}'`
TotalVMem=`free -m | grep "Swap:" | awk '{print $2}'`
UsingVMem=`free -m | grep "Swap:" | awk '{print $3}'`
TotalHDD=`df -m | grep xvda1 | awk '{print $2}'`
UsingHDD=`df -m | grep xvda1 | awk '{print $3}'`
UsingHDDPer=`df -m | grep xvda1 | awk '{print $5}'`

echo "-------------------------------------------------------------------------------" 
echo "* Uptime          :`uptime`" 
echo "* Memory Usage    : ${UsingPMem}M / ${TotalPMem}M" 
echo "* Swap Usage      : ${UsingVMem}M / ${TotalVMem}M" 
echo "* Disk Usage      : ${UsingHDD}M / ${TotalHDD}M (${UsingHDDPer})" 
echo "* TIME_WAIT Count : `netstat -nat | grep TIME_WAIT | wc -l`" 
echo "-------------------------------------------------------------------------------"
