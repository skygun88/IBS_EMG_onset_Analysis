function MarkingOnset_merged(dataset, results, names, epoch, channel)
    if ~exist('channel', 'var')
        channel = 3;
    end
    t = -99.5:0.5:400;
    y = [-0.3, 0.3];
    n = size(results, 1)-1;
    x = zeros(n);
    colors = ['m', 'b', 'r', 'g'];
    
    plot(t, dataset.data(channel, 1801:2800,  epoch), 'k', 'DisplayName', 'EMG');
    hold on;
    plot([results(n+1, epoch), results(n+1, epoch)], y, 'Color',[0.25, 0.25, 0.25], 'DisplayName', 'Visual', 'LineWidth', 1.5);
    
    for i = 1:n
        x(i) = results(i, epoch);
        plot([x(i), x(i)], y, 'Color', colors(i), 'DisplayName', names(i), 'LineWidth', 1.5);
        
    end
    plot([0, 0], y, 'Color', 'k', 'DisplayName', 'US', 'LineWidth', 1.5);
    xlabel('time (ms)');
    ylabel('Voltage (mV)');
    hold off;
    
    legend;
    title(sprintf('Onset Comparision (epoch: %d)', epoch));
end