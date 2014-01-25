function varargout = GUI_v1_10(varargin)
%% GUI_V1_10 MATLAB code for GUI_v1_10.fig

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_v1_10_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_v1_10_OutputFcn, ...
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

% --- Executes just before GUI_v1_10 is made visible.
function GUI_v1_10_OpeningFcn(hObject, eventdata, handles, varargin)

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
handles.eps_min = zeros(1,3);
for i = 1:3
    handles.eps_min(i) = -0.2;
end

handles.eps_max = zeros(1,3);
for i = 1:3
    handles.eps_max(i) = 0.2;
end

handles.eps_inc = zeros(1,3);
for i = 1:3
    handles.eps_inc(i) = 0.1;
end


% Epsilon Single Value
handles.eps_nsi = zeros(1,3);
for i = 1:3
    handles.eps_nsi(i) = 0;
end


% Default hierarchy and type
set(handles.panel_hierarchy, 'SelectedObject', handles.hierarchy_1);
set(handles.panel_type, 'SelectedObject', handles.type_1);

% Normal Hierarchy = 1 and Neutrino = 1
handles.h1 = 1;
handles.h2 = 0;

handles.t1 = 1;
handles.t2 = 0;

% Experiment
handles.experiment = 0;

% Calculation Type
handles.isEventRate = 0;

% Plottin is for a Range or Single
handles.isRange = 0;
% epsilon_ee = 1
% epsilon_et = 2
% epsilon_tt = 3
handles.rangeEps = 0;


% Default Hold Button
handles.hold_button_check = 0;

% Read Flux Files Once when the GUI Starts
% experiment = 1 for MINOS
% experiment = 0 for NOVA
[handles.Flux_Energy_MINOS,handles.n_nu_mu_10_MINOS] = Read_Flux_Files(1);
[handles.Flux_Energy_NOVA,handles.n_nu_mu_10_NOVA] = Read_Flux_Files(0);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_v1_10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = GUI_v1_10_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end



%% CallBack Functions
% Hints: get(hObject,'String') returns contents of edit_delta_dirac as text
%        str2double(get(hObject,'String')) returns contents of Text Box as a double

function distance_box_Callback(hObject, eventdata, handles)
    
    distance = str2double(get(hObject,'String'));

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

    handles.eps_min(2) = eps_et_min;
    guidata(hObject,handles)

end

function edit_eps_et_max_Callback(hObject, eventdata, handles)

    eps_et_max=str2double(get(hObject,'String'));
    
    if isnan(eps_et_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_max(2) = eps_et_max;
    guidata(hObject,handles)

end

function edit_eps_et_inc_Callback(hObject, eventdata, handles)

    eps_et_inc=str2double(get(hObject,'String'));

    if isnan(eps_et_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_inc(2) = eps_et_inc;
    guidata(hObject,handles)

end


function edit_eps_tt_min_Callback(hObject, eventdata, handles)

    eps_tt_min=str2double(get(hObject,'String'));
    if isnan(eps_tt_min)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_min(3) = eps_tt_min;
    guidata(hObject,handles)

end

function edit_eps_tt_max_Callback(hObject, eventdata, handles)

    eps_tt_max=str2double(get(hObject,'String'));
    if isnan(eps_tt_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_max(3) = eps_tt_max;
    guidata(hObject,handles)

end

function edit_eps_tt_inc_Callback(hObject, eventdata, handles)

    eps_tt_inc=str2double(get(hObject,'String'));
    if isnan(eps_tt_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_inc(3) = eps_tt_inc;
    guidata(hObject,handles)

end

function edit_eps_ee_min_Callback(hObject, eventdata, handles)

    eps_ee_min=str2double(get(hObject,'String'));
    if isnan(eps_ee_min)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_min(1) = eps_ee_min;
    guidata(hObject,handles)

end

function edit_eps_ee_max_Callback(hObject, eventdata, handles)

    eps_ee_max=str2double(get(hObject,'String'));
    if isnan(eps_ee_max)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_max(1) = eps_ee_max;
    guidata(hObject,handles)

end

function edit_eps_ee_inc_Callback(hObject, eventdata, handles)

    eps_ee_inc=str2double(get(hObject,'String'));
    if isnan(eps_ee_inc)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_inc(1) = eps_ee_inc;
    guidata(hObject,handles)

end

function eps_ee_nsi_Callback(hObject, eventdata, handles)

    eps_ee_nsi=str2double(get(hObject,'String'));
    if isnan(eps_ee_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_nsi(1) = eps_ee_nsi;
    guidata(hObject,handles)

end

function eps_et_nsi_Callback(hObject, eventdata, handles)

    eps_et_nsi=str2double(get(hObject,'String'));
    if isnan(eps_et_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_nsi(2) = eps_et_nsi;
    guidata(hObject,handles)

end

function eps_tt_nsi_Callback(hObject, eventdata, handles)

    eps_tt_nsi=str2double(get(hObject,'String'));
    if isnan(eps_tt_nsi)
        set(hObject, 'String', 0);
        errordlg('Input must be a number','Error');
    end

    handles.eps_nsi(3) = eps_tt_nsi;
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

% Main function controlling the Calculations and Plotting
function mainFunc(hObject,handles)

% Create waitbar
wb = waitbar(0,'');

% Create Axes
axes(handles.axes1);

% Control Plot Color if Hold ON Pressed
if handles.color_check == 1
    if handles.color_indice < handles.color_indice_max
        handles.color_indice = handles.color_indice + 1;
    else
        handles.color_indice = 1;
    end
else
    handles.color_indice = 1;
end

% Plot Result with given parameters
handles.check_par = Plot_Request(...
    handles,...
    wb);


% Close Waitbar
close(wb);

% Call GUI_Parameters Window
GUI_Parameters(handles.check_par);

% Update handles 
guidata(hObject,handles);

end


% Probability: Muon - Electron
function M_E_NSI_Probability_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 0;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 0;
handles.experiment = 0;

% Update handles 
guidata(hObject,handles);

    
% Call Main Funct
mainFunc(hObject,handles);


end

% --- Event Rate: MINOS
function button_minos_flux_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 0;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 1;
handles.experiment = 1;

% Update handles 
guidata(hObject,handles);

% Call Main Funct
mainFunc(hObject,handles);



end

% --- Event Rate: NOVA
function button_event_rate_nova_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 0;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 1;
handles.experiment = 0;

% Update handles 
guidata(hObject,handles);

% Call Main Funct
mainFunc(hObject,handles);



end

% --- Probability Eps_ee Range
function Eps_ee_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 1;
handles.rangeEps = 1;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 0;
handles.experiment = 0;


% Update handles 
guidata(hObject,handles);

% Call Main Funct
mainFunc(hObject,handles);

end

% --- Probability Eps_et Range
function Eps_et_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 1;
handles.rangeEps = 2;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 0;
handles.experiment = 0;


% Update handles 
guidata(hObject,handles);

% Call Main Funct
mainFunc(hObject,handles);

end

% --- Probability Eps_tt Range
function Eps_tt_Callback(hObject, eventdata, handles)

% Set isRange for Plotting
handles.isRange = 1;
handles.rangeEps = 3;

% Set Event Rate and Experiment Parameters
handles.isEventRate = 0;
handles.experiment = 0;


% Update handles 
guidata(hObject,handles);

% Call Main Funct
mainFunc(hObject,handles);

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

