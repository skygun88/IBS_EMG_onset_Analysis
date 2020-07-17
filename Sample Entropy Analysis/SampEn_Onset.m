% Step 0:
% prepare the parameter of SampEn
epoch_order = 7;
epoch_dataset = ALLEEG.data(3,: ,epoch_order); % each epoch
%epoch_dataset = abs(epoch_dataset - mean(epoch_dataset)); % retified

all_epoch = reshape(ALLEEG.data(3,:), [1,1200000]); % connect all epoch datasets
%all_epoch = abs(all_epoch - mean(all_epoch)); % retified

r = 0.4* std(all_epoch(:)); % global tolerance = 0.25 * SD of original EMG data
m = 2; % embedding dimension (refer X. Zhang's paper)

%-----------------------------------------------------%

% Step 1:
% segmetation of original surface EMG time series
% into a series of overlapped analysis windows
win_len = 64;
win_incre = 32;
wins = make_windows(epoch_dataset, win_len, win_incre);
% overlapped analysis window - length = 32ms & increment = 4ms

%-----------------------------------------------------%

% Step 2:
% Caculate sample entropy of each analysis window
wins_SampEn = find_all_SampEn(wins, m, r); % SampEn = sampen(data, m, r)

%-----------------------------------------------------%

% Step 3:
% Find onset of voluntary muscle activity
thr = 0.5; % threshold
result = []; % list which contain the value > threshold
for i = 1:size(wins_SampEn)
    if (wins_SampEn(i,1) >= thr)
        result = [i,  wins_SampEn(i,1)];
        break
    end
end

t = [win_len/4 - 1000];
for i = 2:size(wins_SampEn)
    t = [t,(win_len - win_incre)*(i-1)/2 - 1000];
end

onset = t(result(1));

%-----------------------------------------------------%

% Plot
subplot(2,1,1); draw_graph(wins_SampEn, win_len, win_incre, epoch_order);
hold on; plot([-1000,2000], [thr, thr]); hold off;
subplot(2,1,2); plot([-999.5:0.5:2000], epoch_dataset);
hold on;
plot([onset, onset], [-0.5, 0.5]);
hold off;

%-----------------------------------------------------%

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

% function that draw the Graph plotting SampEn of each analysis window
function draw_graph(sampen_list, window_length, window_increment, epoch_order)
t = [window_length/4 - 1000];
for i = 2:size(sampen_list)
    t = [t,(window_length - window_increment)*(i-1)/2 - 1000 - window_length/4];
end
sampen_line = plot(t, sampen_list);
sampen_line.Marker = 'o';

hold on;
x = [0,0];
y = [-1:4:3];
plot(x, y);
xlabel('time (ms)');
ylabel('SampEn');
title(sprintf('Sample Entropy Onset Detection (epoch : %d)', epoch_order));
grid on;
hold off;
end
