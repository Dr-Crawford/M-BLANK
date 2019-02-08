%% Radionuclides:
% struct radioNuclideData {
% char *name;
% int Z;
% int A;
% int N;
% int Z_xray;
% int nXrays;
% int *XrayLines;
% double *XrayIntensities;
% int nGammas;
% double *GammaEnergies;
% double *GammaIntensities;
% };
% with:
%             name : a string containing the mass number ?A?, followed by
%                    the chemical element ?e.g. 55Fe?
%                Z : atomic number of the radionuclide
%                A : mass number of the radionuclide
%                N : number of neutrons of the radionuclide
%           Z_xray : atomic number of the nuclide after decay, which should
%                    be used in calculating the energy of the emitted X?ray
%                    lines using LineEnergy
%           nXrays : number of emitted characteristic X?rays
%        XrayLines : a dynamically allocated array ?length = nXrays ? of
%                    line?type macros, identifying the emitted X?rays
%  XrayIntensities : a dynamically allocated array ?length = nXrays ? of
%                    photons per disintegration, one value per emitted
%                    X?ray
%          nGammas : number of emitted gamma?rays
%    GammaEnergies : a dynamically allocated array ?length = nGammas ? of
%                    emitted gamma?ray energies
% GammaIntensities : a dynamically allocated array ?length = nGammas ? of
%                    emitted gamma?ray photons per disintegration
function radioNuclideData = xraylib_GetRadioNuclideDataByName(radioNuclideString)
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
% Use 
% xraylib_GetRadioNuclideDataByName and 
% xraylib_GetRadioNuclideDataByIndex
% to query xraylib's database of X?ray emission profiles for several
% important radionuclides. The former expects the name radioNuclideString
% of a radionuclide, while the latter takes a radionuclide?type macro
% radioNuclideIndex . When successful, a freshly allocated radioNuclideData
% structure is returned. Query the list of names using:

% list = xraylib_GetRadioNuclideDataList(nRadioNuclides); 
% which returns a NULL terminated array of strings. Optionally, pass a
% pointer to an integer nRadioNuclides to obtain the number of strings in
% the array ?pass NULL if value is not required?. This option is only
% present in the C/C++/Obj?C implementation. The list can also be obtained
% at our online xraylib calculator: http://lvserver.ugent.be/xraylib-web/

    xraylib_loadlibrary;
    radioNuclideData = calllib('libxrl','GetRadioNuclideDataByName',radioNuclideString);
end