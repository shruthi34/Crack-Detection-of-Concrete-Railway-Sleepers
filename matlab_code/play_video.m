function varargout = play_video(varargin)
% PLAY_VIDEO MATLAB code for play_video.fig
%      PLAY_VIDEO, by itself, creates a new PLAY_VIDEO or raises the existing
%      singleton*.
%
%      H = PLAY_VIDEO returns the handle to a new PLAY_VIDEO or the handle to
%      the existing singleton*.
%
%      PLAY_VIDEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAY_VIDEO.M with the given input arguments.
%
%      PLAY_VIDEO('Property','Value',...) creates a new PLAY_VIDEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before play_video_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to play_video_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help play_video

% Last Modified by GUIDE v2.5 21-May-2016 00:14:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @play_video_OpeningFcn, ...
                   'gui_OutputFcn',  @play_video_OutputFcn, ...
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


% --- Executes just before play_video is made visible.
function play_video_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to play_video (see VARARGIN)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

% Choose default command line output for play_video
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes play_video wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = play_video_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global vid;
global chk;
chk = 0;
%displaying video
%vid = read(obj);
axes(handles.play_vid);

fps=30;
for i=1:max(vid(1,1,1,:))
    if chk == 0
        imshow(vid(:,:,:,i));
        pause(1/fps);
    else
        break;
    end
end


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%close
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chk;
chk = 1;
close;
% closereq;
% video;
