function [latency, latency_SD] = find_latency(data, visual_onset)
    latency = mean(abs(data - visual_onset), 'omitnan'); % mean(|d1 - d2|)
    latency_SD = std(abs(data - visual_onset), 'omitnan');
end