#!/bin/tcsh
source scripts/colors.sh

set IP=apb_event_unit

echo "${Green}--> Compiling APB Event Unit... ${NC}"

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif


echo "${Green}library: apb_event_unit_lib ${NC}"
rm -rf ${MSIM_LIBS_PATH}/${IP}_lib

vlib ${MSIM_LIBS_PATH}/${IP}_lib
vmap ${IP}_lib ${MSIM_LIBS_PATH}/${IP}_lib

echo "${Green}Compiling component:   ${Brown} axi_gpio ${NC}"
echo "${Red}"

vlog -work ${IP}_lib -quiet +incdir+${IPS_PATH}/apb_peripherals/${IP}/include -sv ${IPS_PATH}/apb_peripherals/apb_event_unit/apb_event_unit.sv    || exit 1

echo "${Cyan}--> APB EVENT UNIT compilation complete! ${NC}"

