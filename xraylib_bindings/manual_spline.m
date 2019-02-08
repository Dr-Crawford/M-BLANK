function [ysp, xpt, ypt] = manual_spline(x,y,xpt,ypt)
figure(999);close(999);
f = figure(999);clf
semilogy(x,y);pause(0.3)
h=msgbox('zoom then close');
uiwait(h);
xlims = xlim;
ylims = ylim;
if nargin<3
    xpt=[];
    ypt=[];
end
io = 1;
op = 1;
while io
    
    figure(f)
    [xp0,yp0] = getpts;
    if ~isempty(xp0)
        if op==1

            % get closest points and then average over closest 5 to left and right:
            [~,Ixy] = min(((x(:)-xp0(:)').^2 + (y(:)-yp0(:)').^2));
            xp = x(Ixy);
            yp = zeros(numel(xp),11);
            n=0;
            for i = -5:1:5
                n=n+1;
                yp(:,n) = y(Ixy+i);
            end
            yp = mean(yp,2);

            pt = [[xpt;xp],[ypt;yp]];
            [~,iii] = unique(pt(:,1),'stable');
            xpt = pt(iii,1);
            ypt = pt(iii,2);

        elseif op == -1
            [~,Ixy] = min(((xpt(:)-xp0(:)').^2 + (ypt(:)-yp0(:)').^2));
            xpt(Ixy)=[];
            ypt(Ixy)=[];

        elseif op==0
            pt = [[xpt;xp0],[ypt;yp0]];
            [~,iii] = unique(pt(:,1),'stable');
            xpt = pt(iii,1);
            ypt = pt(iii,2);
        end
    end
    %%
    figure(f)
    if ~isempty(xpt)&&numel(xpt)>1
        ysp = ppval(spline(xpt,ypt),x);
        semilogy(x,[y(:),ysp(:)]);
        hold on
        semilogy(xpt,ypt,'ko')
        hold off
    else
        semilogy(x,y(:));
    end
    xlim(xlims);
    ylim(ylims);
    if ~numel(xp0)
        switch questdlg('switch (+/-), independent point, quit (escape or close)','??','+','-','Add Independent Point','+')
            case []
                ans1 = questdlg('Close or reset?','???','Close','Reset','Close');
                if isempty(ans1)
                    io = 0;
                else
                    switch ans1
                        case 'Close'
                            io = 0;
                        case 'Reset'
                            xpt=[];
                            ypt=[];
                    end
                end
            case 'Add Independent Point'
                op = 0;              
            case '+'
                op = 1;                
            case '-' 
                op = -1;
        end
        
    end
        
end
close(999);
5;