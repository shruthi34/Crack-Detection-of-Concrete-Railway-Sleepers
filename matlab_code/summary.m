function varargout = summary(varargin)
% SUMMARY MATLAB code for summary.fig
%      SUMMARY, by itself, creates a new SUMMARY or raises the existing
%      singleton*.
%
%      H = SUMMARY returns the handle to a new SUMMARY or the handle to
%      the existing singleton*.
%
%      SUMMARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMMARY.M with the given input arguments.
%
%      SUMMARY('Property','Value',...) creates a new SUMMARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before summary_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to summary_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help summary

% Last Modified by GUIDE v2.5 15-May-2016 20:59:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @summary_OpeningFcn, ...
                   'gui_OutputFcn',  @summary_OutputFcn, ...
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


% --- Executes just before summary is made visible.
function summary_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to summary (see VARARGIN)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');


global sleeper_cnt;
global crack_nos;
line1 = sprintf('No. of sleepers : %d\nNo. of cracked sleepers : %d',sleeper_cnt,crack_nos);
% eh = uicontrol('Style','text','Position',[300 125 150 15],'FontSize',11,'String',line1);
set(handles.summary_text,'FontSize',14,'string',line1);


if crack_nos == 0
    axes(handles.ind_summary);
    imshow('D:\project\thumbs-up.png');
else
    f = 1;
    allFiles = dir( 'D:\project\temporary_storage' );
    allNames = { allFiles.name };
    axes(handles.ind_summary);
    for i = 1 : length(allNames)
        if length(allNames{i}) == 10
            subplot(1,2,f);
            n1 = imread(strcat('D:\project\temporary_storage\',allNames{i}));
            X2 = imcrop(n1,[0 270 212 80]);
            imshow(X2);
            title(strcat('Crack found in : ',allNames{i}));
            f = f + 1;
        end
    end
end

% Choose default command line output for summary
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes summary wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = summary_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

% Get default command line output from handles structure
varargout{1} = handles.output;



function summary_text_Callback(hObject, eventdata, handles)
% hObject    handle to summary_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of summary_text as text
%        str2double(get(hObject,'String')) returns contents of summary_text as a double


% --- Executes during object creation, after setting all properties.
function summary_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to summary_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%exit
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%back
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
separated_sleepers;
