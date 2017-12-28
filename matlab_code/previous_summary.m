function varargout = previous_summary(varargin)
% PREVIOUS_SUMMARY MATLAB code for previous_summary.fig
%      PREVIOUS_SUMMARY, by itself, creates a new PREVIOUS_SUMMARY or raises the existing
%      singleton*.
%
%      H = PREVIOUS_SUMMARY returns the handle to a new PREVIOUS_SUMMARY or the handle to
%      the existing singleton*.
%
%      PREVIOUS_SUMMARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREVIOUS_SUMMARY.M with the given input arguments.
%
%      PREVIOUS_SUMMARY('Property','Value',...) creates a new PREVIOUS_SUMMARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before previous_summary_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to previous_summary_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help previous_summary

% Last Modified by GUIDE v2.5 20-May-2016 22:35:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @previous_summary_OpeningFcn, ...
                   'gui_OutputFcn',  @previous_summary_OutputFcn, ...
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


% --- Executes just before previous_summary is made visible.
function previous_summary_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to previous_summary (see VARARGIN)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

f = 0;
    allFiles = dir( 'D:\project\cracked_sleepers' );
    allNames = { allFiles.name };
    
    if length(allNames) < 3
        output = 'No Previous Summary';
    else
        set(handles.axes1,'Visible','on');
    axes(handles.axes1);
        for i = 1 : length(allNames)
            if length(allNames{i}) == 10
                n1 = imread(strcat('D:\project\cracked_sleepers\',allNames{i}));
                X2 = imcrop(n1,[0 270 212 80]);
                f = f + 1;
                subplot(2,3,f);
                imshow(X2);
                title(allNames{i}(1:6));
            end
        end
        output = ['Total no. of cracked sleepers is ',num2str(f)];
    end
 
    
%     set(handles.text2,'Visible','on');
    set(handles.text2,'String',output);

% Choose default command line output for previous_summary
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes previous_summary wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = previous_summary_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%return
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
page1;