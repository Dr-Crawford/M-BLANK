function integer = xraylib_macro_line2integer(line)
% Converts character reference to shell to integer based reference 
if ischar(line)
    data=importdata([xraylib_Library_Path,'xraylib-lines.h']);
    txt = data.textdata(:,2);
    txt=txt(strcmp(regexprep(txt,'.*_LINE','KEEPTHIS'),'KEEPTHIS'));
    I=strcmp(regexprep(txt,'_LINE',''),line);
    integer=data.data(I);
end
5;
