function onset_result = SE_onset_analysis(dataset, channel)
    % Step0:
    % prepare the parameter of IP
    if ~exist('channel', 'var')
        channel = 3;
    end
    
    SE_result = zeros(1, size(dataset.data, 3)); % Result list
    
    all_epoch = reshape(dataset.data(3,:), [1,1200000]); % connect all epoch datasets
    r = 0.4* std(all_epoch(:)); % global tolerance = j * SD of original EMG data (Normally, j = 0.25)
    m = 2; % embedding dimension (refer X. Zhang's paper)
    win_len = 64; win_incre = 32; % window lenght & window increment
    
    for k = 1:1:size(dataset.data, 3)
        epoch_order = k;
        epoch_dataset = dataset.data(channel,: ,epoch_order); % each epoch
        
        %--------------------------------------------------%
        
        % Step 1:
        % segmetation of original surface EMG time series into a series of overlapped analysis windows
        wins = make_windows(epoch_dataset, win_len, win_incre); % overlapped analysis window
        
        %--------------------------------------------------%
        
        % Step 2:
        % Caculate sample entropy of each analysis window
        wins_SampEn = find_all_SampEn(wins, m, r); % SampEn = sampen(data, m, r)
        
        %--------------------------------------------------%
        
        % Step 3:
        % Find onset of voluntary muscle activity
        
        % Time vector
        t = [win_len/4 - 1000];
        for i = 2:size(wins_SampEn)
            t = [t,(win_len - win_incre)*(i-1)/2 - 1000];
        end
        target_window = find(t>-100 & t<150); % index list for -100ms < t < 150ms
        
        thr = 0.5; % threshold
        result = []; % list which will contain the value > threshold
        for i = 1:size(target_window')
            if (wins_SampEn(target_window(1, i),1) >= thr )
                result = [target_window(1, i),  wins_SampEn(i,1)];
                break
            end
        end
        
        if isempty(result) % When no onset found -> onset = NaN
            onset = NaN;
        else
            onset = t(result(1));
            if onset < 0 % remove false onset - onset before t = 0
                onset = NaN;
            end
        end
        SE_result(1, k) = onset; % Append onset data on result list
    end
    onset_result = SE_result;
end

% function that makes overlapped analysis windows
function windows = make_windows(dataset, length, increment)
    wins = [];
    s1_1 = 1;
    for i = 1:8:size(dataset(:)) % each 4ms
        s1_2 = i;
        if (s1_2 - s1_1 == length) % length
            wins = [wins; dataset(s1_1:s1_2 - 1)]; % add a window
            s1_1 = s1_2 - increment; % increment
        end
    end
    windows = wins; % return window matrix
end

% function that calculate of SampEn of each analysis window
function sampen_list = find_all_SampEn(windows, m, r)
    wins_SampEn = [];
    for i = 1:size(windows(:, 1)) % for all analysis windows
        [output, ~] = SampEn(windows(i,:), m, r, 1); % calculate SampEn
        wins_SampEn = [wins_SampEn;output];
    end
    sampen_list = wins_SampEn;
end