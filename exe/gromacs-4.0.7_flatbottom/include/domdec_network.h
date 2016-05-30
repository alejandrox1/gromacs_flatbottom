/* -*- mode: c; tab-width: 4; indent-tabs-mode: n; c-basic-offset: 4 -*- 
 *
 * $Id$
 * 
 * This file is part of Gromacs        Copyright (c) 1991-2008
 * David van der Spoel, Erik Lindahl, Berk Hess, University of Groningen.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out http://www.gromacs.org
 * 
 * And Hey:
 * Gnomes, ROck Monsters And Chili Sauce
 */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#ifndef _domdec_network_h
#define _domdec_network_h

#include "typedefs.h"

#ifdef GMX_MPI
#include <mpi.h>
#endif

enum {
  dddirForward,dddirBackward
};

/* Move integers in the comm. region one cell along the domain decomposition
 * in the dimension indexed by ddimind
 * forward (direction=dddirFoward) or backward (direction=dddirBackward).
 */
extern void
dd_sendrecv_int(const gmx_domdec_t *dd,
		int ddimind,int direction,
		int *buf_s,int n_s,
		int *buf_r,int n_r);

/* Move revc's in the comm. region one cell along the domain decomposition
 * in dimension indexed by ddimind
 * forward (direction=dddirFoward) or backward (direction=dddirBackward).
 */
extern void
dd_sendrecv_rvec(const gmx_domdec_t *dd,
		 int ddimind,int direction,
		 rvec *buf_s,int n_s,
		 rvec *buf_r,int n_r);


/* Move revc's in the comm. region one cell along the domain decomposition
 * in dimension indexed by ddimind
 * simultaneously in the forward and backward directions.
 */
extern void
dd_sendrecv2_rvec(const gmx_domdec_t *dd,
		  int ddimind,
		  rvec *buf_s_fw,int n_s_fw,
		  rvec *buf_r_fw,int n_r_fw,
		  rvec *buf_s_bw,int n_s_bw,
		  rvec *buf_r_bw,int n_r_bw);


/* The functions below perform the same operations as the MPI functions
 * with the same name appendices, but over the domain decomposition
 * nodes only.
 * The DD master node is the master for these operations.
 */

extern void
dd_bcast(gmx_domdec_t *dd,int nbytes,void *data);

/* Copies src to dest on the master node and then broadcasts */
extern void
dd_bcastc(gmx_domdec_t *dd,int nbytes,void *src,void *dest);

extern void
dd_scatter(gmx_domdec_t *dd,int nbytes,void *src,void *dest);

extern void
dd_gather(gmx_domdec_t *dd,int nbytes,void *src,void *dest);

extern void
dd_scatterv(gmx_domdec_t *dd,
	    int *scounts,int *disps,void *sbuf,
	    int rcount,void *rbuf);

extern void
dd_gatherv(gmx_domdec_t *dd,
	   int scount,void *sbuf,
	   int *rcounts,int *disps,void *rbuf);

#endif	/* _domdec_network_h */
