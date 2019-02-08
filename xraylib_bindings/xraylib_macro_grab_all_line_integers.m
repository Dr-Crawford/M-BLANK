function [integers, lines] = xraylib_macro_grab_all_line_integers(shell)

% Converts character reference to shell to integer based reference 
if ischar(line)
    data=importdata([xraylib_Library_Path,'xraylib-lines.h']);
    txt = data.textdata(:,2);
    txt=txt(strcmp(regexprep(txt,'.*_LINE','KEEPTHIS'),'KEEPTHIS'));
    I=strcmp(regexprep(txt,[shell,'.*'],'KEEP'),'KEEP');
    integer=data.data(I);
    lines = regexprep(txt(I),'_LINE','');
end
5;
