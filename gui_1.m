function varargout = gui_1(varargin)
% GUI_1 MATLAB code for gui_1.fig
%      GUI_1, by itself, creates a new GUI_1 or raises the existing
%      singleton*.
%
%      H = GUI_1 returns the handle to a new GUI_1 or the handle to
%      the existing singleton*.
%
%      GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_1.M with the given input arguments.
%
%      GUI_1('Property','Value',...) creates a new GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_1

% Last Modified by GUIDE v2.5 11-May-2018 15:33:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_1_OutputFcn, ...
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


% --- Executes just before gui_1 is made visible.
function gui_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_1 (see VARARGIN)

%preprocessing
set(handles.rbOriginal, 'value', 1);
set(handles.rbLena, 'value', 1);
handles = loadImageData(handles);

% Choose default command line output for gui_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rbORG = get(handles.rbOriginal, 'value');
rbLP = get(handles.rbLPFilter, 'value');
rbDS = get(handles.rbDSampling, 'value');
rbEQH = get(handles.rbEQHist, 'value');
rbFFT = get(handles.rbFFT, 'value');
rbPIM = get(handles.rbPolarImg, 'value');
rbPFFTIM = get(handles.rbPolarImgFFT, 'value');

if rbORG == 1
    axes(handles.axes1)
    imshow(handles.img_original);
elseif rbLP == 1
    axes(handles.axes1)
    imshow(handles.im_lpf);
elseif rbDS == 1
    axes(handles.axes1)
    imshow(handles.im_ds);   
elseif rbEQH == 1
    axes(handles.axes1)
    imagesc(handles.im_eqh); axis image;  
elseif rbFFT == 1
    axes(handles.axes1)
    imagesc(log(abs(handles.im_fft)+1)); axis image;
elseif rbPIM == 1
    axes(handles.axes1)
    imagesc(handles.pcimg); axis image;
elseif rbPFFTIM == 1
    axes(handles.axes1)
    imagesc(log(abs(handles.fpcimg)+1)); axis image;
end


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.rbOriginal, 'value', 1);
handles = loadImageData(handles);

% Update handles structure
guidata(hObject, handles);

%*********************************************
%*****************************Vlad Functions *
%MY functions for gui interface              *
%*****************************Description End*
%*********************************************

%Get the current name of the selected image from Image panel
function outData = getImageName(handles)

rbLena = get(handles.rbLena, 'value');
rbT1 = get(handles.rbTest1, 'value');
rbT2 = get(handles.rbTest2, 'value');

if rbLena == 1
    handles.imageName = 'lena_gray.bmp';
elseif rbT1 == 1
    handles.imageName = 'img1_test.PNG';
elseif rbT2 == 1
    handles.imageName = 'img3_test.PNG';
end

outData = handles;
return;

%Compute data for curret selected image
function outData = loadImageData(handles)

handles = getImageName(handles);

[ handles.im_lpf, handles.im_ds, handles.im_eqh, handles.im_fft, handles.pcimg, handles.fpcimg ] = vlad_preprocStage(handles.imageName);

handles.img_original = imread(handles.imageName);

axes(handles.axes1)
imshow(handles.img_original);

outData = handles;
return;


