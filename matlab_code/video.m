function varargout = video(varargin)
% VIDEO MATLAB code for video.fig
%      VIDEO, by itself, creates a new VIDEO or raises the existing
%      singleton*.
%
%      H = VIDEO returns the handle to a new VIDEO or the handle to
%      the existing singleton*.
%
%      VIDEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEO.M with the given input arguments.
%
%      VIDEO('Property','Value',...) creates a new VIDEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before video_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to video_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help video

% Last Modified by GUIDE v2.5 17-May-2016 00:49:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @video_OpeningFcn, ...
                   'gui_OutputFcn',  @video_OutputFcn, ...
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


% --- Executes just before video is made visible.
function video_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to video (see VARARGIN)

ah = axes('unit','normalized','position',[0 0 1 1]);
bg = imread('D:\project\bg1.jpg');
imagesc(bg,'AlphaData',0.5);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom');

% Choose default command line output for video
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes video wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = video_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% % % % --- Executes on selection change in ip_video.
% % % function ip_video_Callback(hObject, eventdata, handles)
% % % % hObject    handle to ip_video (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    structure with handles and user data (see GUIDATA)
% % % 
% % % % Hints: contents = cellstr(get(hObject,'String')) returns ip_video contents as cell array
% % % %        contents{get(hObject,'Value')} returns selected item from ip_video
% % % 
% % % % --- Executes during object creation, after setting all properties.
% % % function ip_video_CreateFcn(hObject, eventdata, handles)
% % % % hObject    handle to ip_video (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    empty - handles not created until after all CreateFcns called
% % % 
% % % % Hint: listbox controls usually have a white background on Windows.
% % % %       See ISPC and COMPUTER.
% % % if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
% % %     set(hObject,'BackgroundColor','white');
% % % end



function select_video_Callback(hObject, eventdata, handles)
% hObject    handle to select_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of select_video as text
%        str2double(get(hObject,'String')) returns contents of select_video as a double


% --- Executes during object creation, after setting all properties.
function select_video_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in previous.
function previous_Callback(hObject, eventdata, handles)
% hObject    handle to previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame_no;
    global count;
    global frame;
    if(frame_no <= 1)
        frame_no = 13;
    else
        frame_no = frame_no - 1;
    end
    filename = strcat('D:/project/extracted_frames/frame-',num2str(frame_no),'.jpg');
    frame = imread(filename);
    imshow(frame, 'Parent', handles.axes1);
    framename = ['Frame No. ',num2str(frame_no)];
    set(handles.frame_no,'Visible','on');
    set(handles.frame_no,'string',framename);
    %eh = uicontrol('Style','text','Position',[300 125 150 15],'FontSize',11,'String',framename);


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame_no;
    global count;
    global frame;
    if(frame_no >= count)
        frame_no = 1;
    else
        frame_no = frame_no + 1;
    end
    filename = strcat('D:/project/extracted_frames/frame-',num2str(frame_no),'.jpg');
    frame = imread(filename);
    imshow(frame, 'Parent', handles.axes1);
    framename = ['Frame No. ',num2str(frame_no)];
    set(handles.frame_no,'Visible','on');
    set(handles.frame_no,'string',framename);
    %eh = uicontrol('Style','text','Position',[300 125 150 15],'FontSize',11,'String',framename);

% --- Executes on button press in see_details.
function see_details_Callback(hObject, eventdata, handles)
% hObject    handle to see_details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
seedetails;



function frame_no_Callback(hObject, eventdata, handles)
% hObject    handle to frame_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frame_no as text
%        str2double(get(hObject,'String')) returns contents of frame_no as a double


% --- Executes during object creation, after setting all properties.
function frame_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%input_mode_change
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;
page1;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)% browse video
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global frame_no;
global count;
global vid;

[FileName1,PathName1] = uigetfile({'*.mp4';'*.mpg';'*.mpv';'*.mp2'},'Select the Video file');
filename = strcat(PathName1,FileName1);
if ~isempty(filename)
   set(handles.text2,'String',filename);
    set(handles.figure1, 'pointer', 'watch')
drawnow;

obj = VideoReader(filename);
% implay(filename);%% not working in exe file

% %displaying video
vid = read(obj);
play_video;
% % axes(handles.axes1);
% % 
% % fps=30;
% % for i=1:max(vid(1,1,1,:))
% %     imshow(vid(:,:,:,i));
% %     pause(1/fps);
% % end

frames = obj.NumberOfFrames;

count = 0;
%Defining Output folder as 'snaps' and storing frames in it
for x = 1 : frames
    if(mod(x,15) == 0)%extracting every 15th frame
        count = count + 1;
        imwrite(vid(:,:,:,x),strcat('D:/project/extracted_frames/frame-',num2str(count),'.jpg'));
    end
end

% %fprintf('The no. of frames extracted is %d and kept is %d',frames,count);
% output = ['Number of frames in the video: ',num2str(frames)];
% eh = uicontrol('Style','text','Position',[20 30 450 20],'FontSize',13,'String',output);
% output = ['Number of extracted frames: ',num2str(count)];
% eh = uicontrol('Style','text','Position',[20 50 450 20],'FontSize',13,'String',output);

    frame_no = 1;
%     axes(handles.axes1)
    filename = strcat('D:/project/extracted_frames/frame-',num2str(frame_no),'.jpg');
    frame = imread(filename);
    imshow(frame, 'Parent', handles.axes1);
    framename = ['Frame No. ',num2str(frame_no)];
    set(handles.frame_no,'Visible','on');
    set(handles.frame_no,'string',framename);
    %eh = uicontrol('Style','text','Position',[300 125 150 15],'FontSize',11,'String',framename);
    
    
    %set buttons visible
    set(handles.previous, 'visible','on');
    set(handles.next, 'visible','on');
    set(handles.see_details, 'visible','on');
    
    set(handles.figure1, 'pointer', 'arrow');
end
