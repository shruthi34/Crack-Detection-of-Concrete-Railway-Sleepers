function varargout = preprocessing(varargin)
% PREPROCESSING MATLAB code for preprocessing.fig
%      PREPROCESSING, by itself, creates a new PREPROCESSING or raises the existing
%      singleton*.
%
%      H = PREPROCESSING returns the handle to a new PREPROCESSING or the handle to
%      the existing singleton*.
%
%      PREPROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREPROCESSING.M with the given input arguments.
%
%      PREPROCESSING('Property','Value',...) creates a new PREPROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before preprocessing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to preprocessing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help preprocessing

% Last Modified by GUIDE v2.5 15-May-2016 16:13:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @preprocessing_OpeningFcn, ...
                   'gui_OutputFcn',  @preprocessing_OutputFcn, ...
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


% --- Executes just before preprocessing is made visible.
function preprocessing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to preprocessing (see VARARGIN)



global frame1;
global binary_img1;
    axes(handles.prepro);
    subplot(1,3,1);
    imshow(frame1);
    title('Original Image');

    %resize to 256 by 256
    resized = imresize(frame1,[256 256]);
    subplot(1,3,2);
    imshow(resized);
    title('Resized Image');

    %conversion to binary
    threshold = graythresh(resized);
    binary_img1 = im2bw(resized , threshold);
    subplot(1,3,3);
    imshow(binary_img1);
    title('Binary Image');
    
% Choose default command line output for preprocessing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes preprocessing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = preprocessing_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%next step
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 set(handles.figure1, 'pointer', 'watch')
drawnow;
closereq;
separated_sleepers;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%back
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
image_mode;
