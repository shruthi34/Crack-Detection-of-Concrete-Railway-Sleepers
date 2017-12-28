function varargout = separated_sleepers(varargin)
% SEPARATED_SLEEPERS MATLAB code for separated_sleepers.fig
%      SEPARATED_SLEEPERS, by itself, creates a new SEPARATED_SLEEPERS or raises the existing
%      singleton*.
%
%      H = SEPARATED_SLEEPERS returns the handle to a new SEPARATED_SLEEPERS or the handle to
%      the existing singleton*.
%
%      SEPARATED_SLEEPERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEPARATED_SLEEPERS.M with the given input arguments.
%
%      SEPARATED_SLEEPERS('Property','Value',...) creates a new SEPARATED_SLEEPERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before separated_sleepers_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to separated_sleepers_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help separated_sleepers

% Last Modified by GUIDE v2.5 15-May-2016 17:01:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @separated_sleepers_OpeningFcn, ...
                   'gui_OutputFcn',  @separated_sleepers_OutputFcn, ...
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


% --- Executes just before separated_sleepers is made visible.
function separated_sleepers_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to separated_sleepers (see VARARGIN)



%sleeper separation
global binary_img1;
global sleeper_name;
global sleeper_cnt;
global crack_nos;
crack_nos = 0;
sleeper_cnt = 0;
flag = 0;
axes(handles.ind_sleeper);
    k = 0;
    f = 1;
    for i = 1:1:256
        c = 0;
        for j = 1:1:256
            if binary_img1(i , j) == 1
                c = c + 1;
            end
        end
        if c > 150
            k = k + 1;
        else
            if (k > 0) && (k > 20)
                m = i - k;
                temp = zeros(k,256);
                a = 1;
                for o = m:1:i-1
                    for p = 1:1:256
                        temp(a,p) = binary_img1(o,p);
                    end
                    a = a + 1;
                end
                extract_name(temp);
                if length(sleeper_name) == 6
                    imwrite(temp,strcat('D:/project/sleepers/',sleeper_name,'.jpg'));
                    sleeper_cnt = sleeper_cnt + 1;
                    if(f <= 3)
                        subplot(1,3,f);
                        imshow(temp);
                        title(sleeper_name);
                    end
                    f = f + 1;
                    crack_detection(temp,sleeper_name);
                end
                
                k = 0;
            end
        end
    end

% Choose default command line output for separated_sleepers
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes separated_sleepers wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = separated_sleepers_OutputFcn(hObject, eventdata, handles) 
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
function pushbutton1_Callback(hObject, eventdata, handles)%next
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
summary;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)%back
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
preprocessing;
