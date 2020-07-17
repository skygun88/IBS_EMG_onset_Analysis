function varargout = Overall_Onset_Plot(varargin)
% OVERALL_ONSET_PLOT MATLAB code for Overall_Onset_Plot.fig
%      OVERALL_ONSET_PLOT, by itself, creates a new OVERALL_ONSET_PLOT or raises the existing
%      singleton*.
%
%      H = OVERALL_ONSET_PLOT returns the handle to a new OVERALL_ONSET_PLOT or the handle to
%      the existing singleton*.
%
%      OVERALL_ONSET_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OVERALL_ONSET_PLOT.M with the given input arguments.
%
%      OVERALL_ONSET_PLOT('Property','Value',...) creates a new OVERALL_ONSET_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Overall_Onset_Plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Overall_Onset_Plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Overall_Onset_Plot

% Last Modified by GUIDE v2.5 30-Jul-2019 18:28:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Overall_Onset_Plot_OpeningFcn, ...
                   'gui_OutputFcn',  @Overall_Onset_Plot_OutputFcn, ...
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


% --- Executes just before Overall_Onset_Plot is made visible.
function Overall_Onset_Plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Overall_Onset_Plot (see VARARGIN)

% Choose default command line output for Overall_Onset_Plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Overall_Onset_Plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Overall_Onset_Plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LE_check.
function LE_check_Callback(hObject, eventdata, handles)
% hObject    handle to LE_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LE_check



% --- Executes on button press in TK_check.
function TK_check_Callback(hObject, eventdata, handles)
% hObject    handle to TK_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.TK_check, 'Value')
    
end
% Hint: get(hObject,'Value') returns toggle state of TK_check


% --- Executes on button press in IP_check.
function IP_check_Callback(hObject, eventdata, handles)
% hObject    handle to IP_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.IP_check, 'Value')
    
end
% Hint: get(hObject,'Value') returns toggle state of IP_check


% --- Executes on button press in SE_check.
function SE_check_Callback(hObject, eventdata, handles)
% hObject    handle to SE_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.SE_check, 'Value')
    
end
% Hint: get(hObject,'Value') returns toggle state of SE_check


% --- Executes on button press in VS_check.
function VS_check_Callback(hObject, eventdata, handles)
% hObject    handle to VS_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(handles.VS_check, 'Value')
    
end
% Hint: get(hObject,'Value') returns toggle state of VS_check


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in LE_button.
function LE_button_Callback(hObject, eventdata, handles)
% hObject    handle to LE_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LE_result = evalin('base','LE_result');
plot(handles.Plot_1, 1:50, LE_result(1, 1:50), '-o', 'MarkerSize', 4);
plot(handles.Plot_2, 1:50, LE_result(1, 51:100), '-o', 'MarkerSize', 4);
plot(handles.Plot_3, 101:150, LE_result(1, 101:150), '-o', 'MarkerSize', 4);
plot(handles.Plot_4, 151:200, LE_result(1, 151:200), '-o', 'MarkerSize', 4);
xlabel(handles.Plot_1, 'epoch'); ylabel(handles.Plot_1, 'Onset (ms)');
xlabel(handles.Plot_2, 'epoch'); ylabel(handles.Plot_2, 'Onset (ms)');
xlabel(handles.Plot_3, 'epoch'); ylabel(handles.Plot_3, 'Onset (ms)');
xlabel(handles.Plot_4, 'epoch'); ylabel(handles.Plot_4, 'Onset (ms)');
hold(handles.Plot_1, 'on'); hold(handles.Plot_2, 'on'); hold(handles.Plot_3, 'on'); hold(handles.Plot_3, 'on'); 
grid(handles.Plot_1, 'on'); grid(handles.Plot_2, 'on'); grid(handles.Plot_3, 'on'); grid(handles.Plot_4, 'on');


% --- Executes on button press in TK_button.
function TK_button_Callback(hObject, eventdata, handles)
% hObject    handle to TK_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TK_result = evalin('base','TK_result');
plot(handles.Plot_1, 1:50, TK_result(1, 1:50), '-o', 'MarkerSize', 4);
plot(handles.Plot_2, 1:50, TK_result(1, 51:100), '-o', 'MarkerSize', 4);
plot(handles.Plot_3, 101:150, TK_result(1, 101:150), '-o', 'MarkerSize', 4);
plot(handles.Plot_4, 151:200, TK_result(1, 151:200), '-o', 'MarkerSize', 4);
xlabel(handles.Plot_1, 'epoch'); ylabel(handles.Plot_1, 'Onset (ms)');
xlabel(handles.Plot_2, 'epoch'); ylabel(handles.Plot_2, 'Onset (ms)');
xlabel(handles.Plot_3, 'epoch'); ylabel(handles.Plot_3, 'Onset (ms)');
xlabel(handles.Plot_4, 'epoch'); ylabel(handles.Plot_4, 'Onset (ms)');
hold(handles.Plot_1, 'on'); hold(handles.Plot_2, 'on'); hold(handles.Plot_3, 'on'); hold(handles.Plot_4, 'on'); 
grid(handles.Plot_1, 'on'); grid(handles.Plot_2, 'on'); grid(handles.Plot_3, 'on'); grid(handles.Plot_4, 'on');

