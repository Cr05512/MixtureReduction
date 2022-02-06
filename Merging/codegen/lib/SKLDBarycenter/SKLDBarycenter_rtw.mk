###########################################################################
## Makefile generated for component 'SKLDBarycenter'. 
## 
## Makefile     : SKLDBarycenter_rtw.mk
## Generated on : Mon Jan 31 14:37:00 2022
## Final product: ./SKLDBarycenter.a
## Product type : static-library
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# MODELLIB                Static library target

PRODUCT_NAME              = SKLDBarycenter
MAKEFILE                  = SKLDBarycenter_rtw.mk
MATLAB_ROOT               = /home/cr055/MATLAB
MATLAB_BIN                = /home/cr055/MATLAB/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/glnxa64
START_DIR                 = /home/cr055/MATLAB\ Workspace/MixtureReduction/Merging/codegen/lib/SKLDBarycenter
TGT_FCN_LIB               = ISO_C
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 
RELATIVE_PATH_TO_ANCHOR   = .
C_STANDARD_OPTS           = -fwrapv
CPP_STANDARD_OPTS         = -fwrapv
MODELLIB                  = SKLDBarycenter.a

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU gcc/g++ | gmake (64-bit Linux)
# Supported Version(s):    
# ToolchainInfo Version:   2021a
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# C_STANDARD_OPTS
# CPP_STANDARD_OPTS

#-----------
# MACROS
#-----------

WARN_FLAGS         = -Wall -W -Wwrite-strings -Winline -Wstrict-prototypes -Wnested-externs -Wpointer-arith -Wcast-align
WARN_FLAGS_MAX     = $(WARN_FLAGS) -Wcast-qual -Wshadow
CPP_WARN_FLAGS     = -Wall -W -Wwrite-strings -Winline -Wpointer-arith -Wcast-align
CPP_WARN_FLAGS_MAX = $(CPP_WARN_FLAGS) -Wcast-qual -Wshadow

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = 

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# C Compiler: GNU C Compiler
CC = gcc

# Linker: GNU Linker
LD = g++

# C++ Compiler: GNU C++ Compiler
CPP = g++

# C++ Linker: GNU C++ Linker
CPP_LD = g++

# Archiver: GNU Archiver
AR = ar

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%/bin/glnxa64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @rm -f
ECHO                = @echo
MV                  = @mv
RUN                 =

#--------------------------------------
# "Faster Runs" Build Configuration
#--------------------------------------

ARFLAGS              = ruvs
CFLAGS               = -c $(C_STANDARD_OPTS) -fPIC \
                       -O3 -fno-loop-optimize -fno-aggressive-loop-optimizations
CPPFLAGS             = -c $(CPP_STANDARD_OPTS) -fPIC \
                       -O3 -fno-loop-optimize -fno-aggressive-loop-optimizations
CPP_LDFLAGS          =
CPP_SHAREDLIB_LDFLAGS  = -shared -Wl,--no-undefined
DOWNLOAD_FLAGS       =
EXECUTE_FLAGS        =
LDFLAGS              =
MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =
MAKE_FLAGS           = -f $(MAKEFILE)
SHAREDLIB_LDFLAGS    = -shared -Wl,--no-undefined



###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = ./SKLDBarycenter.a
PRODUCT_TYPE = "static-library"
BUILD_TYPE = "Static Library"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = -I$(START_DIR) -I/home/cr055/MATLAB\ Workspace/MixtureReduction/Merging -I$(MATLAB_ROOT)/extern/include

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_CUSTOM = 
DEFINES_STANDARD = -DMODEL=SKLDBarycenter

DEFINES = $(DEFINES_CUSTOM) $(DEFINES_STANDARD)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(START_DIR)/SKLDBarycenter_data.c $(START_DIR)/rt_nonfinite.c $(START_DIR)/rtGetNaN.c $(START_DIR)/rtGetInf.c $(START_DIR)/SKLDBarycenter_initialize.c $(START_DIR)/SKLDBarycenter_terminate.c $(START_DIR)/SKLDBarycenter.c $(START_DIR)/sum.c $(START_DIR)/mrdivide_helper.c $(START_DIR)/qrsolve.c $(START_DIR)/xnrm2.c $(START_DIR)/sqrtm.c $(START_DIR)/schur.c $(START_DIR)/mtimes.c $(START_DIR)/recip.c $(START_DIR)/xdlapy3.c $(START_DIR)/xzlarfg.c $(START_DIR)/xgerc.c $(START_DIR)/xzlarf.c $(START_DIR)/xdhseqr.c $(START_DIR)/xdlanv2.c $(START_DIR)/sqrt.c $(START_DIR)/xzhseqr.c $(START_DIR)/SKLDBarycenter_emxutil.c $(START_DIR)/SKLDBarycenter_emxAPI.c $(START_DIR)/SKLDBarycenter_rtwutil.c

ALL_SRCS = $(SRCS)

###########################################################################
## OBJECTS
###########################################################################

OBJS = SKLDBarycenter_data.o rt_nonfinite.o rtGetNaN.o rtGetInf.o SKLDBarycenter_initialize.o SKLDBarycenter_terminate.o SKLDBarycenter.o sum.o mrdivide_helper.o qrsolve.o xnrm2.o sqrtm.o schur.o mtimes.o recip.o xdlapy3.o xzlarfg.o xgerc.o xzlarf.o xdhseqr.o xdlanv2.o sqrt.o xzhseqr.o SKLDBarycenter_emxutil.o SKLDBarycenter_emxAPI.o SKLDBarycenter_rtwutil.o

