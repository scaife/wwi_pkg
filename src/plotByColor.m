function plotByColor(x,y,z_col, varargin)
    if nargin >= 4; MAXVAL = varargin{1}; 
    else; MAXVAL = max(z_col); end
    if nargin >= 5; MARKERTYPE = varargin{2}; 
    else; MARKERTYPE = '.'; end
    if nargin >= 6; MARKERSIZE = varargin{3}; 
    else; MARKERSIZE = 15; end

%     colors = flipud(jet(100)); 
    colormap(flipud(jet))
%     colorPos = round(z_col/MAXVAL*100);
%     for i=1:numel(z_col)
% 
%         if colorPos(i) == 0 
%             plot(x(i),y(i),MARKERTYPE,...
%                 'color',colors(1,:),...
%                 'markersize',MARKERSIZE)
%         elseif isnan(colorPos(i))
%         else
%             plot(x(i),y(i),MARKERTYPE,...
%                 'color',colors(colorPos(i),:),...
%                 'markersize',MARKERSIZE)
%         end
%     end
    msize=repmat(MARKERSIZE,numel(x),1)*10;
    scatter(x,y,msize,z_col,MARKERTYPE)
    caxis([0 MAXVAL])
end