% --- Executes on button press in IP_button.
function IP_button_Callback(hObject, eventdata, handles)
% hObject    handle to IP_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IP_result = evalin('base','IP_result');
plot(handles.Plot_1, 1:50, IP_result(1, 1:50), '-o', 'MarkerSize', 4);
plot(handles.Plot_2, 1:50, IP_result(1, 51:100), '-o', 'MarkerSize', 4);
plot(handles.Plot_3, 101:150, IP_result(1, 101:150), '-o', 'MarkerSize', 4);
plot(handles.Plot_4, 151:200, IP_result(1, 151:200), '-o', 'MarkerSize', 4);
xlabel(handles.Plot_1, 'epoch'); ylabel(handles.Plot_1, 'Onset (ms)');
xlabel(handles.Plot_2, 'epoch'); ylabel(handles.Plot_2, 'Onset (ms)');
xlabel(handles.Plot_3, 'epoch'); ylabel(handles.Plot_3, 'Onset (ms)');
xlabel(handles.Plot_4, 'epoch'); ylabel(handles.Plot_4, 'Onset (ms)');
hold(handles.Plot_1, 'on'); hold(handles.Plot_2, 'on'); hold(handles.Plot_3, 'on'); hold(handles.Plot_4, 'on'); 
grid(handles.Plot_1, 'on'); grid(handles.Plot_2, 'on'); grid(handles.Plot_3, 'on'); grid(handles.Plot_4, 'on');

% --- Executes on button press in SE_button.
function SE_button_Callback(hObject, eventdata, handles)
% hObject    handle to SE_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SE_result = evalin('base','SE_result');
plot(handles.Plot_1, 1:50, SE_result(1, 1:50), '-o', 'MarkerSize', 4);
plot(handles.Plot_2, 1:50, SE_result(1, 51:100), '-o', 'MarkerSize', 4);
plot(handles.Plot_3, 101:150, SE_result(1, 101:150), '-o', 'MarkerSize', 4);
plot(handles.Plot_4, 151:200, SE_result(1, 151:200), '-o', 'MarkerSize', 4);
xlabel(handles.Plot_1, 'epoch'); ylabel(handles.Plot_1, 'Onset (ms)');
xlabel(handles.Plot_2, 'epoch'); ylabel(handles.Plot_2, 'Onset (ms)');
xlabel(handles.Plot_3, 'epoch'); ylabel(handles.Plot_3, 'Onset (ms)');
xlabel(handles.Plot_4, 'epoch'); ylabel(handles.Plot_4, 'Onset (ms)');
hold(handles.Plot_1, 'on'); hold(handles.Plot_2, 'on'); hold(handles.Plot_3, 'on'); hold(handles.Plot_4, 'on'); 
grid(handles.Plot_1, 'on'); grid(handles.Plot_2, 'on'); grid(handles.Plot_3, 'on'); grid(handles.Plot_4, 'on');

% --- Executes on button press in VS_button.
function VS_button_Callback(hObject, eventdata, handles)
% hObject    handle to VS_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VS_result = evalin('base','VS_result');
plot(handles.Plot_1, 1:50, VS_result(1, 1:50), '-o', 'MarkerSize', 4);
plot(handles.Plot_2, 1:50, VS_result(1, 51:100), '-o', 'MarkerSize', 4);
plot(handles.Plot_3, 101:150, VS_result(1, 101:150), '-o', 'MarkerSize', 4);
plot(handles.Plot_4, 151:200, VS_result(1, 151:200), '-o', 'MarkerSize', 4);
xlabel(handles.Plot_1, 'epoch'); ylabel(handles.Plot_1, 'Onset (ms)');
xlabel(handles.Plot_2, 'epoch'); ylabel(handles.Plot_2, 'Onset (ms)');
xlabel(handles.Plot_3, 'epoch'); ylabel(handles.Plot_3, 'Onset (ms)');
xlabel(handles.Plot_4, 'epoch'); ylabel(handles.Plot_4, 'Onset (ms)');
hold(handles.Plot_1, 'on'); hold(handles.Plot_2, 'on'); hold(handles.Plot_3, 'on'); hold(handles.Plot_4, 'on'); 
grid(handles.Plot_1, 'on'); grid(handles.Plot_2, 'on'); grid(handles.Plot_3, 'on'); grid(handles.Plot_4, 'on');

% --- Executes on button press in Reset_button.
function Reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to Reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.Plot_1, 'reset');
cla(handles.Plot_2, 'reset');
cla(handles.Plot_3, 'reset');
cla(handles.Plot_4, 'reset');
