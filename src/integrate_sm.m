function sm_out = integrate_sm(sm_fract, ts, depth_mm, int_depth_mm)

    vmc_int = nan(size(ts,1),1);
    for i = 1:size(ts)
        x = [0, depth_mm];
        y = [sm_fract(i,1); sm_fract(i,1:end)'];
        if ~isnan(sum(y))
            y2 = interp1(x,y, 0:int_depth_mm); 
            vmc_int(i,1) = sum(y2);
        else
            vmc_int(i,1) = NaN;
        end
    end
    
    varNames = string(depth_mm./10);
    for i = 1:numel(depth_mm)
        varNames{i} = ['sm' varNames{i} 'cm']; 
    end
    varNames = [{'ts'}, varNames];
    dName = int_depth_mm/10; 
    varNames{end+1} = ['vmc0_', num2str(dName), 'cm'];
        
    sm_out = [table(ts), array2table(sm_fract), table(vmc_int)];
    sm_out.Properties.VariableNames = varNames; 
end