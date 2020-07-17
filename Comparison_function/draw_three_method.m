function draw_three_method(d1, d1_name, d2, d2_name, d3, d3_name)
    % Caculate difference
    d1_mean = mean(d1, 'omitnan');
    d2_mean = mean(d2, 'omitnan');
    d3_mean = mean(d3, 'omitnan');
    
    subplot(2,2,1); % Plot 1~50 epoch
    plot(1:50, d1(1, 1:50), '-o', 'MarkerSize', 4);
    hold on;
    plot(1:50, d2(1, 1:50), '-o', 'MarkerSize', 4);
    plot(1:50, d3(1, 1:50), '-o', 'MarkerSize', 4);
    hold off;
    grid on;
    legend(d1_name, d2_name, d3_name);
    xlabel('epoch');
    ylabel('onset latency (ms)');
    
    subplot(2,2,2); % Plot 51~100 epoch
    plot(51:100, d1(1, 51:100), '-o', 'MarkerSize', 4);
    hold on;
   plot(51:100, d2(1, 51:100), '-o', 'MarkerSize', 4);
    plot(51:100, d3(1, 51:100), '-o', 'MarkerSize', 4);
    hold off;
    grid on;
    legend(d1_name, d2_name, d3_name);
    xlabel('epoch');
    ylabel('onset latency (ms)');
    
    subplot(2,2,3); % Plot 101~150 epoch
    plot(101:150, d1(1, 101:150), '-o', 'MarkerSize', 4);
    hold on;
    plot(101:150, d2(1, 101:150), '-o', 'MarkerSize', 4);
    plot(101:150, d3(1, 101:150), '-o', 'MarkerSize', 4);
    hold off;
    grid on;
    legend(d1_name, d2_name, d3_name);
    xlabel('epoch');
    ylabel('onset latency (ms)');
    
    subplot(2,2,4); % Plot 151~200 epoch
    plot(151:200, d1(1, 151:200), '-o', 'MarkerSize', 4);
    hold on;
    plot(151:200, d2(1, 151:200), '-o', 'MarkerSize', 4);
    plot(151:200, d3(1, 151:200), '-o', 'MarkerSize', 4);
    hold off;
    grid on;
    legend(d1_name, d2_name, d3_name);
    xlabel('epoch');
    ylabel('onset latency (ms)');
    
    sgtitle(sprintf('%s vs %s vs %s - %s : %0.5f ms, %s: %f ms, %s: %f ms', d1_name, d2_name, d3_name, d1_name, d1_mean, d2_name, d2_mean, d3_name, d3_mean));
end