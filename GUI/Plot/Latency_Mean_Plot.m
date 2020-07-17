function varargout = Latency_Mean_Plot(varargin)
% LATENCY_MEAN_PLOT MATLAB code for Latency_Mean_Plot.fig
%      LATENCY_MEAN_PLOT, by itself, creates a new LATENCY_MEAN_PLOT or raises the existing
%      singleton*.
%
%      H = LATENCY_MEAN_PLOT returns the handle to a new LATENCY_MEAN_PLOT or the handle to
%      the existing singleton*.
%
%      LATENCY_MEAN_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LATENCY_MEAN_PLOT.M with the given input arguments.
%
%      LATENCY_MEAN_PLOT('Property','Value',...) creates a new LATENCY_MEAN_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Latency_Mean_Plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Latency_Mean_Plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Latency_Mean_Plot

% Last Modified by GUIDE v2.5 31-Jul-2019 13:24:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Latency_Mean_Plot_OpeningFcn, ...
                   'gui_OutputFcn',  @Latency_Mean_Plot_OutputFcn, ...
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


% --- Executes just before Latency_Mean_Plot is made visible.
function Latency_Mean_Plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Latency_Mean_Plot (see VARARGIN)

% Choose default command line output for Latency_Mean_Plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global MeanNames; global Means; global MeanSDs; global LatencyNames; global Latencys; global LatencySDs
MeanNames = ["Linear","TKEO","IP", "SampEn", "Visual"];
Means = [evalin('base', 'LE_mean'), evalin('base', 'TK_mean'), evalin('base', 'IP_mean'), evalin('base', 'SE_mean'), evalin('base', 'VS_mean')];
MeanSDs = [evalin('base', 'LE_SD'), evalin('base', 'TK_SD'), evalin('base', 'IP_SD'), evalin('base', 'SE_SD'), evalin('base', 'VS_SD')];
LatencyNames = ["Linear","TKEO","IP", "SampEn"];
LE_result = evalin('base', 'LE_result'); TK_result = evalin('base', 'TK_result'); 
IP_result = evalin('base', 'IP_result'); SE_result = evalin('base', 'SE_result'); 
VS_result = evalin('base', 'VS_result');
Latencys = [mean(abs(VS_result-LE_result),'omitnan'), mean(abs(VS_result-TK_result),'omitnan'), mean(abs(VS_result-IP_result),'omitnan'), mean(abs(VS_result-SE_result),'omitnan')];
LatencySDs = [std(abs(VS_result-LE_result),'omitnan'), std(abs(VS_result-TK_result),'omitnan'), std(abs(VS_result-IP_result),'omitnan'), std(abs(VS_result-SE_result),'omitnan')];

% UIWAIT makes Latency_Mean_Plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Latency_Mean_Plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in LatencyShowButton.
function LatencyShowButton_Callback(hObject, eventdata, handles)
% hObject    handle to LatencyShowButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global LatencyNames; global Latencys; global LatencySDs;
LE_on = get(handles.LatencyLE, 'Value');
TK_on = get(handles.LatencyTK, 'Value');
IP_on = get(handles.LatencyIP, 'Value');
SE_on = get(handles.LatencySE, 'Value');
LatencyCheckbox_on = [LE_on, TK_on, IP_on, SE_on];
if sum(LatencyCheckbox_on) > 0
    names = []; datas = []; SDs = [];
    for i = 1:1:size(LatencyCheckbox_on')
        if LatencyCheckbox_on(1,i) == 1
            names = [names, LatencyNames(1, i)];
            datas = [datas, Latencys(1, i)];
            SDs = [SDs, LatencySDs(1, i)];
        end
    end
    name_catego = categorical(cellstr(names));
    
    cla(handles.Plot_latency, 'reset');
    bar(handles.Plot_latency, name_catego, datas);
    hold(handles.Plot_latency, 'on'); grid(handles.Plot_latency, 'on');
    
    data_er = errorbar(handles.Plot_latency, name_catego, datas, zeros(size(datas)), SDs);
    data_er.Color = [0,0,0]; data_er.LineStyle = 'none';
    ylabel(handles.Plot_latency, 'Latency (ms)');
end


% --- Executes on button press in MeanShowButton.
function MeanShowButton_Callback(hObject, eventdata, handles)
% hObject    handle to MeanShowButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MeanNames; global Means; global MeanSDs;
LE_on = get(handles.MeanLE, 'Value');
TK_on = get(handles.MeanTK, 'Value');
IP_on = get(handles.MeanIP, 'Value');
SE_on = get(handles.MeanSE, 'Value');
VS_on = get(handles.MeanVS, 'Value');
MeanCheckbox_on = [LE_on, TK_on, IP_on, SE_on, VS_on];
if sum(MeanCheckbox_on) > 0
    names = []; datas = []; SDs = [];
    for i = 1:1:size(MeanCheckbox_on')
        if MeanCheckbox_on(1,i) == 1
            names = [names, MeanNames(1, i)];
            datas = [datas, Means(1, i)];
            SDs = [SDs, MeanSDs(1, i)];
        end
    end
    name_catego = categorical(cellstr(names));
    
    cla(handles.Plot_mean, 'reset');
    bar(handles.Plot_mean, name_catego, datas);
    hold(handles.Plot_mean, 'on'); grid(handles.Plot_mean, 'on');
    
    data_er = errorbar(handles.Plot_mean, name_catego, datas, SDs, SDs);
    data_er.Color = [0,0,0]; data_er.LineStyle = 'none';
    ylabel(handles.Plot_mean, 'Mean (ms)');
end

% --- Executes on button press in LatencyResetButton.
function LatencyResetButton_Callback(hObject, eventdata, handles)
% hObject    handle to LatencyResetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.Plot_latency, 'reset');

% --- Executes on button press in MeanResetButton.
function MeanResetButton_Callback(hObject, eventdata, handles)
% hObject    handle to MeanResetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.Plot_mean, 'reset');

% --- Executes on button press in MeanLE.
function MeanLE_Callback(hObject, eventdata, handles)
% hObject    handle to MeanLE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanLE


% --- Executes on button press in MeanTK.
function MeanTK_Callback(hObject, eventdata, handles)
% hObject    handle to MeanTK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanTK


% --- Executes on button press in MeanIP.
function MeanIP_Callback(hObject, eventdata, handles)
% hObject    handle to MeanIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanIP


% --- Executes on button press in MeanSE.
function MeanSE_Callback(hObject, eventdata, handles)
% hObject    handle to MeanSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanSE


% --- Executes on button press in MeanVS.
function MeanVS_Callback(hObject, eventdata, handles)
% hObject    handle to MeanVS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanVS


% --- Executes on button press in LatencyLE.
function LatencyLE_Callback(hObject, eventdata, handles)
% hObject    handle to LatencyLE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LatencyLE


% --- Executes on button press in LatencyTK.
function LatencyTK_Callback(hObject, eventdata, handles)
% hObject    handle to LatencyTK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LatencyTK


% --- Executes on button press in LatencyIP.
function LatencyIP_Callback(hObject, eventdata, handles)
% hObject    handle to LatencyIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LatencyIP


% --- Executes on button press in LatencySE.
function LatencySE_Callback(hObject, eventdata, handles)
% hObject    handle to LatencySE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LatencySE
