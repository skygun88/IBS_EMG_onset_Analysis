# IBS_EMG_onset_Analysis
“IBS EMG Onset Analysis” is the toolbox that detects event-based EMG onset using “EEGLAB” toolbox

This toolbox provides 4 algorithm to detect the EMG onset. 

1. Linear Envelope algorithm
2. TKEO algorithm
3. Sample Entropy algorithm
4. Integrated Profile(IP) algorithm

Each algorithm shows different performance depending on the SNR of the dataset. If datasets are clear, linear envelope and TKEO algorithm is recommended because they can detect well in clear dataset and they can detect onset fast. On the other hand, if the dataset was noisy, sample entropy	and integrated profile	algorithm will be a good choice. Although these methods are pretty slower than above two methods, they can detect the onset precisely when datasets are noisy.

This toolbox  utilize the EEGLAB toolbox to load the multi-epochs dataset. Therefore, you need to load only one dataset file through EEGLAB and this code detect the component of EEGLAB loaded data, “ALLEEG”.

Usual instruction to utilize the toolbox is written on “example.m” file. It contain how to detect the Event-based EEG onset through each algorithm	and calculate some statistics such as mean and count of the onsets. In addition, this toolbox provides the function to produce the result graph of onset detection.

Moreover, we developed the GUI-based onset analysis program but it is incomplete code. If you want to utilize it, you can freely reuse the GUI code.
