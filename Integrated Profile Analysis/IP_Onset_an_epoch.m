% prepare the parameter of IP
epoch_order = 31;
epoch_dataset = ALLEEG.data(3,: ,epoch_order); % each epoch
retified_dataset = abs(epoch_dataset - mean(epoch_dataset)); % retification

start_point = 1801; % start point of window
end_point = 2400; % end point of window
M = end_point - start_point + 1; % M

%-----------------------------------------------------%

IP = zeros(1, M); % make empt y matrix

% Caculate IP(t) for target window -> IP(t) = |x(1)| + |x(2)| + ... + |x(t)|
for i = start_point:1:end_point
    if (i == start_point)
        IP(1, i-start_point+1) = retified_dataset(1, start_point);
    else
        IP(1, i-start_point+1) = IP(1, i-start_point) + retified_dataset(1, i);
    end
end

t = 0.5 : 0.5 : M/2;
L = IP(1, M) / M * 2*t; % L(t) = IP(M) x t/M
D = IP - L; % D(t) = IP(t) - L(t)
[min_value, min_index] = min(D); % Onset = min(D(t))

%-----------------------------------------------------%

% line that show position of onset
onset_x = [min_index/2,  min_index/2];

if (abs(min_value) < 1.0) % Remove false onset (2)
    if abs(min_value) > 0.5
        local_min = islocalmin(D);
        candidate = [];
        for i = 1:1:size(D')
            if local_min(1, i) == 1
                if D(1,i) < 0.6*min_value
                    candidate = [candidate, i];
                end
            end
        end
        min_index_list = [];
        for i = 1:1:size(candidate')
            if candidate(1, i) > min_index
                min_index_list = [min_index_list, candidate(1, i)];
            end
        end
        
        if isempty(min_index_list)
            onset_x = NaN;
        else
            min_candi = D(min_index_list);
            [~, min_in] = min(min_candi);
            min_index = min_index_list(1, min_in);
            onset_x = [min_index/2, min_index/2, min_index/2, min_index/2];
        end
    else
        onset_x = NaN;
    end
end
if (onset_x < 0) % Remove false onset (1)
    onset_x = NaN;
end

onset_y = [0, IP(M)+10];

% Draw the IP graph of sample
k = 1.5;
t = -99.5:0.5:200;

subplot(2,1,1); plot(t, epoch_dataset(1, 1801:2400), 'Color', 'k', 'DisplayName', 'EMG');
hold on;
plot (onset_x-(2000-start_point+1)/2, [-k*max(abs(epoch_dataset)), k*max(abs(epoch_dataset))], 'Color', 'r', 'DisplayName', 'Onset');
plot([0, 0], [-k*max(abs(epoch_dataset)), k*max(abs(epoch_dataset))], 'Color', 'c', 'DisplayName', 'US');
xlabel('time (ms)'); ylabel('EMG (mV)');
hold off; legend;

subplot(2,1,2); plot(t, IP, 'Color', 'k', 'DisplayName', 'IP');
hold on;
plot(t, L, 'Color', 'b', 'DisplayName', 'L');
plot (onset_x-(2000-start_point+1)/2, [0, k*max(abs(IP))], 'Color', 'r', 'DisplayName', 'Onset');
plot([0, 0], [0, k*max(abs(IP))], 'Color', 'c', 'DisplayName', 'US');
xlabel('time (ms)'); ylabel('IP');
hold off; legend;

% subplot(3,1,2); plot(t, D, 'Color', 'k', 'DisplayName', 'D');
% hold on; grid on;
% plot (onset_x-(2000-start_point+1)/2, [-k*max(abs(D)), k*max(abs(D))], 'Color', 'r', 'DisplayName', 'Onset');
% plot([0, 0], [-k*max(abs(D)), k*max(abs(D))], 'Color', 'c', 'DisplayName', 'US');
% xlabel('time (ms)'); ylabel('D');
% hold off; legend;



sgtitle(sprintf('Integrated Profile Onset Detection (Epoch : %d)', epoch_order));
