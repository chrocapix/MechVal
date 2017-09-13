// MechValCore.cpp : Defines the exported functions for the DLL application.
//

#include "MechValCore.h"
#include "pouet.h"

extern "C" {
// This is an example of an exported function.
MechValCore_API int fnMechValCore (void) { return pouet (); }
}
