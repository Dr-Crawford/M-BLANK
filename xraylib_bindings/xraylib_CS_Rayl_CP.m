function A = xraylib_CS_Rayl_CP(comp, E)
%% Details: This function is a binder to a function in the xraylib package
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
% Given an element Z and an energy E (in keV), this function will return
% the Rayleigh cross section expressed in cm2/g.
% 
% Identical to xraylib_CS_Rayl, but requires a chemical
% formula or a NIST compound name compound as first argument.
%
% See: xraylib_macro_integer_references
% comp is a character string

    %{
    if libisloaded('libxrl') == 0
    loadlibrary('C:\Windows\System32\libxrl-7.dll',...
                'C:\Program Files\xraylib 64-bit\Include/xraylib.h',...
                'alias','libxrl')
    end
    %}
    xraylib_loadlibrary;
    A = calllib('libxrl','CS_Rayl_CP', comp, E);
end
