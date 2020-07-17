function varargout = Onset_Epoch(varargin)
    % ONSET_EPOCH MATLAB code for Onset_Epoch.fig
    %      ONSET_EPOCH, by itself, creates a new ONSET_EPOCH or raises the existing
    %      singleton*.
    %
    %      H = ONSET_EPOCH returns the handle to a new ONSET_EPOCH or the handle to
    %      the existing singleton*.
    %
    %      ONSET_EPOCH('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in ONSET_EPOCH.M with the given input arguments.
    %
    %      ONSET_EPOCH('Property','Value',...) creates a new ONSET_EPOCH or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before Onset_Epoch_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to Onset_Epoch_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help Onset_Epoch
    
    % Last Modified by GUIDE v2.5 02-Aug-2019 14:30:13
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @Onset_Epoch_OpeningFcn, ...
        'gui_OutputFcn',  @Onset_Epoch_OutputFcn, ...
        'gui_LayoutFcn',  [] , ...
        'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end
    
    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT
    
    
    % --- Executes just before Onset_Epoch is made visible.
function Onset_Epoch_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Onset_Epoch (see VARARGIN)
    
    % Choose default command line output for Onset_Epoch
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    cla(handles.Plot_onset, 'reset');
    global ALLEEG; global colors; global names; global results
    colors = ['r', 'y', 'b', 'm'];
    names = ["Linear", "TKEO", "IP", "SampEn"];
    
    LE_result = evalin('base', 'LE_result'); TK_result = evalin('base', 'TK_result');
    IP_result = evalin('base', 'IP_result'); SE_result = evalin('base', 'SE_result');
    VS_result = evalin('base', 'VS_result');
    
    results = [LE_result; TK_result; IP_result; SE_result; VS_result];
    
    
    n = size(results, 1)-1;
    x = zeros(n);
    epoch = str2double(get(handles.Epoch, 'String'));
    t = -49.5:0.5:300;
    MaxY = max(abs(ALLEEG.data(3, 1901:2600, epoch)))*1.1;
    y = [-MaxY, MaxY];
    
    plot(handles.Plot_onset, t, ALLEEG.data(3, 1901:2600,  epoch), 'k', 'DisplayName', 'EMG');
    hold on;
    plot(handles.Plot_onset, [results(n+1, epoch), results(n+1, epoch)], y, 'g', 'DisplayName', 'Visual');
    for i = 1:n
        x(i) = results(i, epoch);
        plot(handles.Plot_onset, [x(i), x(i)], y, '--', 'Color', colors(i), 'DisplayName', names(i));
    end
    plot([0, 0], y, 'Color', 'c', 'DisplayName', 'US');
    grid on;
    xlabel('time (ms)');
    ylabel('Voltage (mV)');
    hold off;
    legend;
    
    % UIWAIT makes Onset_Epoch wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = Onset_Epoch_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    % --- Executes on button press in PreButton.
function PreButton_Callback(hObject, eventdata, handles)
    % hObject    handle to PreButton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global ALLEEG; global colors; global names; global results
    
    CurrentEpoch = str2double(get(handles.Epoch, 'String'));
    if CurrentEpoch > 1
        set(handles.Epoch, 'String', num2str(CurrentEpoch-1));
        
        
        n = size(results, 1)-1;
        x = zeros(n);
        epoch = str2double(get(handles.Epoch, 'String'));
        t = -49.5:0.5:300;
        MaxY = max(abs(ALLEEG.data(3, 1901:2600, epoch)))*1.1;
        y = [-MaxY, MaxY];
        
        cla(handles.Plot_onset, 'reset');
        plot(handles.Plot_onset, t, ALLEEG.data(3, 1901:2600,  epoch), 'k', 'DisplayName', 'EMG');
        hold on;
        plot(handles.Plot_onset, [results(n+1, epoch), results(n+1, epoch)], y, 'g', 'DisplayName', 'Visual');
        for i = 1:n
            x(i) = results(i, epoch);
            plot(handles.Plot_onset, [x(i), x(i)], y, '--', 'Color', colors(i), 'DisplayName', names(i));
        end
        plot([0, 0], y, 'Color', 'c', 'DisplayName', 'US');
        grid on;
        xlabel('time (ms)');
        ylabel('Voltage (mV)');
        hold off;
        legend;
    end
    
function Epoch_Callback(hObject, eventdata, handles)
    % hObject    handle to Epoch (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of Epoch as text
    %        str2double(get(hObject,'String')) returns contents of Epoch as a double
    
    
    % --- Executes during object creation, after setting all properties.
function Epoch_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Epoch (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in NextButton.
function NextButton_Callback(hObject, eventdata, handles)
    % hObject    handle to NextButton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global ALLEEG; global colors; global names; global results
    CurrentEpoch = str2double(get(handles.Epoch, 'String'));
    if CurrentEpoch < 200
        set(handles.Epoch, 'String', num2str(CurrentEpoch+1));
        
        n = size(results, 1)-1;
        x = zeros(n);
        epoch = str2double(get(handles.Epoch, 'String'));
        
        t = -49.5:0.5:300;
        MaxY = max(abs(ALLEEG.data(3, 1901:2600, epoch)))*1.1;
        y = [-MaxY, MaxY];
        
        cla(handles.Plot_onset, 'reset');
        plot(handles.Plot_onset, t, ALLEEG.data(3, 1901:2600,  epoch), 'k', 'DisplayName', 'EMG');
        hold on;
        plot(handles.Plot_onset, [results(n+1, epoch), results(n+1, epoch)], y, 'g', 'DisplayName', 'Visual');
        for i = 1:n
            x(i) = results(i, epoch);
            plot(handles.Plot_onset, [x(i), x(i)], y, '--', 'Color', colors(i), 'DisplayName', names(i));
        end
        plot([0, 0], y, 'Color', 'c', 'DisplayName', 'US');
        grid on;
        xlabel('time (ms)');
        ylabel('Voltage (mV)');
        hold off;
        legend;
    end
    
    
    % --- Executes on button press in GoButton.
function GoButton_Callback(hObject, eventdata, handles)
    % hObject    handle to GoButton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global ALLEEG; global colors; global names; global results
    n = size(results, 1)-1;
    x = zeros(n);
    epoch = str2double(get(handles.Epoch, 'String'));
    
    if epoch >= 1 && epoch <= 200
        
        t = -49.5:0.5:300;
        MaxY = max(abs(ALLEEG.data(3, 1901:2600, epoch)))*1.1;
        y = [-MaxY, MaxY];
        
        cla(handles.Plot_onset, 'reset');
        plot(handles.Plot_onset, t, ALLEEG.data(3, 1901:2600,  epoch), 'k', 'DisplayName', 'EMG');
        hold on;
        plot(handles.Plot_onset, [results(n+1, epoch), results(n+1, epoch)], y, 'g', 'DisplayName', 'Visual');
        for i = 1:n
            x(i) = results(i, epoch);
            plot(handles.Plot_onset, [x(i), x(i)], y, '--', 'Color', colors(i), 'DisplayName', names(i));
        end
        plot([0, 0], y, 'Color', 'c', 'DisplayName', 'US');
        grid on;
        xlabel('time (ms)');
        ylabel('Voltage (mV)');
        hold off;
        legend;
    end
    
    
    % --- Executes on button press in ResetButton.
function ResetButton_Callback(hObject, eventdata, handles)
    % hObject    handle to ResetButton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global ALLEEG; global colors; global names; global results
    n = size(results, 1)-1;
    x = zeros(n);
    epoch = 1;
    set(handles.Epoch, 'String', '1');
    
    t = -49.5:0.5:300;
    MaxY = max(abs(ALLEEG.data(3, 1901:2600, epoch)))*1.1;
    y = [-MaxY, MaxY];
    
    cla(handles.Plot_onset, 'reset');
    plot(handles.Plot_onset, t, ALLEEG.data(3, 1901:2600,  epoch), 'k', 'DisplayName', 'EMG');
    hold on;
    plot(handles.Plot_onset, [results(n+1, epoch), results(n+1, epoch)], y, 'g', 'DisplayName', 'Visual');
    for i = 1:n
        x(i) = results(i, epoch);
        plot(handles.Plot_onset, [x(i), x(i)], y, '--', 'Color', colors(i), 'DisplayName', names(i));
    end
    plot([0, 0], y, 'Color', 'c', 'DisplayName', 'US');
    grid on;
    xlabel('time (ms)');
    ylabel('Voltage (mV)');
    hold off;
    legend;
