classdef Client_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        Button                 matlab.ui.control.StateButton
        Button_1               matlab.ui.control.StateButton
        Button_2               matlab.ui.control.StateButton
        Button_3               matlab.ui.control.StateButton
        Button_4               matlab.ui.control.StateButton
        Button_5               matlab.ui.control.StateButton
        Button_6               matlab.ui.control.StateButton
        Button_7               matlab.ui.control.StateButton
        Button_8               matlab.ui.control.StateButton
        Button_9               matlab.ui.control.StateButton
        Button_10              matlab.ui.control.StateButton
        Button_11              matlab.ui.control.StateButton
        Button_12              matlab.ui.control.StateButton
        Button_13              matlab.ui.control.StateButton
        Button_14              matlab.ui.control.StateButton
        Button_15              matlab.ui.control.StateButton
        Button_16              matlab.ui.control.StateButton
        Button_17              matlab.ui.control.StateButton
        Button_18              matlab.ui.control.StateButton
        Button_19              matlab.ui.control.StateButton
        Image                  matlab.ui.control.Image
        DropButton             matlab.ui.control.Button
        Button_20              matlab.ui.control.StateButton
        Button_21              matlab.ui.control.StateButton
        Button_22              matlab.ui.control.StateButton
        TakeButton             matlab.ui.control.Button
        Image_2                matlab.ui.control.Image
        Image_3                matlab.ui.control.Image
        Image2                 matlab.ui.control.Image
        EditField_2            matlab.ui.control.NumericEditField
        Image2_2               matlab.ui.control.Image
        EditField_3            matlab.ui.control.NumericEditField
        Label                  matlab.ui.control.Label
        Label_1                matlab.ui.control.Label
        Label_2                matlab.ui.control.Label
        SCOREEditField_3Label  matlab.ui.control.Label
        SCOREEditField         matlab.ui.control.NumericEditField
        SCOREEditField_4Label  matlab.ui.control.Label
        SCOREEditField_1       matlab.ui.control.NumericEditField
        SCOREEditField_5Label  matlab.ui.control.Label
        SCOREEditField_2       matlab.ui.control.NumericEditField
    end

    
    properties (Access = private)
        bottons % Description
    end
    
    methods (Access = private)
        
        function moveUp(app, staff)
            staff.Position = staff.Position + [0, 20, 0, 0];
        end
        function moveDown(app, staff)
            staff.Position = staff.Position - [0, 20, 0, 0];
        end
        function updateCards(app, cards)
            numberOfCard = length(cards);
            indent = floor((20 - numberOfCard)/2);
            for idx = 1:numberOfCard
                app.bottons(idx+indent).Icon = cards(idx).Icon;
            end            
        end
        
    end
    
    methods (Access = public)
        
        function results = initialize(app, cards)
            app.bottons = [app.Button, app.Button_1, app.Button_2, app.Button_3, app.Button_4, app.Button_5, app.Button_6, app.Button_7, app.Button_8, app.Button_9, app.Button_10, app.Button_11, app.Button_12, app.Button_13, app.Button_14, app.Button_15, app.Button_16, app.Button_17, app.Button_18, app.Button_19];
            app.updateCards(cards);
        end
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: Button
        function ButtonValueChanged(app, event)
            value = app.Button.Value;
            if (value)
                app.moveUp(app.Button)
                app.updateCards([1,2,3])
                %app.Button.Position
            else
                app.moveDown(app.Button)
            end
        end

        % Value changed function: Button_1
        function Button_1ValueChanged(app, event)
            value = app.Button_1.Value;
            if (value)
                app.moveUp(app.Button_1)
                %app.Button.Position
            else
                app.moveDown(app.Button_1)
            end
        end

        % Value changed function: Button_2
        function Button_2ValueChanged(app, event)
            value = app.Button_2.Value;
            if (value)
                app.moveUp(app.Button_2)
                %app.Button.Position
            else
                app.moveDown(app.Button_2)
            end
        end

        % Value changed function: Button_3
        function Button_3ValueChanged(app, event)
            value = app.Button_3.Value;
            if (value)
                app.moveUp(app.Button_3)
                %app.Button.Position
            else
                app.moveDown(app.Button_3)
            end
        end

        % Value changed function: Button_4
        function Button_4ValueChanged(app, event)
            value = app.Button_4.Value;
            if (value)
                app.moveUp(app.Button_4)
                %app.Button.Position
            else
                app.moveDown(app.Button_4)
            end
        end

        % Value changed function: Button_5
        function Button_5ValueChanged(app, event)
            value = app.Button_5.Value;
            if (value)
                app.moveUp(app.Button_5)
                %app.Button.Position
            else
                app.moveDown(app.Button_5)
            end
        end

        % Value changed function: Button_6
        function Button_6ValueChanged(app, event)
            value = app.Button_6.Value;
            if (value)
                app.moveUp(app.Button_6)
                %app.Button.Position
            else
                app.moveDown(app.Button_6)
            end
        end

        % Value changed function: Button_7
        function Button_7ValueChanged(app, event)
            value = app.Button_7.Value;
            if (value)
                app.moveUp(app.Button_7)
                %app.Button.Position
            else
                app.moveDown(app.Button_7)
            end
        end

        % Value changed function: Button_8
        function Button_8ValueChanged(app, event)
            value = app.Button_8.Value;
            if (value)
                app.moveUp(app.Button_8)
                %app.Button.Position
            else
                app.moveDown(app.Button_8)
            end
        end

        % Value changed function: Button_9
        function Button_9ValueChanged(app, event)
            value = app.Button_9.Value;
            if (value)
                app.moveUp(app.Button_9)
                %app.Button.Position
            else
                app.moveDown(app.Button_9)
            end
        end

        % Value changed function: Button_10
        function Button_10ValueChanged(app, event)
            value = app.Button_10.Value;
            if (value)
                app.moveUp(app.Button_10)
                %app.Button.Position
            else
                app.moveDown(app.Button_10)
            end
        end

        % Value changed function: Button_11
        function Button_11ValueChanged(app, event)
            value = app.Button_11.Value;
            if (value)
                app.moveUp(app.Button_11)
                %app.Button.Position
            else
                app.moveDown(app.Button_11)
            end
        end

        % Value changed function: Button_12
        function Button_12ValueChanged(app, event)
            value = app.Button_12.Value;
            if (value)
                app.moveUp(app.Button_12)
                %app.Button.Position
            else
                app.moveDown(app.Button_12)
            end
        end

        % Value changed function: Button_13
        function Button_13ValueChanged(app, event)
            value = app.Button_13.Value;
            if (value)
                app.moveUp(app.Button_13)
                %app.Button.Position
            else
                app.moveDown(app.Button_13)
            end
        end

        % Value changed function: Button_14
        function Button_14ValueChanged(app, event)
            value = app.Button_14.Value;
            if (value)
                app.moveUp(app.Button_14)
                %app.Button.Position
            else
                app.moveDown(app.Button_14)
            end
        end

        % Value changed function: Button_15
        function Button_15ValueChanged(app, event)
            value = app.Button_15.Value;
            if (value)
                app.moveUp(app.Button_15)
                %app.Button.Position
            else
                app.moveDown(app.Button_15)
            end
        end

        % Value changed function: Button_16
        function Button_16ValueChanged(app, event)
            value = app.Button_16.Value;
            if (value)
                app.moveUp(app.Button_16)
                %app.Button.Position
            else
                app.moveDown(app.Button_16)
            end
        end

        % Value changed function: Button_17
        function Button_17ValueChanged(app, event)
            value = app.Button_17.Value;
            if (value)
                app.moveUp(app.Button_17)
                %app.Button.Position
            else
                app.moveDown(app.Button_17)
            end
        end

        % Value changed function: Button_18
        function Button_18ValueChanged(app, event)
            value = app.Button_18.Value;
            if (value)
                app.moveUp(app.Button_18)
                %app.Button.Position
            else
                app.moveDown(app.Button_18)
            end
        end

        % Value changed function: Button_19
        function Button_19ValueChanged(app, event)
            value = app.Button_19.Value;
            if (value)
                app.moveUp(app.Button_19)
                %app.Button.Position
            else
                app.moveDown(app.Button_19)
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 831 591];
            app.UIFigure.Name = 'UI Figure';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'state');
            app.Button.ValueChangedFcn = createCallbackFcn(app, @ButtonValueChanged, true);
            app.Button.Text = '';
            app.Button.Position = [168 35 66 91];

            % Create Button_1
            app.Button_1 = uibutton(app.UIFigure, 'state');
            app.Button_1.ValueChangedFcn = createCallbackFcn(app, @Button_1ValueChanged, true);
            app.Button_1.Text = '';
            app.Button_1.Position = [195 35 66 91];

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'state');
            app.Button_2.ValueChangedFcn = createCallbackFcn(app, @Button_2ValueChanged, true);
            app.Button_2.Text = '';
            app.Button_2.Position = [224 35 66 91];

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'state');
            app.Button_3.ValueChangedFcn = createCallbackFcn(app, @Button_3ValueChanged, true);
            app.Button_3.Text = '';
            app.Button_3.Position = [251 35 66 91];

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'state');
            app.Button_4.ValueChangedFcn = createCallbackFcn(app, @Button_4ValueChanged, true);
            app.Button_4.Text = '';
            app.Button_4.Position = [280 35 66 91];

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'state');
            app.Button_5.ValueChangedFcn = createCallbackFcn(app, @Button_5ValueChanged, true);
            app.Button_5.Text = '';
            app.Button_5.Position = [307 35 66 91];

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'state');
            app.Button_6.ValueChangedFcn = createCallbackFcn(app, @Button_6ValueChanged, true);
            app.Button_6.Text = '';
            app.Button_6.Position = [336 35 66 91];

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'state');
            app.Button_7.ValueChangedFcn = createCallbackFcn(app, @Button_7ValueChanged, true);
            app.Button_7.Text = '';
            app.Button_7.Position = [363 35 66 91];

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'state');
            app.Button_8.ValueChangedFcn = createCallbackFcn(app, @Button_8ValueChanged, true);
            app.Button_8.Text = '';
            app.Button_8.Position = [392 35 66 91];

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'state');
            app.Button_9.ValueChangedFcn = createCallbackFcn(app, @Button_9ValueChanged, true);
            app.Button_9.Text = '';
            app.Button_9.Position = [419 35 66 91];

            % Create Button_10
            app.Button_10 = uibutton(app.UIFigure, 'state');
            app.Button_10.ValueChangedFcn = createCallbackFcn(app, @Button_10ValueChanged, true);
            app.Button_10.Text = '';
            app.Button_10.Position = [448 35 66 91];

            % Create Button_11
            app.Button_11 = uibutton(app.UIFigure, 'state');
            app.Button_11.ValueChangedFcn = createCallbackFcn(app, @Button_11ValueChanged, true);
            app.Button_11.Text = '';
            app.Button_11.Position = [475 35 66 91];

            % Create Button_12
            app.Button_12 = uibutton(app.UIFigure, 'state');
            app.Button_12.ValueChangedFcn = createCallbackFcn(app, @Button_12ValueChanged, true);
            app.Button_12.Text = '';
            app.Button_12.Position = [504 35 66 91];

            % Create Button_13
            app.Button_13 = uibutton(app.UIFigure, 'state');
            app.Button_13.ValueChangedFcn = createCallbackFcn(app, @Button_13ValueChanged, true);
            app.Button_13.Text = '';
            app.Button_13.Position = [531 35 66 91];

            % Create Button_14
            app.Button_14 = uibutton(app.UIFigure, 'state');
            app.Button_14.ValueChangedFcn = createCallbackFcn(app, @Button_14ValueChanged, true);
            app.Button_14.Text = '';
            app.Button_14.Position = [560 35 66 91];

            % Create Button_15
            app.Button_15 = uibutton(app.UIFigure, 'state');
            app.Button_15.ValueChangedFcn = createCallbackFcn(app, @Button_15ValueChanged, true);
            app.Button_15.Text = '';
            app.Button_15.Position = [587 35 66 91];

            % Create Button_16
            app.Button_16 = uibutton(app.UIFigure, 'state');
            app.Button_16.ValueChangedFcn = createCallbackFcn(app, @Button_16ValueChanged, true);
            app.Button_16.Text = '';
            app.Button_16.Position = [616 35 66 91];

            % Create Button_17
            app.Button_17 = uibutton(app.UIFigure, 'state');
            app.Button_17.ValueChangedFcn = createCallbackFcn(app, @Button_17ValueChanged, true);
            app.Button_17.Text = '';
            app.Button_17.Position = [643 35 66 91];

            % Create Button_18
            app.Button_18 = uibutton(app.UIFigure, 'state');
            app.Button_18.ValueChangedFcn = createCallbackFcn(app, @Button_18ValueChanged, true);
            app.Button_18.Text = '';
            app.Button_18.Position = [672 35 66 91];

            % Create Button_19
            app.Button_19 = uibutton(app.UIFigure, 'state');
            app.Button_19.ValueChangedFcn = createCallbackFcn(app, @Button_19ValueChanged, true);
            app.Button_19.Text = '';
            app.Button_19.Position = [699 35 66 91];

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [69 30 100 100];

            % Create DropButton
            app.DropButton = uibutton(app.UIFigure, 'push');
            app.DropButton.FontSize = 20;
            app.DropButton.Position = [172 152 91 41];
            app.DropButton.Text = 'Drop';

            % Create Button_20
            app.Button_20 = uibutton(app.UIFigure, 'state');
            app.Button_20.Enable = 'off';
            app.Button_20.Icon = '0.jpg';
            app.Button_20.Text = '';
            app.Button_20.Position = [404 453 41 56];

            % Create Button_21
            app.Button_21 = uibutton(app.UIFigure, 'state');
            app.Button_21.Enable = 'off';
            app.Button_21.Icon = '0.jpg';
            app.Button_21.Text = '';
            app.Button_21.Position = [361 453 41 56];

            % Create Button_22
            app.Button_22 = uibutton(app.UIFigure, 'state');
            app.Button_22.Enable = 'off';
            app.Button_22.Icon = '0.jpg';
            app.Button_22.Text = '';
            app.Button_22.Position = [444 453 41 56];

            % Create TakeButton
            app.TakeButton = uibutton(app.UIFigure, 'push');
            app.TakeButton.FontSize = 20;
            app.TakeButton.Position = [285 152 91 41];
            app.TakeButton.Text = 'Take!';

            % Create Image_2
            app.Image_2 = uiimage(app.UIFigure);
            app.Image_2.Position = [69 431 100 100];

            % Create Image_3
            app.Image_3 = uiimage(app.UIFigure);
            app.Image_3.Position = [682 431 100 100];

            % Create Image2
            app.Image2 = uiimage(app.UIFigure);
            app.Image2.Position = [88 309 62 89];
            app.Image2.ImageSource = '0.jpg';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_2.Editable = 'off';
            app.EditField_2.FontSize = 20;
            app.EditField_2.FontColor = [0 0.4471 0.7412];
            app.EditField_2.Position = [102 335 35 35];
            app.EditField_2.Value = 17;

            % Create Image2_2
            app.Image2_2 = uiimage(app.UIFigure);
            app.Image2_2.Position = [701 309 62 89];
            app.Image2_2.ImageSource = '0.jpg';

            % Create EditField_3
            app.EditField_3 = uieditfield(app.UIFigure, 'numeric');
            app.EditField_3.Editable = 'off';
            app.EditField_3.FontSize = 20;
            app.EditField_3.FontColor = [0 0.4471 0.7412];
            app.EditField_3.Position = [715 335 35 35];
            app.EditField_3.Value = 17;

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.FontSize = 20;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.851 0.3255 0.098];
            app.Label.Position = [69 162 57 31];

            % Create Label_1
            app.Label_1 = uilabel(app.UIFigure);
            app.Label_1.FontSize = 20;
            app.Label_1.FontWeight = 'bold';
            app.Label_1.FontColor = [0.851 0.3255 0.098];
            app.Label_1.Position = [172 500 57 31];

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.FontSize = 20;
            app.Label_2.FontWeight = 'bold';
            app.Label_2.FontColor = [0.851 0.3255 0.098];
            app.Label_2.Position = [625 500 57 31];

            % Create SCOREEditField_3Label
            app.SCOREEditField_3Label = uilabel(app.UIFigure);
            app.SCOREEditField_3Label.HorizontalAlignment = 'right';
            app.SCOREEditField_3Label.Position = [69 131 48 22];
            app.SCOREEditField_3Label.Text = 'SCORE';

            % Create SCOREEditField
            app.SCOREEditField = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField.Editable = 'off';
            app.SCOREEditField.HorizontalAlignment = 'center';
            app.SCOREEditField.Position = [125 131 33 22];

            % Create SCOREEditField_4Label
            app.SCOREEditField_4Label = uilabel(app.UIFigure);
            app.SCOREEditField_4Label.HorizontalAlignment = 'right';
            app.SCOREEditField_4Label.Position = [172 470 48 22];
            app.SCOREEditField_4Label.Text = 'SCORE';

            % Create SCOREEditField_1
            app.SCOREEditField_1 = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField_1.Editable = 'off';
            app.SCOREEditField_1.HorizontalAlignment = 'center';
            app.SCOREEditField_1.Position = [228 470 33 22];

            % Create SCOREEditField_5Label
            app.SCOREEditField_5Label = uilabel(app.UIFigure);
            app.SCOREEditField_5Label.HorizontalAlignment = 'right';
            app.SCOREEditField_5Label.Position = [587 470 48 22];
            app.SCOREEditField_5Label.Text = 'SCORE';

            % Create SCOREEditField_2
            app.SCOREEditField_2 = uieditfield(app.UIFigure, 'numeric');
            app.SCOREEditField_2.Editable = 'off';
            app.SCOREEditField_2.HorizontalAlignment = 'center';
            app.SCOREEditField_2.Position = [643 470 33 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Client_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end