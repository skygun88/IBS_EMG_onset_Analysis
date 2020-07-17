function onset_result = IP_TK_onset_analysis(dataset, channel)
    % prepare the parameter of IP
    if ~exist('channel', 'var')
        channel = 3;
    end
    IP_TK_result = zeros(1, size(dataset.data, 3));
    min_D_list = zeros(1, size(dataset.data, 3));
    
    for k = 1:1:size(dataset.data, 3)
        epoch_order = k;
        epoch_dataset = dataset.data(channel,: ,epoch_order); % each epoch
        rectified_dataset = abs(epoch_dataset - mean(epoch_dataset)); % retification
        
        %-----------------------------------------------------%
        
        % Flat the dataset by TKEO
        new_data = zeros(size(rectified_dataset(1,:), 1));
        for i = 2:1:size(rectified_dataset')-1
            new_data(i,1) = rectified_dataset(1,i)^2 - rectified_dataset(1, i-1)*rectified_dataset(1,i+1); % Y(t) = x(t)^2 - x(t+1)*x(t-1)
        end
        new_data(1,1) = new_data(2,1);
        new_data(6000,1) = new_data(5999,1);
        new_data = abs(new_data)';
        %-----------------------------------------------------%
        
        % Set up the size of the window
        start_point = 1801; % start point of window
        end_point = 2300; % end point of window
        M = end_point - start_point + 1; % M
        
        %-----------------------------------------------------%
        
        IP = zeros(1, M); % make empty matrix
        
        % Caculate IP(t) for target window -> IP(t) = |x(1)| + |x(2)| + ... + |x(t)|
        for i = start_point:1:end_point
            if (i == start_point)
                IP(1, i-start_point+1) = new_data(1, start_point);
            else
                IP(1, i-start_point+1) = IP(1, i-start_point) + new_data(1, i);
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
        
        if (onset_x < 0) % Remove false onset (1) - Onset before target
            onset_x = NaN;
        end
        if (abs(min_value) < 0.04) % Remove false onset (2) - low response
            onset_x = NaN;
        end
        IP_TK_result(1, k) = onset_x; % Append onset latency to result list
    end
    onset_result = IP_TK_result;
end