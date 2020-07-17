function draw_bar_graph(datas, names, SDs, type)
    bar(names, datas);
    hold on;
    if type == "Difference"
        lower = zeros(size(datas));
    else
        lower = SDs;
    end
    data_er = errorbar(names, datas, lower, SDs);
    data_er.Color = [0,0,0];
    data_er.LineStyle = 'none';
    ylabel(sprintf('%s (ms)', type));
    hold off;
end