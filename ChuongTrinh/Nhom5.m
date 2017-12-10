function varargout = Nhom5(varargin)
% NHOM5 MATLAB code for Nhom5.fig
%      NHOM5, by itself, creates a new NHOM5 or raises the existing
%      singleton*.
%
%      H = NHOM5 returns the handle to a new NHOM5 or the handle to
%      the existing singleton*.
%
%      NHOM5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NHOM5.M with the given input arguments.
%
%      NHOM5('Property','Value',...) creates a new NHOM5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Nhom5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Nhom5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Nhom5

% Last Modified by GUIDE v2.5 24-Nov-2017 13:28:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Nhom5_OpeningFcn, ...
                   'gui_OutputFcn',  @Nhom5_OutputFcn, ...
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


% --- Executes just before Nhom5 is made visible.
function Nhom5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Nhom5 (see VARARGIN)
set(handles.panelHis, 'visible', 'off')
set(handles.panelXam, 'visible', 'off')
set(handles.panelLocAnh, 'visible', 'off')
set(handles.pnNhieu, 'visible', 'off')
% Choose default command line output for Nhom5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Nhom5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Nhom5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnTaiAnh.
function btnTaiAnh_Callback(hObject, eventdata, handles)
% hObject    handle to btnTaiAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
[filename path]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';'*.*'}, 'File anh');
if ~isequal(filename, 0)

   A = imread([path, filename]);

   axes(handles.axes1)
   imshow(A);
   [x Fs] = audioread('mp3/tai-anh.mp3');
   sound(x, Fs);
else
   return
end


% --- Executes on button press in btnHis.
function btnHis_Callback(hObject, eventdata, handles)
global A
if ~isempty(A)
   axes(handles.axes1)
   imshow(A);
else
   msgbox('Yêu cầu tải ảnh lên', 'Error','error');
   [x Fs] = audioread('mp3/yeu-cau-tai-anh.mp3');
   sound(x, Fs);
   return;
end
set(handles.panelHis, 'visible', 'on')
set(handles.panelXam, 'visible', 'off')
set(handles.panelLocAnh, 'visible', 'off')
set(handles.pnNhieu, 'visible', 'off')
% hObject    handle to btnHis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnXam.
function btnXam_Callback(hObject, eventdata, handles)
global A
if ~isempty(A)
   axes(handles.axes1)
   imshow(A);
else
   msgbox('Yêu cầu tải ảnh lên', 'Error','error');
   [x Fs] = audioread('mp3/yeu-cau-tai-anh.mp3');
   sound(x, Fs);
   return;
end
set(handles.panelHis, 'visible', 'off')
set(handles.panelXam, 'visible', 'on')
set(handles.panelLocAnh, 'visible', 'off')
set(handles.pnNhieu, 'visible', 'off')
% hObject    handle to btnXam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function txtMucXam_Callback(hObject, eventdata, handles)
% hObject    handle to txtMucXam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMucXam as text
%        str2double(get(hObject,'String')) returns contents of txtMucXam as a double


% --- Executes during object creation, after setting all properties.
function txtMucXam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMucXam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCanBangHis.
function btnCanBangHis_Callback(hObject, eventdata, handles)
% hObject    handle to btnCanBangHis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
nlev = get(handles.txtMucXam,'string');
nlev = str2double(nlev);
if nlev <= 1 
 msgbox('Mức xám phải > 1', 'Error','error');
 return;
end
Anhcanbang = histeq(rgb2gray(A), nlev);
axes(handles.axes2)
imshow(Anhcanbang);
% bieu do historgram
axes(handles.axesHis)
imhist(Anhcanbang);
[x Fs] = audioread('mp3/can-bang-histogram.mp3');
sound(x, Fs);

% --- Executes on button press in btnAmBan.
function btnAmBan_Callback(hObject, eventdata, handles)
global A;
global g;
g = imcomplement(A);
axes(handles.axes2);
imshow(g);
[x Fs] = audioread('mp3/anh-am-ban.mp3');
sound(x, Fs);
% hObject    handle to btnAmBan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slLuyThua_Callback(hObject, eventdata, handles)
global A;
global g;
giatriLuyThua = get(handles.slLuyThua,'value');
set(handles.txtLuyThua,'string',num2str(giatriLuyThua));
gamma = giatriLuyThua;
g = giatriLuyThua*(im2double(A).^gamma);
axes(handles.axes2);
imshow(g);
% hObject    handle to slLuyThua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slLuyThua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slLuyThua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slTuongPhan_Callback(hObject, eventdata, handles)
    global A;
    global g;
    giatriTuongPhan = get(handles.slTuongPhan, 'value');
    set(handles.txtTuongPhan, 'string', num2str(giatriTuongPhan));
    g2 = im2double(A);
    m = mean2(g2);
    g = 1./(1+m./(g2+eps)).^giatriTuongPhan;
    axes(handles.axes2)
    imshow(g);
