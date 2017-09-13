// MechValCore.cpp : Defines the exported functions for the DLL application.
//

#include "MechValCore.h"
#include "nlopt.h"
#include "pouet.h"

extern "C" {
// This is an example of an exported function.
MechValCore_API int fnMechValCore (void)
{
    nlopt_opt opt = nlopt_create (NLOPT_LN_COBYLA, 3);
    int dim       = nlopt_get_dimension (opt);
    nlopt_destroy (opt);

    return pouet () + dim;
}
}
