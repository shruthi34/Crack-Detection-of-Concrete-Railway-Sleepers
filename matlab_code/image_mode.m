function varargout = image_mode(varargin)
% IMAGE_MODE MATLAB code for image_mode.fig
%      IMAGE_MODE, by itself, creates a new IMAGE_MODE or raises the existing
%      singleton*.
%
%      H = IMAGE_MODE returns the handle to a new IMAGE_MODE or the handle to
%      the existing singleton*.
%
%      IMAGE_MODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_MODE.M with the given input arguments.
%
%      IMAGE_MODE('Property','Value',...) creates a new IMAGE_MODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_mode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_mode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_mode

% Last Modified by GUIDE v2.5 16-May-2016 23:27:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_mode_OpeningFcn, ...
                   'gui_OutputFcn',  @image_mode_OutputFcn, ...
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


% --- Executes just before image_mode is made visible.
function image_mode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_mode (see VARARGIN)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

%delete contents of temporary_storage
delete('D:\project\temporary_storage\*.jpg');

% Choose default command line output for image_mode
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_mode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_mode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in see_img_details.
function see_img_details_Callback(hObject, eventdata, handles)
% hObject    handle to see_img_details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
preprocessing;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%input_mode_change
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
page1;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)%browse image
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame1;
global filename;
[FileName1,PathName1] = uigetfile({'*.jpg';'*.png';'*.bmp';'*.gif'},'Select the Image file');
filename = strcat(PathName1,FileName1);

%delete contents of temporary_storage
delete('D:\project\temporary_storage\*.jpg');

if ~isempty(filename)
   set(handles.text3,'String',filename);
    frame1 = imread(filename);
    imshow(frame1, 'Parent', handles.selected_image);
    set(handles.see_img_details,'visible','on');
end
