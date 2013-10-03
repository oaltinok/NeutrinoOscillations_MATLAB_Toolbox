function varargout = GUI_v1_08(varargin)
% GUI_V1_08 MATLAB code for GUI_v1_08.fig
%      GUI_V1_08, by itself, creates a new GUI_V1_08 or raises the existing
%      singleton*.
%
%      H = GUI_V1_08 returns the handle to a new GUI_V1_08 or the handle to
%      the existing singleton*.
%
%      GUI_V1_08('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_V1_08.M with the given input arguments.
%
%      GUI_V1_08('Property','Value',...) creates a new GUI_V1_08 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_v1_08_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_v1_08_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_v1_08

% Last Modified by GUIDE v2.5 04-Oct-2012 23:37:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_v1_08_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_v1_08_OutputFcn, ...
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


% --- Executes just before GUI_v1_08 is made visible.
function GUI_v1_08_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_v1_08 (see VARARGIN)

% Choose default command line output for GUI_v1_08


handles.output = hObject;

% Colors for the Plot
handles.Plot_Color = {'b','r','g', 'k','c','m','y'};
handles.color_indice = 1;
handles.color_indice_max = 7;
handles.color_check = 0;

% Default Values
hold off;

handles.distance=500;

handles.dirac_delta=0;
handles.NSI_delta=0;

handles.edit_eps_et_min=-0.2;
handles.edit_eps_et_max=0.2;
handles.edit_eps_et_inc=0.1;

handles.edit_eps_ee_min=-0.2;
handles.edit_eps_ee_max=0.2;
handles.edit_eps_ee_inc=0.1;

handles.edit_eps_tt_min=-0.2;
handles.edit_eps_tt_max=0.2;
handles.edit_eps_tt_inc=0.1;

handles.eps_et_nsi=0;
handles.eps_ee_nsi=0;
handles.eps_tt_nsi=0;

handles.delta_m31_input = 2.35;

set(handles.panel_hierarchy, 'SelectedObject', handles.hierarchy_1);
set(handles.panel_type, 'SelectedObject', handles.type_1);

handles.h1=1;
handles.h2=0;

handles.t1=1;
handles.t2=0;

handles.hold_button_check=0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_v1_08 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_v1_08_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
dirac_delta=str2double(get(hObject,'String'));
if isnan(dirac_delta)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Dirac_Delta is in units of pi
handles.dirac_delta = dirac_delta*pi;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes when selected object is changed in panel_hierarchy.
function panel_hierarchy_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_hierarchy 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.hierarchy_1)    
    handles.h1=1;
    handles.h2=0;
    guidata(hObject,handles)   
else   
    handles.h1=0;
    handles.h2=1;
    guidata(hObject,handles)
end

% --- Executes when selected object is changed in panel_hierarchy.
function panel_type_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_hierarchy 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.type_1)
    handles.t1=1;
    handles.t2=0;
    guidata(hObject,handles)   
else   
    handles.t1=0;
    handles.t2=1;
    guidata(hObject,handles)    
end



function distance_box_Callback(hObject, eventdata, handles)
% hObject    handle to distance_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance_box as text
%        str2double(get(hObject,'String')) returns contents of distance_box as a double
distance=str2double(get(hObject,'String'));
if isnan(distance)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
if distance<500
    set(hObject, 'String', 0);
    errordlg('Input must be higher than 500km','Error');
end

