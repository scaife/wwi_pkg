function plotWWI(x,y,z,storms,events,varargin)
    if nargin >= 6; MAXVAL = varargin{1}; 
    else; MAXVAL = max(z); end
    if nargin >= 7; MARKERTYPE = varargin{2}; 
    else; MARKERTYPE = '.'; end
    if nargin >= 8; MARKERSIZE = varargin{3}; 
    else; MARKERSIZE = 15; end
    
    colors = flipud(parula(100)); colormap(colors)
%     colorPos = round(z/MAXVAL*100);

    for i=1:numel(events)
        ii = storms==events(i);
        if ~isempty(ii)
%             plot(x(ii),y(ii),MARKERTYPE, ...
%                 'color',colors(colorPos(i),:),...
%                 'markersize',MARKERSIZE);
            msize=repmat(MARKERSIZE,sum(ii),1)*10; 
            scatter(x(ii),y(ii),msize,z(ii),MARKERTYPE);
        end  
    end
    caxis([0 MAXVAL])
end 