function PEC = extract_tables_from_web
[AtomicNumbers, ~, AtomicSymbols] = get_AtomTable('All');
% AtomicNumbers(40:end) = [];
% AtomicSymbols(40:end) = [];
% energy = 10:0.1:14;
KeVi = 1;
KeVf = 100;
energy = KeVi:0.1:KeVf;

PEC = cell(numel(AtomicNumbers),2+numel(num2cell(energy)));
PEC = [[{'#','Symbol'},num2cell(energy)];PEC];
PEC_pad = cell(1,size(PEC,2)-1);
PEC_HEADER = ['Photoelectric Cross Sections',PEC_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',PEC_pad;...
              ['Data: ',datestr(clock)],PEC_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',PEC_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],PEC_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},PEC_pad;...
              {'Units:'},'',PEC_pad];

TCS = PEC;
TCS_HEADER = ['Total Cross Sections',PEC_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',PEC_pad;...
              ['Data: ',datestr(clock)],PEC_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',PEC_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],PEC_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},PEC_pad;...
              {'Units:'},'',PEC_pad];
CCS = PEC;
CCS_HEADER = ['Coherent Cross Sections',PEC_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',PEC_pad;...
              ['Data: ',datestr(clock)],PEC_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',PEC_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],PEC_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},PEC_pad;...
              {'Units:'},'',PEC_pad];
ICS = PEC;
ICS_HEADER = ['Incoherent Cross Sections',PEC_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',PEC_pad;...
              ['Data: ',datestr(clock)],PEC_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',PEC_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],PEC_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},PEC_pad;...
              {'Units:'},'',PEC_pad];
AC = PEC;
AC_HEADER = ['Absorption Coefficient',PEC_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',PEC_pad;...
              ['Data: ',datestr(clock)],PEC_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',PEC_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],PEC_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},PEC_pad;...
              {'Units:'},'',PEC_pad];

FY = cell(numel(AtomicNumbers),6); 
FY = [{'#','Symbol','K','L1','L2','L3'};FY];
FY_pad = cell(1,size(FY,2)-1);
FY_HEADER = ['Fluorescence Yields',FY_pad;...
              'Values Obtained from ''www.csrri.iit.edu/mucal.html''',FY_pad;...
              ['Data: ',datestr(clock)],FY_pad;...
              'Program reference: P. Bandyopadhyay and C.U. Segre, http://www.csrri.iit.edu/mucal.html.',FY_pad;...
              ['Calculations are based on data from: W.H. McMaster N.K. Del Grande,'...
              ' J.H. Mallett and J.H. Hubbell, "Compilation of x-ray cross sections",'...
              ' Lawrence Livermore National Laboratory Report UCRL-50174 (section I 1970,'...
              ' section II 1969, section III 1969 and section IV 1969).'],FY_pad;...
              {'Fluorescence yield data from: M. O. Krause, J. Phys. Chem. Ref. Data. 8, 307(1979).'},FY_pad];


for i = AtomicNumbers';
    i
    atomic_symbol = AtomicSymbols{i};
    n = i+1;
    PEC{n,1} =  i;
    PEC{n,2} =  atomic_symbol;
    CCS(n,1:2) = PEC(n,1:2);
    ICS(n,1:2) = PEC(n,1:2);
    TCS(n,1:2) = PEC(n,1:2);
    AC(n,1:2) = PEC(n,1:2);
    for j = 1:numel(energy)
        ener = energy(j);
        url = ['http://csrri.iit.edu/cgi-bin/mucal-form?name=', atomic_symbol,'&ener=',num2str(ener)];
        [s,status] = urlread(url);  
        str1 = process_url_string(s);
        %% Photoelectric Cross Section
        [PEC{n,j+2}, PEC_units] = grab_Cross_Section_Val(str1, 'Photoelectric');
        %% Coherent Cross Section
        [CCS{n,j+2}, CCS_units] = grab_Cross_Section_Val(str1, 'Coherent');
        %% Incoherent Cross Section
        [ICS{n,j+2}, ICS_units] = grab_Cross_Section_Val(str1, 'Incoherent');
        %% Total Cross Section
        [TCS{n,j+2}, TCS_units] = grab_Cross_Section_Val(str1, 'Total');
        %% Absorption Coefficient
        [AC{n,j+2}, AC_units] = grab_Cross_Section_Val(str1, 'Absorption coefficient');
        %% UNITS
        if i==1;
            PEC_HEADER{end,2} = PEC_units;
            CCS_HEADER{end,2} = CCS_units;
            ICS_HEADER{end,2} = ICS_units;
            TCS_HEADER{end,2} = TCS_units;
            AC_HEADER{end,2}  = AC_units;
        end
    end
    %% Fluorescence Yields
    FY{n,1} =  i;
    FY{n,2} =  atomic_symbol;
    I = strncmp(str1,'Fluorescence yield for K,L1,L2,L3:',numel('Fluorescence yield for K,L1,L2,L3:'));
    fy = str1{I};
    fy = regexprep(fy,'Fluorescence yield for K,L1,L2,L3:','');
    idx = strfind(fy,',');
    K  = str2num(fy(1:idx(1)-1));
    L1 = str2num(fy(idx(1)+1:idx(2)-1));
    L2 = str2num(fy(idx(2)+1:idx(3)-1));
    L3 = str2num(fy(idx(3)+1:end));
    try
        FY{n,3} = K;
    catch me
        FY{n,3} = nan;
    end
    try
        FY{n,4} = L1;
    catch me
        FY{n,4} = nan;
    end
    try
        FY{n,5} = L2;
    catch me
        FY{n,5} = nan;
    end
    try
        FY{n,6} = L3;
    catch me
        FY{n,6} = nan;
    end
end

xlswrite(['PEC_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[PEC_HEADER;PEC]);
xlswrite(['CCS_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[CCS_HEADER;CCS]);
xlswrite(['ICS_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[ICS_HEADER;ICS]);
xlswrite(['TCS_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[TCS_HEADER;TCS]);
xlswrite(['FY_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[FY_HEADER;FY]);
xlswrite(['AC_values_for_XRF_calibration_of_slope_',num2str(KeVi),'KeV-',num2str(KeVf),'KeV_Z',num2str(AtomicNumbers(1)),'-',num2str(AtomicNumbers(end))],[AC_HEADER;AC]);
5;

function [val, unit] = grab_Cross_Section_Val(str1, MARK);
I = strncmp(str1,MARK,numel(MARK));
pec = str1{I};
pec = regexprep(pec,MARK,'');
MARK = '_SPACE_';
pec = regexprep(pec,'\s*',MARK);
I = strfind(pec,MARK);
val = str2num(pec(I(1)+numel(MARK):I(2)-1));
unit = pec(I(2)+numel(MARK):I(3)-1);


function str1 = process_url_string(s)
I1 = strfind(s,'<HR>');  
I1 = [I1,strfind(s,'<hr>')];
I1 = [I1,strfind(s,'<p>')]; 
I1 = sort(I1,'ascend');

str1 = cell(numel(I1)-1,1);
for ii = 1:numel(I1)-1;
    str1{ii,1} = s(I1(ii):I1(ii+1)-1);
end

str1 = regexprep(str1,'<(p|HR|hr)>\s*','');