% hObject    handle to slTuongPhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slTuongPhan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slTuongPhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slLog_Callback(hObject, eventdata, handles)
    global A;
    global g;
    giatrilog=get(handles.slLog,'value');
    set(handles.txtLog,'string',num2str(giatrilog));
    g = giatrilog*log(1 + im2double(A));
    axes(handles.axes2)
    imshow(g);
% hObject    handle to slLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slLog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txtLog_Callback(hObject, eventdata, handles)
% hObject    handle to txtLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLog as text
%        str2double(get(hObject,'String')) returns contents of txtLog as a double


% --- Executes during object creation, after setting all properties.
function txtLog_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtLuyThua_Callback(hObject, eventdata, handles)
% hObject    handle to txtLuyThua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtLuyThua as text
%        str2double(get(hObject,'String')) returns contents of txtLuyThua as a double


% --- Executes during object creation, after setting all properties.
function txtLuyThua_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLuyThua (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTuongPhan_Callback(hObject, eventdata, handles)
% hObject    handle to txtTuongPhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTuongPhan as text
%        str2double(get(hObject,'String')) returns contents of txtTuongPhan as a double


% --- Executes during object creation, after setting all properties.
function txtTuongPhan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTuongPhan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in txtLocAnh.
function txtLocAnh_Callback(hObject, eventdata, handles)
global A
if ~isempty(A)
   axes(handles.axes1)
   imshow(A);
else
   msgbox('Yêu cầu tải ảnh lên', 'Error','error');
   [x Fs] = audioread('mp3/yeu-cau-tai-anh.mp3');
   sound(x, Fs);
   return;
end
set(handles.panelHis, 'visible', 'off')
set(handles.panelXam, 'visible', 'off')
set(handles.panelLocAnh, 'visible', 'on')
set(handles.pnNhieu, 'visible', 'off')
% hObject    handle to txtLocAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of txtLocAnh


% --- Executes on selection change in ppmLocTuyenTinh.
function ppmLocTuyenTinh_Callback(hObject, eventdata, handles)
% hObject    handle to ppmLocTuyenTinh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ppmLocTuyenTinh contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppmLocTuyenTinh
global chonTuyenTinh
chonTuyenTinh = get(handles.ppmLocTuyenTinh, 'Value');

switch chonTuyenTinh
    case 1
        set(handles.pnOptionTuyenTinh, 'visible', 'off');
    case 2
        set(handles.pnOptionTuyenTinh, 'visible', 'on');
        set(handles.txtTichChap, 'visible', 'on');
        set(handles.textTichChap, 'visible', 'on');
        set(handles.txtSigma, 'visible', 'off');
        set(handles.textSigma, 'visible', 'off');
        set(handles.txtAlpha, 'visible', 'off');
        set(handles.textAlpha, 'visible', 'off');
    case {3, 5}
        set(handles.pnOptionTuyenTinh, 'visible', 'on');
        set(handles.txtTichChap, 'visible', 'on');
        set(handles.textTichChap, 'visible', 'on');
        set(handles.txtSigma, 'visible', 'on');
        set(handles.textSigma, 'visible', 'on');
        set(handles.txtAlpha, 'visible', 'off');
        set(handles.textAlpha, 'visible', 'off');
    case {4, 8}
        set(handles.pnOptionTuyenTinh, 'visible', 'on');
        set(handles.txtAlpha, 'visible', 'on');
        set(handles.textAlpha, 'visible', 'on');
        set(handles.txtTichChap, 'visible', 'off');
        set(handles.textTichChap, 'visible', 'off');
        set(handles.txtSigma, 'visible', 'off');
        set(handles.textSigma, 'visible', 'off');
   
    case {6, 7}
        set(handles.pnOptionTuyenTinh, 'visible', 'on');
        set(handles.txtTichChap, 'visible', 'off');
        set(handles.textTichChap, 'visible', 'off');
        set(handles.txtSigma, 'visible', 'off');
        set(handles.textSigma, 'visible', 'off');
        set(handles.txtAlpha, 'visible', 'off');
        set(handles.textAlpha, 'visible', 'off');
    otherwise
end

% --- Executes during object creation, after setting all properties.
function ppmLocTuyenTinh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppmLocTuyenTinh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTichChap_Callback(hObject, eventdata, handles)
% hObject    handle to txtTichChap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tichchap
tichchap = str2num(get(handles.txtTichChap, 'String'));

% Hints: get(hObject,'String') returns contents of txtTichChap as text
%        str2double(get(hObject,'String')) returns contents of txtTichChap as a double


% --- Executes during object creation, after setting all properties.
function txtTichChap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTichChap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ppmPadding.
function ppmPadding_Callback(hObject, eventdata, handles)
% hObject    handle to ppmPadding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global padding
padding = get(handles.ppmPadding, 'Value');
switch padding
    case 1
        padding = 0;
    case 2
        padding = 'replicate';
    case 3
        padding = 'symmetric';
    case 4
        padding = 'circular';
    otherwise
end
% Hints: contents = cellstr(get(hObject,'String')) returns ppmPadding contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppmPadding


% --- Executes during object creation, after setting all properties.
function ppmPadding_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppmPadding (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnLocTuyenTinh.
function btnLocTuyenTinh_Callback(hObject, eventdata, handles)
% hObject    handle to btnLocTuyenTinh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global chonTuyenTinh
global tichchap
global padding
global A
global sigma
global alpha
global g;
if isempty(padding)
    padding = 0;
end

switch chonTuyenTinh
    case 2
        if isempty(tichchap) || (tichchap <= 0)
            msgbox('Tích chập phải lớn hơn 0', 'Error','error');
            return
        end
        h = fspecial('average', tichchap);
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-average.mp3');
        sound(x, Fs);
    case 3
        if isempty(tichchap) || (tichchap <= 0)
            msgbox('Tích chập phải lớn hơn 0', 'Error','error');
            return
        end
        if isempty(sigma) || (sigma <= 0)
            msgbox('Sigma phải lớn hơn 0', 'Error','error');
            return;
        end
        h = fspecial('gaussian', tichchap, sigma);
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-gaussian.mp3');
        sound(x, Fs);
    case 4
        if isempty(alpha) || (alpha < 0) || (alpha > 1)
            msgbox('alpha phải lớn hơn 0 và nhỏ hơn 1', 'Error','error');
            return;
        end
        h = fspecial('laplacian', alpha);
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-laplacian.mp3');
        sound(x, Fs);
    case 5
        if isempty(tichchap) || (tichchap <= 0)
            msgbox('Tích chập phải lớn hơn 0', 'Error','error');
            return
        end
        if isempty(sigma) || (sigma < 0) || (sigma > 1)
            msgbox('Sigma phải lớn hơn 0 và nhỏ hơn 1', 'Error','error');
            return;
        end
        h = fspecial('log', tichchap, sigma);
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-log.mp3');
        sound(x, Fs);
        
     case 6
        h = fspecial('prewitt');
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-prewitt.mp3');
        sound(x, Fs);
        
     case 7
        h = fspecial('sobel');
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-sobel.mp3');
        sound(x, Fs);
        
      case 8
        if isempty(alpha) || (alpha < 0) || (alpha > 1)
            msgbox('Sigma phải lớn hơn 0 và nhỏ hơn 1', 'Error','error');
            return;
        end
        h = fspecial('unsharp', alpha);
        g = imfilter(A, h, padding);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/tuyen-tinh-unsharp.mp3');
        sound(x, Fs);
    otherwise
end
% Hint: get(hObject,'Value') returns toggle state of btnLocTuyenTinh



function txtAlpha_Callback(hObject, eventdata, handles)
% hObject    handle to txtAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtAlpha as text
%        str2double(get(hObject,'String')) returns contents of txtAlpha as a double
global alpha
alpha = str2double(get(handles.txtAlpha, 'String'));

% --- Executes during object creation, after setting all properties.
function txtAlpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function txtSigma_Callback(hObject, eventdata, handles)
% hObject    handle to txtSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sigma
sigma = str2double(get(handles.txtSigma, 'String'));
% Hints: get(hObject,'String') returns contents of txtSigma as text
%        str2double(get(hObject,'String')) returns contents of txtSigma as a double


% --- Executes during object creation, after setting all properties.
function txtSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ppmPhiTuyen.
function ppmPhiTuyen_Callback(hObject, eventdata, handles)
% hObject    handle to ppmPhiTuyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chonPhiTuyen = get(handles.ppmPhiTuyen, 'Value');
switch chonPhiTuyen
    case 1
        set(handles.btnPhiTuyen, 'visible', 'off');
    case 2
        set(handles.btnPhiTuyen, 'visible', 'on');
    case 3
        set(handles.btnPhiTuyen, 'visible', 'on');
    otherwise
end
% Hints: contents = cellstr(get(hObject,'String')) returns ppmPhiTuyen contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppmPhiTuyen


% --- Executes during object creation, after setting all properties.
function ppmPhiTuyen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppmPhiTuyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPhiTuyen.
function btnPhiTuyen_Callback(hObject, eventdata, handles)
% hObject    handle to btnPhiTuyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chonPhiTuyen = get(handles.ppmPhiTuyen, 'Value');
global A
global g;

switch chonPhiTuyen
    case 2
        img_noisy = imnoise(A, 'salt & pepper', 0.02);
        g = img_noisy;
        for c = 1 : 3
            g(:, :, c) = medfilt2(img_noisy(:, :, c), [9 9]);
        end
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/phi-tuyen-trung-vi.mp3');
        sound(x, Fs);
    case 3
        img_noisy = imnoise(A, 'salt & pepper', 0.02);
        g = img_noisy;
        for c = 1 : 3
            g(:, :, c) = ordfilt2(img_noisy(:, :, c), 25, true(5));
        end
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/phi-tuyen-hang.mp3');
        sound(x, Fs);
    otherwise
end
% Hint: get(hObject,'Value') returns toggle state of btnPhiTuyen


% --- Executes on button press in btnLuuAnh.
function btnLuuAnh_Callback(hObject, eventdata, handles)
% hObject    handle to btnLuuAnh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
if ~isempty(A)
   axes(handles.axes1)
   imshow(A);
else
   msgbox('Yêu cầu tải ảnh lên', 'Error','error');
   [x a] = audioread('mp3/yeu-cau-tai-anh.mp3');
   sound(x, a);
   return;
end
global g
if ~isempty(g)
    axes(handles.axes2)
    imshow(g);
    [tenFile, duongDan] = uiputfile({'*.jpg','JPEG Files(*.jpg)';...
                                  '*.bmp','Bitmap Files(*.bmp)';'*.gif','GIF Files(*.gif)';...
                                  '*.tif','TIFF Files(*.tif)';...
                                  '*.*','all image file'},'Luu anh da chon!');
   imwrite(g, [duongDan,tenFile]);
   [x Fs] = audioread('mp3/luu-anh.mp3');
   sound(x, Fs);
else
    msgbox('Ảnh chưa được xử lý', 'Error','error');
    return;
end

% --- Executes on button press in btnChuThichHamLog.
function btnChuThichHamLog_Callback(hObject, eventdata, handles)
% hObject    handle to btnChuThichHamLog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(' Hàm Log có công thúc: c*log(1 + double(g3));. g3 là mức ảnh ban đầu. Thay đổi hệ số c thì không gian ảnh sẽ thay đổi');

% --- Executes on button press in btnChuThichHamMu.
function btnChuThichHamMu_Callback(hObject, eventdata, handles)
% hObject    handle to btnChuThichHamMu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(' Hàm Mũ có công thúc: c*(g3.^gama). Khi thay đổi 2 hệ số c và gama thì không giản ảnh sẽ đổi.');

% --- Executes on button press in btnChuThichDTP.
function btnChuThichDTP_Callback(hObject, eventdata, handles)
% hObject    handle to btnChuThichDTP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox(' Tăng giảm độ tương phản có công thức:   g3=1./(1+m./(g2+eps)).^E; g2 là ảnh gốc, khi thay đổi hệ số E thì không gian ảnh sẽ đổi');


% --- Executes on button press in btnNhieu.
function btnNhieu_Callback(hObject, eventdata, handles)
% hObject    handle to btnNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A
if ~isempty(A)
   axes(handles.axes1)
   imshow(A);
else
   msgbox('Yêu cầu tải ảnh lên', 'Error','error');
   [x Fs] = audioread('mp3/yeu-cau-tai-anh.mp3');
   sound(x, Fs);
   return;
end
set(handles.panelHis, 'visible', 'off')
set(handles.panelXam, 'visible', 'off')
set(handles.panelLocAnh, 'visible', 'off')
set(handles.pnNhieu, 'visible', 'on')


% --- Executes on selection change in ppmNhieu.
function ppmNhieu_Callback(hObject, eventdata, handles)
% hObject    handle to ppmNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global phepnhieu
phepnhieu = get(handles.ppmNhieu, 'value');

switch phepnhieu
    case 1
        set(handles.textCuongDoNhieu, 'visible', 'off');
        set(handles.txtCuongDoNhieu, 'visible', 'off');
        set(handles.btnChenNhieu, 'visible', 'off');
    case {2, 5, 6}
        set(handles.textCuongDoNhieu, 'visible', 'on');
        set(handles.txtCuongDoNhieu, 'visible', 'on');
        set(handles.btnChenNhieu, 'visible', 'on');
    otherwise
        set(handles.textCuongDoNhieu, 'visible', 'off');
        set(handles.txtCuongDoNhieu, 'visible', 'off');
        set(handles.btnChenNhieu, 'visible', 'on');
end
% Hints: contents = cellstr(get(hObject,'String')) returns ppmNhieu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ppmNhieu


% --- Executes during object creation, after setting all properties.
function ppmNhieu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ppmNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCuongDoNhieu_Callback(hObject, eventdata, handles)
% hObject    handle to txtCuongDoNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCuongDoNhieu as text
%        str2double(get(hObject,'String')) returns contents of txtCuongDoNhieu as a double


% --- Executes during object creation, after setting all properties.
function txtCuongDoNhieu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCuongDoNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnChenNhieu.
function btnChenNhieu_Callback(hObject, eventdata, handles)
% hObject    handle to btnChenNhieu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global phepnhieu
global g
global A
cuongdonhieu = get(handles.txtCuongDoNhieu,'string');
cuongdonhieu = str2double(cuongdonhieu);
switch phepnhieu
    case 2
        if cuongdonhieu<0 || cuongdonhieu>=1
            msgbox('Cường độ nhiễu phải >= 0 và < 1', 'Error','error');
            return;
        end
        g = imnoise(rgb2gray(A), 'gaussian', cuongdonhieu);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/chen-nhieu-gaussian.mp3');
        sound(x, Fs);
    case 3
        g = imnoise(rgb2gray(A), 'localvar', ones(size(rgb2gray(A))));
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/chen-nhieu-localvar.mp3');
        sound(x, Fs);
    case 4
        g = imnoise(rgb2gray(A), 'poisson');
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/chen-nhieu-poisson.mp3');
        sound(x, Fs);
    case 5
        if cuongdonhieu<0 || cuongdonhieu>1
            msgbox('Cường độ nhiễu phải >= 0 và <= 1', 'Error','error');
            return;
        end
        g = imnoise(rgb2gray(A), 'salt & pepper', cuongdonhieu);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/chen-nhieu-salt-pepper.mp3');
        sound(x, Fs);
    case 6
        if cuongdonhieu<0
            msgbox('Cường độ nhiễu phải >=0', 'Error','error');
            return;
        end
        g = imnoise(rgb2gray(A), 'speckle', cuongdonhieu);
        axes(handles.axes2);
        imshow(g);
        [x Fs] = audioread('mp3/chen-nhieu-speckle.mp3');
        sound(x, Fs);
    otherwise
end


% --- Executes on button press in btnHisAnhGoc.
function btnHisAnhGoc_Callback(hObject, eventdata, handles)
% hObject    handle to btnHisAnhGoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;
nlev = get(handles.txtMucXam,'string');
nlev = str2double(nlev);
if nlev <= 1 
 msgbox('Mức xám phải > 1', 'Error','error');
 return;
end
Anhcanbang = histeq(A, nlev);
axes(handles.axes2)
imshow(Anhcanbang);
% bieu do historgram
axes(handles.axesHis)
imhist(Anhcanbang);

[x Fs] = audioread('mp3/bieu-do-his-anh-goc.mp3');
sound(x, Fs);
