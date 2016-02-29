TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = scanstatus
# scanstatus.dbd will be created and installed
DBD += scanstatus.dbd

# scanstatus.dbd will be made up from these files:
scanstatus_DBD += base.dbd

# Include dbd files from all support applications:
scanstatus_DBD += seqRecord.dbd mbboRecord.dbd
scanstatus_DBD += system.dbd
scanstatus_DBD += asSupport.dbd
scanstatus_DBD += calcSupport.dbd
scanstatus_DBD += devIocStats.dbd
scanstatus_DBD += caPutLog.dbd

# Add all the support libraries needed by this IOC
scanstatus_LIBS += seq
scanstatus_LIBS += autosave
scanstatus_LIBS += calc

scanstatus_LIBS += devIocStats
scanstatus_LIBS += caPutLog

# scanstatus_registerRecordDeviceDriver.cpp derives from scanstatus.dbd
scanstatus_SRCS += scanstatus_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
scanstatus_SRCS_DEFAULT += scanstatusMain.cpp
scanstatus_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#scanstatus_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
scanstatus_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

