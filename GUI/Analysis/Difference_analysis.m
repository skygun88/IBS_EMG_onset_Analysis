function varargout = Difference_analysis(varargin)
% DIFFERENCE_ANALYSIS MATLAB code for Difference_analysis.fig
%      DIFFERENCE_ANALYSIS, by itself, creates a new DIFFERENCE_ANALYSIS or raises the existing
%      singleton*.
%
%      H = DIFFERENCE_ANALYSIS returns the handle to a new DIFFERENCE_ANALYSIS or the handle to
%      the existing singleton*.
%
%      DIFFERENCE_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIFFERENCE_ANALYSIS.M with the given input arguments.
%
%      DIFFERENCE_ANALYSIS('Property','Value',...) creates a new DIFFERENCE_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Difference_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Difference_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Difference_analysis

% Last Modified by GUIDE v2.5 02-Aug-2019 16:03:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Difference_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Difference_analysis_OutputFcn, ...
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


% --- Executes just before Difference_analysis is made visible.
function Difference_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Difference_analysis (see VARARGIN)

% Choose default command line output for Difference_analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global Differences; global DifferenceSDs
LE_result = evalin('base', 'LE_result'); TK_result = evalin('base', 'TK_result'); 
IP_result = evalin('base', 'IP_result'); SE_result = evalin('base', 'SE_result'); 
VS_result = evalin('base', 'VS_result');
Differences = [mean(abs(VS_result-LE_result),'omitnan'), mean(abs(VS_result-TK_result),'omitnan'), mean(abs(VS_result-IP_result),'omitnan'), mean(abs(VS_result-SE_result),'omitnan')];
DifferenceSDs = [std(abs(VS_result-LE_result),'omitnan'), std(abs(VS_result-TK_result),'omitnan'), std(abs(VS_result-IP_result),'omitnan'), std(abs(VS_result-SE_result),'omitnan')];
set(handles.DifferenceTable, 'data', [Differences; DifferenceSDs]);
% UIWAIT makes Difference_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Difference_analysis_OutputFcn(hObject, eventdata, handles) 
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

% Hint: get(hObject,'Value') returns toggle state of RadioLE


% --- Executes on button press in RadioTK.
function RadioTK_Callback(hObject, eventdata, handles)
% hObject    handle to RadioTK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioTK


% --- Executes on button press in RadioIP.
function RadioIP_Callback(hObject, eventdata, handles)
% hObject    handle to RadioIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioIP


% --- Executes on button press in RadioSE.
function RadioSE_Callback(hObject, eventdata, handles)
% hObject    handle to RadioSE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RadioSE
