function xraylib_loadlibrary
% Loading libraries using header files is not supported in compiled
% applications. Therefore, to create an application that uses the
% loadlibrary function with a header file, follow these steps:

% 1. Create a prototype MATLAB file. 
%    Suppose that you call loadlibrary with the following syntax.
%    loadlibrary(library, header)
%    Run the following command in MATLAB only once to create the prototype file:
%    loadlibrary(library, header, 'mfilename', 'mylibrarymfile'); 
%    This creates mylibrarymfile.m in the current folder. If you are on Windows®, another file named library_thunk_pcwin64.dll is also created in the current folder.

if libisloaded('libxrl') == 0
    if exist('libxrl_libraryfile','file')==0 && ~isdeployed
        % 1. Run the following command in MATLAB only once to create the prototype file:
        %    loadlibrary(library, header, 'mfilename', 'mylibrarymfile'); 
%         loadlibrary('C:\Windows\System32\libxrl-7.dll',...
%                     [xraylib_Library_Path,'xraylib.h'],...
%                     'alias','libxrl', 'mfilename', 'libxrl_libraryfile')
        loadlibrary('C:\Windows\System32\libxrl-7.dll',...
                    [xraylib_Library_Path,'xraylib.h'],...
                    'mfilename', 'libxrl_libraryfile')
%         loadlibrary('DLLs\libxrl-7.dll',...
%                     [xraylib_Library_Path,'xraylib.h'],...
%                     'mfilename', 'libxrl_libraryfile')
        % 2. change the call to load library
%         loadlibrary('C:\Windows\System32\libxrl-7.dll',@libxrl_libraryfile, 'alias','libxrl')
%         loadlibrary('DLLs\libxrl-7.dll',@libxrl_libraryfile,'alias','libxrl')
%     else
    end
        % 2. change the call to load library
        try
            loadlibrary('C:\Windows\System32\libxrl-7.dll',@libxrl_libraryfile,'alias','libxrl')
            disp('C:\Windows\System32\libxrl-7.dll WORKED')
        catch
            %% added 04Feb2019: not sure if this works
            try
                loadlibrary('libxrl-7.dll',@libxrl_libraryfile,'alias','libxrl')
            catch
                
                loadlibrary('DLLs\libxrl-7.dll',@libxrl_libraryfile,'alias','libxrl')
                disp('DLLs\libxrl-7.dll WORKED')
    %             system(['explorer.exe ','DLLs\']) ;
            end
        end
%     end  
end

% 3. Compile and deploy the application.
% If you are integrating the library into a deployed application, specify
% the library's .dll along with library_thunk_pcwin64.dll, if created,
% using the -a option of mcc command. If you are using Application Compiler
% or Library Compiler apps, add the .dll files to the Files required for
% your application to run section of the app. If you are providing the
% library as an external file that is not integrated with the deployed
% application, place the library .dll file in the same folder as the
% compiled application. If you are on Windows, you must integrate
% library_thunk_pcwin64.dll into your compiled application. The benefit of
% this approach is that you can replace the library with an updated version
% without recompiling the deployed application. Replacing the library with
% a different version works only if the function signatures of the function
% in the library are not altered. This is because mylibrarymfile.m and
% library_thunk_pcwin64.dll are tied to the function signatures of the
% functions in the library.