ALL_OBJS = $(OBJS)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = 

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS =  -lm

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CFLAGS += $(CFLAGS_BASIC)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES)

CPPFLAGS += $(CPPFLAGS_BASIC)

###########################################################################
## INLINED COMMANDS
###########################################################################

###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build clean info prebuild download execute


all : build
	@echo "### Successfully generated all binary outputs."


build : prebuild $(PRODUCT)


prebuild : 


download : $(PRODUCT)


execute : download


###########################################################################
## FINAL TARGET
###########################################################################

#---------------------------------
# Create a static library         
#---------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS)
	@echo "### Creating static library "$(PRODUCT)" ..."
	$(AR) $(ARFLAGS)  $(PRODUCT) $(OBJS)
	@echo "### Created: $(PRODUCT)"


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.o : /home/cr055/MATLAB\ Workspace/MixtureReduction/Merging/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.o : /home/cr055/MATLAB\ Workspace/MixtureReduction/Merging/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


SKLDBarycenter_data.o : $(START_DIR)/SKLDBarycenter_data.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rt_nonfinite.o : $(START_DIR)/rt_nonfinite.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetNaN.o : $(START_DIR)/rtGetNaN.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtGetInf.o : $(START_DIR)/rtGetInf.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter_initialize.o : $(START_DIR)/SKLDBarycenter_initialize.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter_terminate.o : $(START_DIR)/SKLDBarycenter_terminate.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter.o : $(START_DIR)/SKLDBarycenter.c
	$(CC) $(CFLAGS) -o "$@" "$<"


sum.o : $(START_DIR)/sum.c
	$(CC) $(CFLAGS) -o "$@" "$<"


mrdivide_helper.o : $(START_DIR)/mrdivide_helper.c
	$(CC) $(CFLAGS) -o "$@" "$<"


qrsolve.o : $(START_DIR)/qrsolve.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xnrm2.o : $(START_DIR)/xnrm2.c
	$(CC) $(CFLAGS) -o "$@" "$<"


sqrtm.o : $(START_DIR)/sqrtm.c
	$(CC) $(CFLAGS) -o "$@" "$<"


schur.o : $(START_DIR)/schur.c
	$(CC) $(CFLAGS) -o "$@" "$<"


mtimes.o : $(START_DIR)/mtimes.c
	$(CC) $(CFLAGS) -o "$@" "$<"


recip.o : $(START_DIR)/recip.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xdlapy3.o : $(START_DIR)/xdlapy3.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xzlarfg.o : $(START_DIR)/xzlarfg.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xgerc.o : $(START_DIR)/xgerc.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xzlarf.o : $(START_DIR)/xzlarf.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xdhseqr.o : $(START_DIR)/xdhseqr.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xdlanv2.o : $(START_DIR)/xdlanv2.c
	$(CC) $(CFLAGS) -o "$@" "$<"


sqrt.o : $(START_DIR)/sqrt.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xzhseqr.o : $(START_DIR)/xzhseqr.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter_emxutil.o : $(START_DIR)/SKLDBarycenter_emxutil.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter_emxAPI.o : $(START_DIR)/SKLDBarycenter_emxAPI.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SKLDBarycenter_rtwutil.o : $(START_DIR)/SKLDBarycenter_rtwutil.c
	$(CC) $(CFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo "### PRODUCT = $(PRODUCT)"
	@echo "### PRODUCT_TYPE = $(PRODUCT_TYPE)"
	@echo "### BUILD_TYPE = $(BUILD_TYPE)"
	@echo "### INCLUDES = $(INCLUDES)"
	@echo "### DEFINES = $(DEFINES)"
	@echo "### ALL_SRCS = $(ALL_SRCS)"
	@echo "### ALL_OBJS = $(ALL_OBJS)"
	@echo "### LIBS = $(LIBS)"
	@echo "### MODELREF_LIBS = $(MODELREF_LIBS)"
	@echo "### SYSTEM_LIBS = $(SYSTEM_LIBS)"
	@echo "### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS)"
	@echo "### CFLAGS = $(CFLAGS)"
	@echo "### LDFLAGS = $(LDFLAGS)"
	@echo "### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS)"
	@echo "### CPPFLAGS = $(CPPFLAGS)"
	@echo "### CPP_LDFLAGS = $(CPP_LDFLAGS)"
	@echo "### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS)"
	@echo "### ARFLAGS = $(ARFLAGS)"
	@echo "### MEX_CFLAGS = $(MEX_CFLAGS)"
	@echo "### MEX_CPPFLAGS = $(MEX_CPPFLAGS)"
	@echo "### MEX_LDFLAGS = $(MEX_LDFLAGS)"
	@echo "### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS)"
	@echo "### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS)"
	@echo "### EXECUTE_FLAGS = $(EXECUTE_FLAGS)"
	@echo "### MAKE_FLAGS = $(MAKE_FLAGS)"


clean : 
	$(ECHO) "### Deleting all derived files..."
	$(RM) $(PRODUCT)
	$(RM) $(ALL_OBJS)
	$(ECHO) "### Deleted all derived files."


