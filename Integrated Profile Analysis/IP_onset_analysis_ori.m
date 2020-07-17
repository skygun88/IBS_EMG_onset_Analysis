function onset_result = IP_onset_analysis(dataset, channel)
    % prepare the parameter of IP
    if ~exist('channel', 'var')
        channel = 3;
    end
    IP_result = zeros(1, size(dataset.data, 3));
    min_D_list = zeros(1, size(dataset.data, 3));
    
    for k = 1:1:size(dataset.data, 3)
        epoch_order = k;
        epoch_dataset = dataset.data(channel,: ,epoch_order); % each epoch
        rectified_dataset = abs(epoch_dataset - mean(epoch_dataset)); % retification
        
        start_point = 1801; % start point of window
        end_point = 2400; % end point of window
        M = end_point - start_point + 1; % M
        
        %-----------------------------------------------------%
        
        IP = zeros(1, M); % make empty matrix
        
        % Caculate IP(t) for target window -> IP(t) = |x(1)| + |x(2)| + ... + |x(t)|
        for i = start_point:1:end_point
            if (i == start_point)
                IP(1, i-start_point+1) = rectified_dataset(1, start_point);
            else
                IP(1, i-start_point+1) = IP(1, i-start_point) + rectified_dataset(1, i);
            end
        end
        
        t = 0.5 : 0.5 : M/2;
        L = IP(1, M) / M * 2*t; % L(t) = IP(M) x t/M
        D = IP - L; % D(t) = IP(t) - L(t)
        [min_value, min_index] = min(D); % Onset = min(D(t))
        
        %-----------------------------------------------------%
        
        min_D_list(1, k) = min_value; % The list contain min(D) of each epoch
        
        % line that show position of onset
        onset_x = (min_index-(2000-start_point+1))/2;
        
        if (onset_x < 0) % Remove false onset (1)
            onset_x = NaN;
        end
        if (abs(min_value) < 1.0) % Remove false onset (2)
            onset_x = NaN;
        end
        
        IP_result(1, k) = onset_x; % Append onset latency to result list
    end
    onset_result = IP_result;
end