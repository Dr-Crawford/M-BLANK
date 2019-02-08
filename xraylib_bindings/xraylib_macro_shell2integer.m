function shell2integer = xraylib_macro_shell2integer(shell2integer)
% Converts character reference to shell to integer based reference 
if ischar(shell2integer)
    data=importdata([xraylib_Library_Path,'xraylib-shells.h']);
    txt = data.textdata(:,2);
    txt=txt(strcmp(regexprep(txt,'.*_SHELL','KEEPTHIS'),'KEEPTHIS'));
    I=strcmp(regexprep(txt,'_SHELL',''),shell2integer);
    shell2integer=data.data(I);
end
5;
