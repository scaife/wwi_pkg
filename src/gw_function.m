% This function takes a time series of GW level and transforms it for
% analysis with wwi.

function [gw_ts_out] = compute_gw_level(...
    gw_level_timeseries, ...
    well_depth, ...
    varargin)

    if numel(varargin)>0; maxD = varargin{1}; else; maxD = 3; end
    
    if istable(gw_level_timeseries)
        ts_in = gw_level_timeseries(:,1); 
        gw_in = gw_level_timeseries{:,2:end};
        colNames = gw_level_timeseries.Properties.VariableNames;
    else
        msg = 'input must be table'; 
        error(msg)
    end
    
    if numel(number_of_wells) ~= size(gw_in,2)
        msg = 'number of well depths does not match number of well timeseries';
        error(msg)
    end
    
    [r,c] = size(well_depth);
    if r > c; well_depth = well_depth'; end
    disp(['analyzing ', num2str(c), ' wells'])
    
    numOfObs = length(ts_in); 

    gw_out = nan(size(gw_in)); 
    wellsGTmaxD = well_depth > maxD; 
    wellsLTmaxD = ~wellsGTmaxD;
    
    if sum(wellsGTmaxD) > 0
        temp_wd = well_depth(:,wellsGTmaxD); 
        temp_gw_in = gw_in(:,wellsGTmaxD);
        
        temp_wd = repmat(temp_wd,numOfObs,1);
        gw_out(:,wellsGTmaxD) = ...
            temp_gw_in-(temp_wd-maxD);
    end
    
    if sum(wellsLTmaxD) > 0
        temp_wd = well_depth(:,wellsGTmaxD); 
        temp_gw_in = gw_in(:,wellsGTmaxD);
        
        temp_wd = repmat(temp_wd,numOfObs,1);
        gw_out(:,wellsGTmaxD) = (maxD-temp_wd)+temp_gw_in;
    end

    gw_ts_out = [ts_in,array2table(gw_out)];
    gw_ts_out.Properties.VariableNames = colNames;

end