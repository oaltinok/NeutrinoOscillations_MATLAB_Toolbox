function varargout = GUI_Parameters(varargin)
% GUI_PARAMETERS MATLAB code for GUI_Parameters.fig
%      GUI_PARAMETERS, by itself, creates a new GUI_PARAMETERS or raises the existing
%      singleton*.
%
%      H = GUI_PARAMETERS returns the handle to a new GUI_PARAMETERS or the handle to
%      the existing singleton*.
%
%      GUI_PARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PARAMETERS.M with the given input arguments.
%
%      GUI_PARAMETERS('Property','Value',...) creates a new GUI_PARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Parameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Parameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Parameters

% Last Modified by GUIDE v2.5 25-Jan-2014 14:52:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Parameters_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Parameters_OutputFcn, ...
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


% --- Executes just before GUI_Parameters is made visible.
function GUI_Parameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Parameters (see VARARGIN)

% Choose default command line output for GUI_Parameters
handles.output = hObject;

handles.check_par = varargin{1};


set(handles.text_theta_13, 'String', handles.check_par{1});
set(handles.text_theta_12, 'String', handles.check_par{3});
set(handles.text_theta_23, 'String', handles.check_par{2});
    
set(handles.text_m31, 'String', handles.check_par{4});
set(handles.text_ve, 'String', handles.check_par{5});
set(handles.text_d_delta, 'String', handles.check_par{6});
set(handles.text_nsi_delta, 'String', handles.check_par{7});
    

set(handles.text_eps_ee, 'String', handles.check_par{8});
set(handles.text_eps_et, 'String', handles.check_par{9});
set(handles.text_eps_tt, 'String', handles.check_par{10});

set(handles.text_distance, 'String', handles.check_par{11});

set(handles.text_warning, 'String', handles.check_par{12});


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Parameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Parameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
