function marking_onset(dataset, results, names, epoch, channel)
    if ~exist('channel', 'var')
        channel = 3;
    end
    t = [-49.5:0.5:200];
    
    y = [-0.3, 0.3];
    
    n = size(results, 1)-1;
    
    x = zeros(n);
    for i = 1:n
        subplot(n, 1, i); plot(t, dataset.data(channel, 1901:2400,  epoch), 'k');
        hold on;
        x(i) = results(i, epoch);
        plot([x(i), x(i)], y, '--', 'Color', 'r');
        plot([results(n+1, epoch), results(n+1, epoch)], y, 'g');
        hold off;
        legend('EMG', names(i), names(n+1));
        ylabel('Voltage (mV)');
        grid on;

        if i == n
            xlabel('time (ms)');
        else
            set(gca,'xtick',[]);
            %set(gca,'xcolor',[1 1 1])
        end
    end
    sgtitle(sprintf('Onset Comparision (epoch: %d)', epoch));
end