function varargout = Onset_analysis(varargin)
    % ONSET_ANALYSIS MATLAB code for Onset_analysis.fig
    %      ONSET_ANALYSIS, by itself, creates a new ONSET_ANALYSIS or raises the existing
    %      singleton*.
    %
    %      H = ONSET_ANALYSIS returns the handle to a new ONSET_ANALYSIS or the handle to
    %      the existing singleton*.
    %
    %      ONSET_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in ONSET_ANALYSIS.M with the given input arguments.
    %
    %      ONSET_ANALYSIS('Property','Value',...) creates a new ONSET_ANALYSIS or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before Onset_analysis_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to Onset_analysis_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help Onset_analysis
    
    % Last Modified by GUIDE v2.5 30-Jul-2019 16:13:53
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @Onset_analysis_OpeningFcn, ...
        'gui_OutputFcn',  @Onset_analysis_OutputFcn, ...
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
    
    
    % --- Executes just before Onset_analysis is made visible.
function Onset_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Onset_analysis (see VARARGIN)
    
    % Choose default command line output for Onset_analysis
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes Onset_analysis wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = Onset_analysis_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    % --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
    % hObject    handle to File (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Load_Callback(hObject, eventdata, handles)
    % hObject    handle to Load (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Clear_Callback(hObject, eventdata, handles)
    % hObject    handle to Clear (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Detection_Callback(hObject, eventdata, handles)
    % hObject    handle to Detection (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Analysis_Callback(hObject, eventdata, handles)
    % hObject    handle to Analysis (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
    % hObject    handle to Untitled_13 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Plot_Overall_onset_Callback(hObject, eventdata, handles)
    % hObject    handle to Plot_Overall_onset (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Plot_Latency_Callback(hObject, eventdata, handles)
    % hObject    handle to Plot_Latency (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Onset_epoch_m_Callback(hObject, eventdata, handles)
    % hObject    handle to Onset_epoch_m (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Onset_epoch_s_Callback(hObject, eventdata, handles)
    % hObject    handle to Onset_epoch_s (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Result_dataset_Callback(hObject, eventdata, handles)
    % hObject    handle to Result_dataset (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Compare_means_SD_Callback(hObject, eventdata, handles)
    % hObject    handle to Compare_means_SD (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Compare_latency_Callback(hObject, eventdata, handles)
    % hObject    handle to Compare_latency (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
    % hObject    handle to Untitled_2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function LE_Callback(hObject, eventdata, handles)
    % hObject    handle to LE (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function TK_Callback(hObject, eventdata, handles)
    % hObject    handle to TK (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function IP_Callback(hObject, eventdata, handles)
    % hObject    handle to IP (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function SE_Callback(hObject, eventdata, handles)
    % hObject    handle to SE (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function VS_Callback(hObject, eventdata, handles)
    % hObject    handle to VS (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --- Executes on button press in Detection_trigger_button.
function Detection_trigger_button_Callback(hObject, eventdata, handles)
    % hObject    handle to Detection_trigger_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    set(handles.Status_comment, 'String', 'Aalysis ongoing');
    Detection_contents = cellstr(get(handles.Detection_listbox, 'String'));
    Detection_temp = Detection_contents{get(handles.Detection_listbox, 'Value')};
    global ALLEEG;
    if strcmp(Detection_temp, 'ALL')
        IP_result = IP_onset_analysis_ori(ALLEEG); assignin('base', 'IP_result' ,IP_result); 
        LE_result = LE_onset_analysis(ALLEEG); assignin('base', 'LE_result', LE_result);
        TK_result = TKEO_onset_analysis(ALLEEG); assignin('base', 'TK_result', TK_result);
        SE_result = SE_onset_analysis(ALLEEG); assignin('base', 'SE_result', SE_result);
        
        % Onset list made by Visual scoring analysis
        file_name = strrep(ALLEEG.filename, '.set', '_VO.CSV');
        VS_result = readmatrix(file_name)'; assignin('base', 'VS_result', VS_result);
        
        
        assignin('base', 'IP_mean', mean(IP_result, 'omitnan')); assignin('base', 'IP_SD', std(IP_result, 'omitnan')); 
        assignin('base', 'LE_mean', mean(LE_result, 'omitnan')); assignin('base', 'LE_SD', std(LE_result, 'omitnan')); 
        assignin('base', 'TK_mean', mean(TK_result, 'omitnan')); assignin('base', 'TK_SD', std(TK_result, 'omitnan')); 
        assignin('base', 'SE_mean', mean(SE_result, 'omitnan')); assignin('base', 'SE_SD', std(SE_result, 'omitnan')); 
        assignin('base', 'VS_mean', mean(VS_result, 'omitnan')); assignin('base', 'VS_SD', std(VS_result, 'omitnan')); 
        handles.Status_comment.String = '-> Analyzed by All analysis methods';
        
    elseif strcmp(Detection_temp, 'Linear Envelope')
        LE_result = LE_onset_analysis(ALLEEG); assignin('base', 'LE_result', LE_result);
        assignin('base', 'LE_mean', mean(LE_result, 'omitnan')); assignin('base', 'LE_SD', std(LE_result, 'omitnan')); 
        handles.Status_comment.String = '-> Analyzed by Linear Envelope';
        
        
    elseif strcmp(Detection_temp, 'TKEO')
        TK_result = TKEO_onset_analysis(ALLEEG); assignin('base', 'TK_result', TK_result);
        assignin('base', 'TK_mean', mean(TK_result, 'omitnan')); assignin('base', 'TK_SD', std(TK_result, 'omitnan')); 
        handles.Status_comment.String = '-> Analyzed by Teager-Kaiser Energy Operator';
        
    elseif strcmp(Detection_temp, 'IP')
        IP_result = IP_onset_analysis_ori(ALLEEG); assignin('base', 'IP_result' ,IP_result); 
        assignin('base', 'IP_mean', mean(IP_result, 'omitnan')); assignin('base', 'IP_SD', std(IP_result, 'omitnan')); 
        handles.Status_comment.String = '-> Analyzed by Integrated Profile';
        
    elseif strcmp(Detection_temp, 'Sample Entropy')
        SE_result = SE_onset_analysis(ALLEEG); assignin('base', 'SE_result', SE_result);
        assignin('base', 'SE_mean', mean(SE_result, 'omitnan')); assignin('base', 'SE_SD', std(SE_result, 'omitnan'));  
        handles.Status_comment.String = '-> Analyzed by Sample Entropty';
        
    elseif strcmp(Detection_temp, 'Visual')
        file_name = strrep(ALLEEG.filename, '.set', '_VO.CSV');
        VS_result = readmatrix(file_name)'; assignin('base', 'VS_result', VS_result);
        assignin('base', 'VS_mean', mean(VS_result, 'omitnan')); assignin('base', 'VS_SD', std(VS_result, 'omitnan')); 
        handles.Status_comment.String = '-> Analyzed by Visual Scoring';
    end
    
    % --- Executes on button press in Reset_Button.
function Reset_Button_Callback(hObject, eventdata, handles)
    % hObject    handle to Reset_Button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    handles.Status_comment.String = '-> Analysis Ongoing';
    assignin('base', 'IP_result', []);
    assignin('base', 'LE_result', []);
    assignin('base', 'TK_result', []);
    assignin('base', 'SE_result', []);
    assignin('base', 'VS_result', []);
    handles.Status_comment.String = '-> Reset all data';
    
    
    
    
    % --- Executes on selection change in Detection_listbox.
function Detection_listbox_Callback(hObject, eventdata, handles)
    % hObject    handle to Detection_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: contents = cellstr(get(hObject,'String')) returns Detection_listbox contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from Detection_listbox
    
    
    % --- Executes during object creation, after setting all properties.
function Detection_listbox_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Detection_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: listbox controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on selection change in Analysis_listbox.
function Analysis_listbox_Callback(hObject, eventdata, handles)
    % hObject    handle to Analysis_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: contents = cellstr(get(hObject,'String')) returns Analysis_listbox contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from Analysis_listbox
    
    
    % --- Executes during object creation, after setting all properties.
function Analysis_listbox_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Analysis_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: listbox controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in Analysis_trigger_button.
function Analysis_trigger_button_Callback(hObject, eventdata, handles)
    % hObject    handle to Analysis_trigger_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    Plot_contents = cellstr(get(handles.Analysis_listbox, 'String'));
    Plot_temp = Plot_contents{get(handles.Analysis_listbox, 'Value')};
    
    if strcmp(Plot_temp, 'Mean & SD')
        Mean_analysis;
    elseif strcmp(Plot_temp, 'Difference')
        Difference_analysis;
    elseif strcmp(Plot_temp, 'Onset Count')
        
    end
    
    % --- Executes on selection change in Plot_listbox.
function Plot_listbox_Callback(hObject, eventdata, handles)
    % hObject    handle to Plot_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: contents = cellstr(get(hObject,'String')) returns Plot_listbox contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from Plot_listbox
    
    
    % --- Executes during object creation, after setting all properties.
function Plot_listbox_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to Plot_listbox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: listbox controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in Plot_trigger_button.
function Plot_trigger_button_Callback(hObject, eventdata, handles)
    % hObject    handle to Plot_trigger_button (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    Plot_contents = cellstr(get(handles.Plot_listbox, 'String'));
    Plot_temp = Plot_contents{get(handles.Plot_listbox, 'Value')};
    
    if strcmp(Plot_temp, 'Overall Onset')
        Overall_Onset_Plot;
    elseif strcmp(Plot_temp, 'Latency & Mean')
        Latency_Mean_Plot;
    elseif strcmp(Plot_temp, 'Epoch (Merged)')
        Onset_Epoch;
    elseif strcmp(Plot_temp, 'Epoch (Splited)')
        Onset_Epoch;
    end
    
    % --------------------------------------------------------------------
function Onset_count_Callback(hObject, eventdata, handles)
    % hObject    handle to Onset_count (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
