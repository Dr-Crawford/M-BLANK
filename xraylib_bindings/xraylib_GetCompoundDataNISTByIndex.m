%% NIST COMPOUND DATA:
% struct compoundDataNIST {
%           char *name;
%           int nElements;
%           int *Elements;
%           double *massFractions;
%           double density;
%           };
% with:
%          name : a string containing the full name of the compound, as
%                 retrieved from the NIST database
%     nElements : number of different elements in the compound
%      Elements : a dynamically allocated array ?length = nElements ?
%                 containing the elements, in ascending order
% massFractions : a dynamically allocated array ?length = nElements ?
%                 containing the mass fractions of the elements in Elements
%       density : the density of the compound, expressed in g/cm
function compoundDataNIST = xraylib_GetCompoundDataNISTByIndex(compoundIndex)
% Name: Xraylib
% Version: 1.0.8
% Date: 2009-05-06
% Author: Teemu Ikonen   <tpikonen@gmail.com>
% Maintainer: Teemu Ikonen   <tpikonen@gmail.com>
% Title: GNU Scientific Library
% Description: Bindings to the Xraylib functions
% Categories: X-raydata
% License: GPL version 2
% Url: http://ftp.esrf.fr/pub/scisoft/xraylib/
% 
% ## Copyright (C) 2006   Teemu Ikonen   <tpikonen@gmail.com>
% ##
% ## This program is free software; you can redistribute it and/or modify
% ## it under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 2 of the License, or
% ## (at your option) any later version.
% ##
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ##
% ## You should have received a copy of the GNU General Public License
% ## along with this program; if not, see <http://www.gnu.org/licenses/>.
%
% INDEX of FUNCTIONS in XRAYLIB (the functions have been bound and titled
% with the original name appended to 'xraylib_':
%                                 xraylib_AtomicWeight
%                                 xraylib_ElementDensity
%                                 xraylib_CosKronTransProb
%                                 xraylib_CS_FluorLine
%                                 xraylib_EdgeEnergy
%                                 xraylib_LineEnergy
%                                 xraylib_FluorYield
%                                 xraylib_JumpFactor
%                                 xraylib_DCSP_Rayl
%                                 xraylib_DCSP_Compt
%                                 xraylib_DCSP_KN
%                                 xraylib_DCSP_Thoms
%                                 xraylib_RadRate
%                                 xraylib_FF_Rayl
%                                 xraylib_SF_Compt
%                                 xraylib_DCS_Thoms
%                                 xraylib_DCS_KN
%                                 xraylib_DCS_Rayl
%                                 xraylib_DCS_Compt
%                                 xraylib_MomentTransf
%                                 xraylib_CS_KN
%                                 xraylib_ComptonEnergy
%                                 xraylib_CS_Total
%                                 xraylib_CS_Photo
%                                 xraylib_CS_Rayl
%                                 xraylib_CS_Compt
%                                 xraylib_CSb_FluorLine
%                                 xraylib_CSb_Total
%                                 xraylib_CSb_Photo
%                                 xraylib_CSb_Rayl
%                                 xraylib_CSb_Compt
%                                 xraylib_DCSb_Rayl
%                                 xraylib_DCSb_Compt
%                                 xraylib_DCSPb_Rayl
%                                 xraylib_DCSPb_Compt
% -------------------------------------------------------------------------

%% Function Explanation:
%
% Using xraylib_GetCompoundDataNISTByName and xraylib_GetCompoundDataNISTByIndex it is
% possible to query the contents of NISTs catalog of compound compositions
% and densities. The former takes a compound name compoundString and if a
% match is found, the corresponding newly allocated compoundDataNIST
% structure is returned, while the latter takes an index compoundIndex in
% the form of a NIST compound?type macro. 
% The list of compound names can be queried using: 
% LIST = GetCompoundDataNISTList(nCompounds) 
% which returns a NULL terminated array of strings. Optionally, pass a
% pointer to an integer nCompounds to obtain the number of strings in the
% array ?pass NULL if value is not required?. This option is only present
% in the C/C++/Obj?C implementation. The list can also be obtained at our
% online xraylib calculator: http://lvserver.ugent.be/xraylib-web/. 
% After usage, the returned compoundDataNIST structures should be freed
% with ?C/C++/Obj?C and Fortran only?: void FreeCompoundDataNIST(struct
% compoundDataNIST *compoundData);

    xraylib_loadlibrary;
    compoundDataNIST = calllib('libxrl','GetCompoundDataNISTByIndex',compoundIndex);
end