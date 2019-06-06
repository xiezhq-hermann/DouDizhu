classdef Starter_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        StartGameButton           matlab.ui.control.Button
        ImFeelingLuckyCheckBox    matlab.ui.control.CheckBox
        YourNameEditField_2Label  matlab.ui.control.Label
        YourNameEditField         matlab.ui.control.EditField
        Label                     matlab.ui.control.Label
        ExitButton                matlab.ui.control.Button
        NamePleaseLabel           matlab.ui.control.Label
        LoadingLabel              matlab.ui.control.Label
    end

    properties (Access = public)
            indicator = 0 % 0 means nothing, 1 means start, -1 means exit
            nickname = "null"
            lucky = 0
    end    
    methods (Access = public)
        function [indicator, nickname] = exec(app)
            %waitfor(app.indicator)
            while (app.indicator == 0)
                pause(0.01) % 10ms pin
            end
            indicator = app.indicator;
            nickname = app.nickname;
        end
        function [indicator, nickname] = getName(app)
            indicator = app.indicator;
            nickname = app.nickname;
        end
    end    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, x, y)
            app.UIFigure.Position = [x y 640 480];
        end

        % Value changed function: ImFeelingLuckyCheckBox
        function notLucky(app, event)
            value = app.ImFeelingLuckyCheckBox.Value;    
        end

        % Button pushed function: StartGameButton
        function startgame(app, event)
            if (app.nickname == "null")
                app.NamePleaseLabel.Visible = 'on';
                return
            end
            app.indicator = 1;
            app.LoadingLabel.Visible = 'on';
        end

        % Button pushed function: ExitButton
        function exitgame(app, event)
            app.indicator = -1;
            app.LoadingLabel.Visible = 'on';
        end

        % Value changing function: YourNameEditField
        function setName(app, event)
            changingValue = event.Value;
            app.nickname = changingValue;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9412 0.9412 0.9412];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create StartGameButton
            app.StartGameButton = uibutton(app.UIFigure, 'push');
            app.StartGameButton.ButtonPushedFcn = createCallbackFcn(app, @startgame, true);
            app.StartGameButton.FontSize = 30;
            app.StartGameButton.Position = [213 150 217 106];
            app.StartGameButton.Text = 'Start Game';

            % Create ImFeelingLuckyCheckBox
            app.ImFeelingLuckyCheckBox = uicheckbox(app.UIFigure);
            app.ImFeelingLuckyCheckBox.ValueChangedFcn = createCallbackFcn(app, @notLucky, true);
            app.ImFeelingLuckyCheckBox.Text = 'I''m Feeling Lucky';
            app.ImFeelingLuckyCheckBox.FontSize = 20;
            app.ImFeelingLuckyCheckBox.Position = [464 150 177 42];
            app.ImFeelingLuckyCheckBox.Value = true;

            % Create YourNameEditField_2Label
            app.YourNameEditField_2Label = uilabel(app.UIFigure);
            app.YourNameEditField_2Label.HorizontalAlignment = 'right';
            app.YourNameEditField_2Label.FontSize = 30;
            app.YourNameEditField_2Label.Position = [240 307 163 42];
            app.YourNameEditField_2Label.Text = 'Your Name!';

            % Create YourNameEditField
            app.YourNameEditField = uieditfield(app.UIFigure, 'text');
            app.YourNameEditField.ValueChangingFcn = createCallbackFcn(app, @setName, true);
            app.YourNameEditField.FontSize = 30;
            app.YourNameEditField.Position = [226 269 190 39];

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontSize = 50;
            app.Label.FontWeight = 'bold';
            app.Label.FontColor = [0.7176 0.2745 1];
            app.Label.Position = [178 348 288 112];
            app.Label.Text = 'ÿÿÿÿÿ';

            % Create ExitButton
            app.ExitButton = uibutton(app.UIFigure, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @exitgame, true);
            app.ExitButton.FontSize = 30;
            app.ExitButton.Position = [213 19 217 106];
            app.ExitButton.Text = 'Exit';

            % Create NamePleaseLabel
            app.NamePleaseLabel = uilabel(app.UIFigure);
            app.NamePleaseLabel.FontSize = 16;
            app.NamePleaseLabel.FontColor = [1 0 0];
            app.NamePleaseLabel.Visible = 'off';
            app.NamePleaseLabel.Position = [429 277 105 22];
            app.NamePleaseLabel.Text = 'Name Please!';

            % Create LoadingLabel
            app.LoadingLabel = uilabel(app.UIFigure);
            app.LoadingLabel.FontSize = 16;
            app.LoadingLabel.FontColor = [0 0.4471 0.7412];
            app.LoadingLabel.Visible = 'off';
            app.LoadingLabel.Position = [286 127 72 21];
            app.LoadingLabel.Text = 'Loading...';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Starter_exported(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

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