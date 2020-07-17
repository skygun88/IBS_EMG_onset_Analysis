function LE_result = LE_onset_analysis(dataset, channel, filter_flag)
    processed = [];
    
    if ~exist('channel', 'var')
        channel = 3;
    end
    
    if (~exist('filter_flag', 'var') || filter_flag == 'y')
         for i = 1:size(dataset.data,3)
            x = dataset.data(channel,:,i);
            Fs = 2000;
            Fnyq = Fs/2;
            z = abs (x - mean(x));
            fco = 20;
            [b,a] = butter(2,fco*1.25/Fnyq);
            e = filtfilt(b,a,double(z));
            
            processed = [processed; e];
         end
         
    elseif (filter_flag == 'n')
       processed(1,:,:) = dataset.data(channel,:,:);
    end
    temp_processed = [];
    temp_processed(1,:,:) = processed';
    processed = temp_processed;
    clear temp_processed;
    
    results = [];
    
    for i = 1:size(processed,3)
        baseline = mean(processed(1,1901:2000,i)); % 50ms before event
        sigma = std(processed(1,1901:2000,i));
        temp0 = find(processed(1,2001:3000,i) > baseline + 3 * sigma); % find onset after event for 500ms
        temp = diff(find(processed(1,2001:3000,i) > baseline + 3 * sigma));
        
        % base + 3sigma�̻��� �ֵ����� �ε��� ���ϰ�, �³��� �ε��� ����
        % tempbaseline max��
        
        temptemp = strfind([0,temp == 1], [0,1])';
        %���̰� ���� �ֵ� ������
        onset = temp0(min(temptemp(find(strfind([temp == 1,0], [1,0]) - strfind([0,temp == 1], [0,1]) + 1 > 100))));
        %�׷��� ũ�Ⱑ 200 �̻��� �ֵ��� ����, ���� ù��
        if (length(onset) == 0)
            onset = NaN;
        end
        amplitude = max(processed(1,2001:3000,i)) - baseline;
        latency = min(find(processed(1,2001:3000,i) == max(processed(1,2001:3000,i))));
        results = [results; onset/2, amplitude, latency/2, baseline,sigma,baseline+3*sigma];
    end
    LE_result = results(:,1)';
end







