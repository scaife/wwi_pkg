function plotContours(x_s, y_s,varargin)
    if size(varargin)>0; c_space=varargin{1}; 
    else; c_space = []; end
    
    if ~isempty(c_space)
        [X,Y] = meshgrid(x_s, y_s);
        Z = X./Y;
        [~,c]=contour(X,Y,Z,c_space,'ShowText','on');
        c.LineColor = 'k';
    else
        [X,Y] = meshgrid(x_s, y_s);
        Z = X./Y;
        [~,c]=contour(X,Y,Z,'ShowText','on');
        c.LineColor = 'k';
    end
    
end