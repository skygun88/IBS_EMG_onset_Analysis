function onset_result = TKEO_onset_analysis(dataset, channel)
    % prepare the parameter of IP
    if ~exist('channel', 'var')
        channel = 3;
    end
    
    TK_result = zeros(1, size(dataset.data, 3));
    all_epoch = reshape(dataset.data(channel,:), [1,1200000]);
    global_SD = 0.5* std(all_epoch(:));

    for k = 1:1:size(dataset.data, 3)
        epoch_order = k;
        epoch_dataset = dataset.data(channel,: ,epoch_order); % each epoch
        rectified_dataset = abs(epoch_dataset - mean(epoch_dataset)); % retification
        
        new_data = zeros(size(rectified_dataset(1,:), 1));
        
        for i = 2:1:size(rectified_dataset')-1
            new_data(i,1) = rectified_dataset(1,i)^2 - rectified_dataset(1, i-1)*rectified_dataset(1,i+1);
        end
        
        new_data(1,1) = new_data(2,1);
        new_data(6000,1) = new_data(5999,1);
        new_data = abs(new_data);
        
        baseline_SD = std(new_data);
        baseline_mean = mean(new_data);
        j = 3;
        threshold = baseline_mean + j*baseline_SD;
        
        onset_list = find(new_data(2001:2400)> threshold);
        
        if isempty(onset_list)
            TK_onset = NaN;
        else
            TK_onset = onset_list(1,1)/2;
        end
        TK_result(1, k) = TK_onset;
    end
    
    onset_result = TK_result;
end