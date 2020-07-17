% Step1: Prepare the Onset list of each method
IP_result = IP_onset_analysis_ori(ALLEEG); % Onset list made by Integrated Profile analysis  (dataset, channel)
LE_result = LE_onset_analysis(ALLEEG); % Onset list made by Linear Envelope analysis 
TK_result = TKEO_onset_analysis(ALLEEG);
SE_result = SE_onset_analysis(ALLEEG);
% ----------------------------------------------------------------- %

% Step2: Caculate mean & latency of  any(linear, TKEO, SampEn, IP) analysis and visual onset
mean_IP = mean(IP_result, 'omitnan');
mean_LE = mean(LE_result, 'omitnan');
mean_TK = mean(TK_result, 'omitnan');
mean_SE = mean(SE_result, 'omitnan');

IP_SD = std(IP_result, 'omitnan');
LE_SD = std(LE_result, 'omitnan');
TK_SD = std(TK_result, 'omitnan');
SE_SD = std(SE_result, 'omitnan');
% ----------------------------------------------------------------- %

% Step3: Count the number of onset of overall data
IP_onset_count = 200 - sum(isnan(IP_result)); % Integrated Profile
LE_onset_count = 200 - sum(isnan(LE_result)); % Linear Envelope
TK_onset_count = 200 - sum(isnan(TK_result)); % TKEO Onset
SE_onset_count = 200 - sum(isnan(SE_result)); % SampleEntropy Onset

% Step4: Draw the graph
draw_one_method(IP_result, 'IP');
%draw_one_method(LE_result, 'LE');
%draw_one_method(TK_result, 'TKEO');
%draw_one_method(SE_result, 'SE');
%draw_two_method(IP_result, 'IP', LE_result, 'LE'); % IP vs Linear Envelope
%draw_two_method(IP_result, 'IP', TK_result, 'TKEO'); % IP vs TKEO
%draw_two_method(IP_result, 'IP', SE_result, 'SE'); % IP vs Sample Entropy
% ----------------------------------------------------------------- %