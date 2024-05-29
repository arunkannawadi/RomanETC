SRC = src/exptimecalc.c

CFLAGS = -lm -Wall -O3 -DIN_DLON

PZCAL_FLAGS = -DPZCAL_MODE
BAO_FLAGS = -DBAO_MODE -DFOWLER8

WL_FLAGS = -DWL_MODE -DWL_CUT_DEFAULT -DOUT_WL_CAT -DOUT_EXTRA_PSF_PROPERTIES -DMY_WL_EXTRAFIELDS
PHOTO_FLAGS = -DWL_MODE  -DOUT_EXTRA_PSF_PROPERTIES -DWFE_OVERRIDE
SPCONT_FLAGS = -DSPCONT_MODE -DWFE_OVERRIDE

# Pattern specific rules
PZCAL%: prefix = pzcaletc
BAO_OIII%: prefix = baoetc-o3
BAO_OII%: prefix = baoetc-o2
BAO_NII%: prefix = baoetc
WL%: prefix = wletc
PHOTO%: prefix = photoetc
SPCONT%: prefix = spcontetc

# Build as an executable (standard approach)
%_EXE: suffix = exe
%_EXE: OUTPUT_FLAGS = -o

# Build as a shared library (work in progress)
%_LIB: suffix = so
%_LIB: OUTPUT_FLAGS = -shared -o

# Define a short hand for the build command with all the variables
COMMAND = ${CC} ${SRC} ${OUTPUT_FLAGS} ${prefix}.${suffix} ${CFLAGS} ${ADDITIONAL_FLAGS}

# Do not build anything by default & request explicit target speicification
.PHONY: all
all:
	@echo "Please specify the target to build"

# Explicitly specific each target
PZCAL_EXE PZCAL_LIB:
	${COMMAND} ${PZCAL_FLAGS}
BAO_OIII_EXE BAO_OIII:
	${COMMAND} ${BAO_FLAGS} -DOIII_GAL
BAO_OII_EXE BAO_OII_LIB:
	${COMMAND} ${BAO_FLAGS} -DOII_GAL
BAO_NII_EXE BAO_NII_LIB:
	${COMMAND} ${BAO_FLAGS} -DUSE_NII
WL_EXE WL_LIB:
	${COMMAND} ${WL_FLAGS}
PHOTO_EXE PHOTO_LIB:
	${COMMAND} ${PHOTO_FLAGS}
SPCONT_EXE SPCONT_LIB:
	${COMMAND} ${SPCONT_FLAGS}

.PHONY: clean
clean:
	rm -f *.exe *.so
