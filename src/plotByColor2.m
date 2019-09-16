function plotByColor2(x,y,z_col,storms, events, varargin)
    if nargin >= 6 && ~isempty(varargin{1}); MAXVAL = varargin{1}; 
    else; MAXVAL = max(z_col); end
    if nargin >= 7 && ~isempty(varargin{2}); LINESTYLE = varargin{2}; 
    else; LINESTYLE = '-'; end
%     if nargin >= 8; ZOFFSET = varargin{3}; 
%     else; ZOFFSET = 0; end
    if nargin >= 8  && ~isempty(varargin{3}); TRANS = varargin{3}; 
    else; TRANS = 0; end
    if nargin >= 9  && ~isempty(varargin{4}); COLOURS = varargin{4}; 
    else; COLOURS = jet(100); end

    z = zeros(numel(x),numel(y)); %+ZOFFSET; 

    colors = flipud(COLOURS); colormap(colors)
    colorPos = round(z_col/MAXVAL*100);
    colorPos(colorPos==0) = 1; 
    for i=1:numel(events)
        ii = all([storms == events(i), ~isnan([x,y])],2);
        if ~isempty(ii) && sum(ii)>1
            surf([x(ii),x(ii)],...
                [y(ii),y(ii)],...
                [z(ii),z(ii)],...
                [z_col(ii), z_col(ii)],... %[colorPos(ii),colorPos(ii)], ...
                'facecol','no',...
                'edgecol','interp',...
                'edgealpha',TRANS,...
                'linestyle',LINESTYLE,...
                'linew',2.5);
        end  
    end
end