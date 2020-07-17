function varargout = Mean_analysis(varargin)
% MEAN_ANALYSIS MATLAB code for Mean_analysis.fig
%      MEAN_ANALYSIS, by itself, creates a new MEAN_ANALYSIS or raises the existing
%      singleton*.
%
%      H = MEAN_ANALYSIS returns the handle to a new MEAN_ANALYSIS or the handle to
%      the existing singleton*.
%
%      MEAN_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEAN_ANALYSIS.M with the given input arguments.
%
%      MEAN_ANALYSIS('Property','Value',...) creates a new MEAN_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mean_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mean_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mean_analysis

% Last Modified by GUIDE v2.5 02-Aug-2019 10:01:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mean_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Mean_analysis_OutputFcn, ...
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


% --- Executes just before Mean_analysis is made visible.
function Mean_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mean_analysis (see VARARGIN)

% Choose default command line output for Mean_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global Means; global MeanSDs;
Means = [evalin('base', 'LE_mean'), evalin('base', 'TK_mean'), evalin('base', 'IP_mean'), evalin('base', 'SE_mean'), evalin('base', 'VS_mean')];
MeanSDs = [evalin('base', 'LE_SD'), evalin('base', 'TK_SD'), evalin('base', 'IP_SD'), evalin('base', 'SE_SD'), evalin('base', 'VS_SD')];
set(handles.MeanTable, 'data', [Means; MeanSDs]);
% UIWAIT makes Mean_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mean_analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ShowButton.
function ShowButton_Callback(hObject, eventdata, handles)
% hObject    handle to ShowButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.RadioLE, 'value')
    LE_result = evalin('base', 'LE_result'); 
    
elseif get(handles.RadioTK, 'value')
    TK_result = evalin('base', 'TK_result'); 

elseif get(handles.RadioIP, 'value')
    IP_result = evalin('base', 'IP_result'); 
elseif get(handles.RadioSE, 'value')
    SE_result = evalin('base', 'SE_result'); 

elseif get(handles.RadioVS, 'value')
    VS_result = evalin('base', 'VS_result');
end

% --- Executes on button press in ResetButton.
function ResetButton_Callback(hObject, eventdata, handles)
% hObject    handle to ResetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in RadioLE.
function RadioLE_Callback(hObject, eventdata, handles)
% hObject    handle to RadioLE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.RadioLE, 'value')
    set(handles.RadioTK, 'value', 0);
    set(handles.RadioIP, 'value', 0);
    set(handles.RadioSE, 'value', 0);
    set(handles.RadioVS, 'value', 0);
end
% Hint: get(hObject,'Value') returns toggle state of RadioLE


% --- Executes on button press in RadioTK.
function RadioTK_Callback(hObject, eventdata, handles)
% hObject    handle to RadioTK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.RadioTK, 'value')
    set(handles.RadioLE, 'value', 0);
    set(handles.RadioIP, 'value', 0);
    set(handles.RadioSE, 'value', 0);
    set(handles.RadioVS, 'value', 0);
end
% Hint: get(hObject,'Value') returns toggle state of RadioTK


% --- Executes on button press in RadioIP.
function RadioIP_Callback(hObject, eventdata, handles)
% hObject    handle to RadioIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.RadioIP, 'value')
    set(handles.RadioTK, 'value', 0);
    set(handles.RadioLE, 'value', 0);
    set(handles.RadioSE, 'value', 0);
    set(handles.RadioVS, 'value', 0);
end
% Hint: get(hObject,'Value') returns toggle state of RadioIP


% --- Executes on button press in RadioSE.
function RadioSE_Callback(hObject, eventdata, handles)
% hObject    handle to RadioSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.RadioSE, 'value')
    set(handles.RadioTK, 'value', 0);
    set(handles.RadioIP, 'value', 0);
    set(handles.RadioLE, 'value', 0);
    set(handles.RadioVS, 'value', 0);
end
% Hint: get(hObject,'Value') returns toggle state of RadioSE


% --- Executes on button press in RadioVS.
function RadioVS_Callback(hObject, eventdata, handles)
% hObject    handle to RadioVS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.RadioVS, 'value')
    set(handles.RadioTK, 'value', 0);
    set(handles.RadioIP, 'value', 0);
    set(handles.RadioSE, 'value', 0);
    set(handles.RadioLE, 'value', 0);
end
% Hint: get(hObject,'Value') returns toggle state of RadioVS
