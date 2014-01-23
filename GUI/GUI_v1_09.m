function varargout = GUI_v1_09(varargin)
%% GUI_V1_09 MATLAB code for GUI_v1_09.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_v1_09_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_v1_09_OutputFcn, ...
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
end

%% Main Window Functions

% --- Executes just before GUI_v1_09 is made visible.
function GUI_v1_09_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Colors for the Plot
handles.Plot_Color = {'b','r','g', 'k','c','m','y'};
handles.color_indice = 1;
handles.color_indice_max = 7;
handles.color_check = 0;

% Default Values used if user does not input another value
hold off;

% Distance
handles.distance = 500;

% Delta
handles.dirac_delta = 0;
handles.NSI_delta = 0;

% Epsilon Range
handles.edit_eps_et_min = -0.2;
handles.edit_eps_et_max = 0.2;
handles.edit_eps_et_inc = 0.1;

handles.edit_eps_ee_min = -0.2;
handles.edit_eps_ee_max = 0.2;
handles.edit_eps_ee_inc = 0.1;

handles.edit_eps_tt_min = -0.2;
handles.edit_eps_tt_max = 0.2;
handles.edit_eps_tt_inc = 0.1;

% Epsilon Single Value
handles.eps_et_nsi = 0;
handles.eps_ee_nsi = 0;
handles.eps_tt_nsi = 0;

% Default hierarchy and type
set(handles.panel_hierarchy, 'SelectedObject', handles.hierarchy_1);
set(handles.panel_type, 'SelectedObject', handles.type_1);

% Normal Hierarchy = 1 and Neutrino = 1
handles.h1 = 1;
handles.h2 = 0;

handles.t1 = 1;
handles.t2 = 0;

% Default Hold Button
handles.hold_button_check = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_v1_09 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = GUI_v1_09_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

%------------------------------------------------------------------------
% Variable Text Boxes
%------------------------------------------------------------------------
%% Create Functions
% --- Distance
function distance_box_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

% --- Dirac Delta
function edit_delta_dirac_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    
    end
    
end

% --- NSI Delta
function edit_delta_NSI_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
end

%% Epsilon Range
% --- Epsilon et_min
function edit_eps_et_min_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon et_max
function edit_eps_et_max_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon et_inc
function edit_eps_et_inc_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon tt_min
function edit_eps_tt_min_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon tt_max
function edit_eps_tt_max_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon tt_inc
function edit_eps_tt_inc_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
end


% --- Epsilon ee_min
function edit_eps_ee_min_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon ee_max
function edit_eps_ee_max_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon ee_inc
function edit_eps_ee_inc_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

%% Epsilon Single

% --- Epsilon ee_nsi
function eps_ee_nsi_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon et_nsi
function eps_et_nsi_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end

% --- Epsilon tt_nsi
function eps_tt_nsi_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

end



%% CallBack Functions
% Hints: get(hObject,'String') returns contents of edit_delta_dirac as text
%        str2double(get(hObject,'String')) returns contents of edit_delta_dirac as a double

function distance_box_Callback(hObject, eventdata, handles)

    if isnan(distance)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    if distance < 500
        set(hObject, 'String', 0);
        errordlg('Input must be higher than 500km','Error');
    end

    if distance > 12500
        set(hObject, 'String', 0);
        errordlg('Input must be lower than 12500km','Error');
    end

    handles.distance = distance;
    guidata(hObject,handles)

end

function edit_delta_dirac_Callback(hObject, eventdata, handles)

    dirac_delta=str2double(get(hObject,'String'));

    if isnan(dirac_delta)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    % Dirac_Delta is in units of pi
    handles.dirac_delta = dirac_delta * pi;
    guidata(hObject,handles)
    
end

function edit_delta_NSI_Callback(hObject, eventdata, handles)

    NSI_delta=str2double(get(hObject,'String'));

    if isnan(NSI_delta)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    % Dirac_Delta is in units of pi
    handles.NSI_delta = NSI_delta*pi;
    guidata(hObject,handles)

end

function edit_eps_et_min_Callback(hObject, eventdata, handles)

    eps_et_min=str2double(get(hObject,'String'));
    
    if isnan(eps_et_min)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_et_min = eps_et_min;
    guidata(hObject,handles)

end

