#!../../bin/linux-x86_64/scanstatus

< envPaths

epicsEnvSet("ENGINEER",  "##TODO##")
epicsEnvSet("LOCATION",  "74x RG- ##TODO##")

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
## TODO: set the address list properly according to your beamline:
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.x.0.255")

## TODO: set the system prefix according to your beamline:
epicsEnvSet("SYS", "XF:xxIDy-CT")
# note: IOCNAME will be set by procserv
epicsEnvSet("IOC_PREFIX", "$(SYS){IOC:$(IOCNAME)}")

## Register all support components
dbLoadDatabase("../../dbd/scanstatus.dbd",0,0)
scanstatus_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("$(EPICS_BASE)/db/iocAdminSoft.db","IOC=$(IOC_PREFIX)")
dbLoadRecords("$(EPICS_BASE)/db/save_restoreStatus.db", "P=$(IOC_PREFIX)")

dbLoadRecords("$(TOP)/db/scan_status.db", "SYS=$(SYS),DEV={Status}")

cd ${TOP}/
save_restoreSet_status_prefix("$(IOC_PREFIX)")

set_savefile_path("${TOP}/as/save","")
set_requestfile_path("$(EPICS_BASE)/as/req")
set_requestfile_path("${TOP}/as/req")

system("install -m 777 -d ${TOP}/as/save")
system("install -m 777 -d ${TOP}/as/req")

set_pass0_restoreFile("ioc_settings.sav")

iocInit()

makeAutosaveFileFromDbInfo("${TOP}/as/req/ioc_settings.req", "autosaveFields_pass0")

create_monitor_set("ioc_settings.req", 10, "P=$(IOC_PREFIX)")

# caPutLogInit("ioclog.cs.nsls2.local:7004", 1)

cd ${TOP}
## ##TODO##: once you've verified that the settings are correct, uncomment the following lines
##       so the PVs will be indexed by the channel archiver
dbl > ./records.dbl
# system "cp ./records.dbl /cf-update/$HOSTNAME.$IOCNAME.dbl"
