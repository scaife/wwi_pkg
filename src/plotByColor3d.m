function plotByColor3d(x,y,z_col)
    colors = flipud(jet(100)); colormap(colors)
    colorPos = round(z_col/max(z_col)*100);
    for i=1:numel(z_col)

        if colorPos(i) == 0 
            plot3(x(i),y(i),z_col(i),'.','color',colors(1,:),'markersize',15)
        elseif isnan(colorPos(i))
        else
            plot3(x(i),y(i),z_col(i),'.','color',colors(colorPos(i),:),'markersize',15)
        end
    end

end