function edit_eps_et_max_Callback(hObject, eventdata, handles)

    eps_et_max=str2double(get(hObject,'String'));
    
    if isnan(eps_et_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_et_max = eps_et_max;
    guidata(hObject,handles)

end

function edit_eps_et_inc_Callback(hObject, eventdata, handles)

    eps_et_inc=str2double(get(hObject,'String'));

    if isnan(eps_et_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_et_inc = eps_et_inc;
    guidata(hObject,handles)

end


function edit_eps_tt_min_Callback(hObject, eventdata, handles)

    eps_tt_min=str2double(get(hObject,'String'));
    if isnan(eps_tt_min)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_tt_min = eps_tt_min;
    guidata(hObject,handles)

end

function edit_eps_tt_max_Callback(hObject, eventdata, handles)

    eps_tt_max=str2double(get(hObject,'String'));
    if isnan(eps_tt_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_tt_max = eps_tt_max;
    guidata(hObject,handles)

end

function edit_eps_tt_inc_Callback(hObject, eventdata, handles)

    eps_tt_inc=str2double(get(hObject,'String'));
    if isnan(eps_tt_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_tt_inc = eps_tt_inc;
    guidata(hObject,handles)

end

function edit_eps_ee_min_Callback(hObject, eventdata, handles)

    eps_ee_min=str2double(get(hObject,'String'));
    if isnan(eps_ee_min)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_ee_min = eps_ee_min;
    guidata(hObject,handles)

end

function edit_eps_ee_max_Callback(hObject, eventdata, handles)

    eps_ee_max=str2double(get(hObject,'String'));
    if isnan(eps_ee_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_ee_max = eps_ee_max;
    guidata(hObject,handles)

end

function edit_eps_ee_inc_Callback(hObject, eventdata, handles)

    eps_ee_inc=str2double(get(hObject,'String'));
    if isnan(eps_ee_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.edit_eps_ee_inc = eps_ee_inc;
    guidata(hObject,handles)

end

function eps_ee_nsi_Callback(hObject, eventdata, handles)

    eps_ee_nsi=str2double(get(hObject,'String'));
    if isnan(eps_ee_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_ee_nsi = eps_ee_nsi;
    guidata(hObject,handles)

end

function eps_et_nsi_Callback(hObject, eventdata, handles)

    eps_et_nsi=str2double(get(hObject,'String'));
    if isnan(eps_et_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_et_nsi = eps_et_nsi;
    guidata(hObject,handles)

end

function eps_tt_nsi_Callback(hObject, eventdata, handles)

    eps_tt_nsi=str2double(get(hObject,'String'));
    if isnan(eps_tt_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_tt_nsi = eps_tt_nsi;
    guidata(hObject,handles)
    
end



%%
%------------------------------------------------------------------------
% Mass Hierarchy and Type Selection Functions
%------------------------------------------------------------------------
% --- Executes when selected object is changed in panel_hierarchy.

function panel_hierarchy_SelectionChangeFcn(hObject, eventdata, handles)

    if (hObject == handles.hierarchy_1)
        handles.h1 = 1;
        handles.h2 = 0;
        guidata(hObject,handles)
    else
        handles.h1 = 0;
        handles.h2 = 1;
        guidata(hObject,handles)
    end
    
end

function panel_type_SelectionChangeFcn(hObject, eventdata, handles)

    if (hObject == handles.type_1)
        handles.t1=1;
        handles.t2=0;
        guidata(hObject,handles)
    else
        handles.t1=0;
        handles.t2=1;
        guidata(hObject,handles)
    end

end



%%
%------------------------------------------------------------------------
% Button Functions
%------------------------------------------------------------------------
% --- Executes on button press

% Probability: Muon - Electron
function M_E_NSI_Probability_Callback(hObject, eventdata, handles)

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

finalStateParticle = 1;

handles.check_par = Get_Probability(...
    handles.distance,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,...
    handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,...
    finalStateParticle,...
    handles.Plot_Color{handles.color_indice});

close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)
end

% Probability: Muon - Muon
function M_M_NSI_Probability_Callback(hObject, eventdata, handles)

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

finalStateParticle = 0;

handles.check_par = Get_Probability(...
    handles.distance,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,...
    handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,...
    finalStateParticle,...
    handles.Plot_Color{handles.color_indice});

close(wb);

GUI_Parameters(handles.check_par);
guidata(hObject,handles)
end

% --- Probability Eps_tt Range
function Eps_tt_Callback(hObject, eventdata, handles)

wb=waitbar(0,'');
axes(handles.axes1);

handles.check_par =  M_E_Range_Eps_tt(...
    handles.distance,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.edit_eps_tt_min,...
    handles.edit_eps_tt_max,...
    handles.edit_eps_tt_inc,...
    wb);

close(wb);

GUI_Parameters(handles.check_par);
end

% --- Probability Eps_ee Range
function Eps_ee_Callback(hObject, eventdata, handles)

wb=waitbar(0,'');
axes(handles.axes1);
handles.check_par = M_E_Range_Eps_ee(...
    handles.distance,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,handles.t1,...
    handles.eps_et_nsi,...
    handles.edit_eps_ee_min,...
    handles.edit_eps_ee_max,...
    handles.edit_eps_ee_inc,...
    handles.eps_tt_nsi,...
    wb);

close(wb);

GUI_Parameters(handles.check_par);
end

% --- Probability Eps_et Range
function Eps_et_Callback(hObject, eventdata, handles)

wb=waitbar(0,'');
axes(handles.axes1);
handles.check_par = M_E_Range_Eps_et(...
    handles.distance,...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,...
    handles.t1,...
    handles.edit_eps_et_min,...
    handles.edit_eps_et_max,...
    handles.edit_eps_et_inc,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb);
close(wb);

GUI_Parameters(handles.check_par);

end


% --- Event Rate: MINOS
function button_minos_flux_Callback(hObject, eventdata, handles)

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

experiment = 1;

handles.check_par = Get_EventRate(...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,...
    handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,...
    experiment,...
    handles.Plot_Color{handles.color_indice});

close(wb);

GUI_Parameters(handles.check_par);

guidata(hObject,handles)
end

% --- Event Rate: NOVA
function button_event_rate_nova_Callback(hObject, eventdata, handles)

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

experiment = 0;

handles.check_par = Get_EventRate(...
    handles.dirac_delta,...
    handles.NSI_delta,...
    handles.h1,...
    handles.t1,...
    handles.eps_et_nsi,...
    handles.eps_ee_nsi,...
    handles.eps_tt_nsi,...
    wb,...
    experiment,...
    handles.Plot_Color{handles.color_indice});

close(wb);

GUI_Parameters(handles.check_par);

guidata(hObject,handles)

end

% --- Hold On Button for Plots
function toogglebutton_hold_button_Callback(hObject, eventdata, handles)
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

end

% --- Executes on key press with focus on toogglebutton_hold_button and none of its controls.
function toogglebutton_hold_button_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to toogglebutton_hold_button (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
end