handles.distance = distance;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function distance_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
NSI_delta=str2double(get(hObject,'String'));
if isnan(NSI_delta)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Dirac_Delta is in units of pi
handles.NSI_delta = NSI_delta*pi;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eps_et_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_et_min as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_et_min as a double
eps_et_min=str2double(get(hObject,'String'));
if isnan(eps_et_min)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_et_min = eps_et_min;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_eps_et_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eps_et_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_et_max as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_et_max as a double
eps_et_max=str2double(get(hObject,'String'));
if isnan(eps_et_max)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_et_max = eps_et_max;
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function edit_eps_et_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_eps_et_inc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_et_inc as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_et_inc as a double
eps_et_inc=str2double(get(hObject,'String'));
if isnan(eps_et_inc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_et_inc = eps_et_inc;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_eps_et_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eps_tt_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_tt_min as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_tt_min as a double
eps_tt_min=str2double(get(hObject,'String'));
if isnan(eps_tt_min)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_tt_min = eps_tt_min;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_eps_tt_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eps_tt_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_tt_max as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_tt_max as a double
eps_tt_max=str2double(get(hObject,'String'));
if isnan(eps_tt_max)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_tt_max = eps_tt_max;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_eps_tt_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_eps_tt_inc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_tt_inc as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_tt_inc as a double
eps_tt_inc=str2double(get(hObject,'String'));
if isnan(eps_tt_inc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_tt_inc = eps_tt_inc;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_eps_tt_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_tt_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_eps_ee_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_et_min as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_et_min as a double
eps_ee_min=str2double(get(hObject,'String'));
if isnan(eps_ee_min)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_ee_min = eps_ee_min;
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function edit_eps_ee_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_eps_ee_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_et_max as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_et_max as a double
eps_ee_max=str2double(get(hObject,'String'));
if isnan(eps_ee_max)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_ee_max = eps_ee_max;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_eps_ee_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_et_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_eps_ee_inc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_eps_ee_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_eps_ee_inc as text
%        str2double(get(hObject,'String')) returns contents of edit_eps_ee_inc as a double
eps_ee_inc=str2double(get(hObject,'String'));
if isnan(eps_ee_inc)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.edit_eps_ee_inc = eps_ee_inc;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_eps_ee_inc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_eps_ee_inc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eps_ee_nsi_Callback(hObject, eventdata, handles)
% hObject    handle to eps_ee_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_ee_nsi as text
%        str2double(get(hObject,'String')) returns contents of eps_ee_nsi as a double
eps_ee_nsi=str2double(get(hObject,'String'));
if isnan(eps_ee_nsi)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.eps_ee_nsi = eps_ee_nsi;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function eps_ee_nsi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_ee_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_et_nsi_Callback(hObject, eventdata, handles)
% hObject    handle to eps_et_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_et_nsi as text
%        str2double(get(hObject,'String')) returns contents of eps_et_nsi as a double
eps_et_nsi=str2double(get(hObject,'String'));
if isnan(eps_et_nsi)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.eps_et_nsi = eps_et_nsi;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function eps_et_nsi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_et_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eps_tt_nsi_Callback(hObject, eventdata, handles)
% hObject    handle to eps_tt_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_tt_nsi as text
%        str2double(get(hObject,'String')) returns contents of eps_tt_nsi as a double
eps_tt_nsi=str2double(get(hObject,'String'));
if isnan(eps_tt_nsi)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.eps_tt_nsi = eps_tt_nsi;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function eps_tt_nsi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_tt_nsi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function M_E_NSI_Probability_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wb=waitbar(0,'');
axes(handles.axes1);

if handles.color_check == 1
    if handles.color_indice < handles.color_indice_max
        handles.color_indice = handles.color_indice + 1;
    else
        handles.color_indice = 1;
    end
else
    handles.color_indice = 1;
end


handles.check_par = M_E_Eps_Total(handles.distance,handles.dirac_delta,handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    handles.delta_m31_input,...
    wb, handles.Plot_Color{handles.color_indice});
close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)
    
    
% --- Executes on button press in M_M_NSI_Probability.
function M_M_NSI_Probability_Callback(hObject, eventdata, handles)
% hObject    handle to M_M_NSI_Probability (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wb=waitbar(0,'');
axes(handles.axes1);

if handles.color_check == 1
    if handles.color_indice < handles.color_indice_max
        handles.color_indice = handles.color_indice + 1;
    else
        handles.color_indice = 1;
    end
else
    handles.color_indice = 1;
end

handles.check_par = M_M_Eps_Total(handles.distance,handles.dirac_delta,handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    handles.delta_m31_input,...
    wb, handles.Plot_Color{handles.color_indice});
close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)

    


% --- Executes on button press in Eps_tt.
function Eps_tt_Callback(hObject, eventdata, handles)
% hObject    handle to Eps_tt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    wb=waitbar(0,'');
    axes(handles.axes1);
   handles.check_par =  M_E_Range_Eps_tt(handles.distance,handles.dirac_delta,handles.NSI_delta,...
        handles.h1,handles.t1,...
        handles.eps_et_nsi,...
        handles.eps_ee_nsi,...
        handles.edit_eps_tt_min,handles.edit_eps_tt_max,handles.edit_eps_tt_inc,wb);
    close(wb);
    
    GUI_Parameters(handles.check_par); 




% --- Executes on button press in Eps_ee.
function Eps_ee_Callback(hObject, eventdata, handles)
% hObject    handle to Eps_ee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    wb=waitbar(0,'');
    axes(handles.axes1);
    handles.check_par = M_E_Range_Eps_ee(handles.distance,handles.dirac_delta,handles.NSI_delta,...
        handles.h1,handles.t1,...
        handles.eps_et_nsi,...
        handles.edit_eps_ee_min,handles.edit_eps_ee_max,handles.edit_eps_ee_inc,...
        handles.eps_tt_nsi,wb);
    close(wb);
    
    GUI_Parameters(handles.check_par); 



% --- Executes on button press in Eps_et.
function Eps_et_Callback(hObject, eventdata, handles)
% hObject    handle to Eps_et (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    wb=waitbar(0,'');
    axes(handles.axes1);
    handles.check_par = M_E_Range_Eps_et(handles.distance,handles.dirac_delta,handles.NSI_delta,...
        handles.h1,handles.t1,...
        handles.edit_eps_et_min,handles.edit_eps_et_max,handles.edit_eps_et_inc,...
        handles.eps_ee_nsi,...
        handles.eps_tt_nsi,wb);
    close(wb);
    
    GUI_Parameters(handles.check_par);
    
    % --- Executes on button press in button_minos_flux.
function button_minos_flux_Callback(hObject, eventdata, handles)
% hObject    handle to button_minos_flux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wb=waitbar(0,'');
axes(handles.axes1);

if handles.color_check == 1
    if handles.color_indice < handles.color_indice_max
        handles.color_indice = handles.color_indice + 1;
    else
        handles.color_indice = 1;
    end
else
    handles.color_indice = 1;
end
handles.check_par = Event_Rate_MINOS(handles.dirac_delta,handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,handles.Plot_Color{handles.color_indice});
close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)
    
% --- Executes on button press in button_event_rate_nova.
function button_event_rate_nova_Callback(hObject, eventdata, handles)
% hObject    handle to button_event_rate_nova (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wb=waitbar(0,'');
axes(handles.axes1);

if handles.color_check == 1
    if handles.color_indice < handles.color_indice_max
        handles.color_indice = handles.color_indice + 1;
    else
        handles.color_indice = 1;
    end
else
    handles.color_indice = 1;
end

[handles.check_par,handles.plot] = Event_Rate_Nova(handles.dirac_delta,handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,handles.Plot_Color{handles.color_indice});
close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)

  

% --- Executes on button press in toogglebutton_hold_button.
function toogglebutton_hold_button_Callback(hObject, eventdata, handles)
% hObject    handle to toogglebutton_hold_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of toogglebutton_hold_button
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
	% Toggle button is pressed, take appropriate action
    hold on
    handles.color_check = 1;

elseif button_state == get(hObject,'Min')
	% Toggle button is not pressed, take appropriate action
   hold off
   handles.color_check = 0;
end
guidata(hObject,handles)


% --- Executes on key press with focus on toogglebutton_hold_button and none of its controls.
function toogglebutton_hold_button_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to toogglebutton_hold_button (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_save_plot.
function button_save_plot_Callback(hObject, eventdata, handles)
% hObject    handle to button_save_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
saveas(handles.axes1,'output','png');
guidata(hObject,handles)



function edit_delta_m31_Callback(hObject, eventdata, handles)
% hObject    handle to edit_delta_m31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_delta_m31 as text
%        str2double(get(hObject,'String')) returns contents of edit_delta_m31 as a double
delta_m31_input=str2double(get(hObject,'String'));
if isnan(delta_m31_input)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.delta_m31_input = delta_m31_input;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function edit_delta_m31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_delta_m31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
