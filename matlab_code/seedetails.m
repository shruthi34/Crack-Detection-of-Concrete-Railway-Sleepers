function varargout = seedetails(varargin)
% SEEDETAILS MATLAB code for seedetails.fig
%      SEEDETAILS, by itself, creates a new SEEDETAILS or raises the existing
%      singleton*.
%
%      H = SEEDETAILS returns the handle to a new SEEDETAILS or the handle to
%      the existing singleton*.
%
%      SEEDETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEEDETAILS.M with the given input arguments.
%
%      SEEDETAILS('Property','Value',...) creates a new SEEDETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before seedetails_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to seedetails_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help seedetails

% Last Modified by GUIDE v2.5 23-Feb-2016 23:39:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @seedetails_OpeningFcn, ...
                   'gui_OutputFcn',  @seedetails_OutputFcn, ...
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


% --- Executes just before seedetails is made visible.
function seedetails_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to seedetails (see VARARGIN)
ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

global frame;
    axes(handles.axes1);
    subplot(2,3,1);
    imshow(frame);
    title('Original Image');

    %resize to 256 by 256
    resized = imresize(frame,[256 256]);
    subplot(2,3,2);
    imshow(resized);
    title('Resized Image');

    %conversion to binary
    threshold = graythresh(resized);
    binary_img = im2bw(resized , threshold);
    subplot(2,3,3);
    imshow(binary_img);
    title('Binary Image');
    %hold on;
    
    %sleeper separation
    k = 0;
    f = 4;
    for i = 1:1:256
        c = 0;
        for j = 1:1:256
            if binary_img(i , j) == 1
                c = c + 1;
            end
        end
        if c > 190
            k = k + 1;
        else
            if (k > 0) && (k > 20)
                m = i - k;
                temp = zeros(k,256);
                a = 1;
                for o = m:1:i-1
                    for p = 1:1:256
                        temp(a,p) = binary_img(o,p);
                    end
                    a = a + 1;
                end
                if(f <= 6)
                subplot(2,3,f);
                imshow(temp);
                end;
                f = f + 1;
                title('Sleeper');
                k = 0;
            end
        end
    end


% Choose default command line output for seedetails
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes seedetails wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = seedetails_OutputFcn(hObject, eventdata, handles) 
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
